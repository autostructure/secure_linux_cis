require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_6_2_7' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file('/var/home_directory_cis.sh')
            #     .with(
            #       source: 'puppet:///modules/secure_linux_cis/home_directory.sh',
            #       notify: "Exec['home_dir']"
            #         .with(
            #           command: '/usr/./home_directory_cis.sh',
            #           subscribe: "File['/var/home_directory_cis.sh']",
            #         ),
            #     )
            # }
            # it {
            #   is_expected.to contain_exec('home_dir')
            #     .with(
            #       command: '/usr/./home_directory_cis.sh',
            #       subscribe: 'File[\'/var/home_directory_cis.sh\']',
            #     )
          }
        else
          it { is_expected.not_to contain_file('/var/home_directory_cis.sh') }
        end
      end
    end
  end
end
