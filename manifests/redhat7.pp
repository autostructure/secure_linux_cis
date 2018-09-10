# This is a wrapper class that declares the CIS controls for RedHat Enterprise Linux 7
#
# The RedHat 7 CIS Benchmark is updated for version: 2.2.0
#
# The benchmark can be found here:
# https://downloads.cisecurity.org/
#
# @summary This wrapper class declares CIS controls for the RedHat Enterprise Linux 7 Benchmark v2.2.0
#
# @example
#   include secure_linux_cis::redhat7
class secure_linux_cis::redhat7 {
  include ::secure_linux_cis::redhat7::cis_1_1_1_1
  include ::secure_linux_cis::redhat7::cis_1_1_1_2
  include ::secure_linux_cis::redhat7::cis_1_1_1_3
  include ::secure_linux_cis::redhat7::cis_1_1_1_4
  include ::secure_linux_cis::redhat7::cis_1_1_1_5
  include ::secure_linux_cis::redhat7::cis_1_1_1_6
  include ::secure_linux_cis::redhat7::cis_1_1_1_7
  include ::secure_linux_cis::redhat7::cis_1_1_1_8
}
