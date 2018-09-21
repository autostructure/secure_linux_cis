require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_6_1_13' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { 'suid_files' == 'true' }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_notify('"You have SUID files on your system, which are not recommended. They are: true":')
          }
        else
          it { is_expected.not_to contain_notify('"You have SUID files on your system, which are not recommended. They are: true":') }
        end
      end
    end
  end
end
