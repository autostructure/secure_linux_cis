# 1.1.9 Ensure nosuid option set on /var/tmp partition (Scored)
#
#
# Description:
# The nosuid mount option specifies that the filesystem cannot contain setuid files.
#
# @summary 1.1.9 Ensure nosuid option set on /var/tmp partition (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_9
class secure_linux_cis::redhat7::cis_1_1_9 (
  Boolean $enforced = true,
  ) {
    if $enforced {

      if $facts['var_tmp_partition'] {

        if $facts['var_tmp_partition_nosuid'] == '' {
          notify { 'vtpn':
            message  => '[1.1.9] The nosuid option is not set on the /var/tmp partition',
            loglevel => 'warning',
          }
      }
    }
  }
}
