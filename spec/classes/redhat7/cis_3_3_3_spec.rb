require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_3_3_3' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'ipv6_enabled' => false } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_shellvar('GRUB_CMDLINE_LINUX cis_3_3_3')
              .with(
                ensure: 'present',
                variable: 'GRUB_CMDLINE_LINUX',
                target: '/etc/default/grub',
                value: 'ipv6.disable=1',
                array_append: true,
              )
            is_expected.to contain_exec('reload grub2 configuration 3_3_3')
              .with(
                command: '/sbin/grub2-mkconfig > /boot/grub2/grub.cfg',
                refreshonly: true,
              )
          }
        else
          it {
            is_expected.not_to contain_shellvar('GRUB_CMDLINE_LINUX')
            is_expected.not_to contain_exec('reload grub2 configuration 3_3_3')
          }
        end
      end
    end
  end
end
