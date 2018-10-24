require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_1_4_1' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_exec('grub_own').that_comes_before('Exec[grub_mod]').that_comes_before('Exec[user_own]').that_comes_before('Exec[user_mod]')
          }
        else
          it {
            is_expected.not_to contain_exec('grub_own')
            is_expected.not_to contain_exec('grub_mod')
            is_expected.not_to contain_exec('user_own')
            is_expected.not_to contain_exec('user_mod')
          }
        end
      end
    end
  end
end
