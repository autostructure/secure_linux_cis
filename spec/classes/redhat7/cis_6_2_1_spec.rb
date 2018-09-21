require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_6_2_1' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_exec("cat /etc/shadow | awk -F: '(\$2 == \"\" ) { print \$1 \" does not have a password \"}'")
          }
        else
          it { is_expected.not_to contain_exec("cat /etc/shadow | awk -F: '(\$2 == \"\" ) { print \$1 \" does not have a password \"}'") }
        end
      end
    end
  end
end
