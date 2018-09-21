require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_6_1_14' do
  on_supported_os.each do |os, _os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { 'sgid_files' == 'true' }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            # rubocop:disable Metrics/LineLength
            is_expected.to contain_notify('"You have SGID files on your system. It is recommended to verify that the files have md5 checksums that match with their corresponding package. The files are: true":')
          }
        else
          it { is_expected.not_to contain_notify('"You have SGID files on your system. It is recommended to verify that the files have md5 checksums that match with their corresponding package. The files are: true":') }
          # rubocop:enable Metrics/LineLength
        end
      end
    end
  end
end
