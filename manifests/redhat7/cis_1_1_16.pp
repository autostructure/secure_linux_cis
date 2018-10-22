# 1.1.16 Ensure nosuid option set on /dev/shm partition (Scored)
#
#
# Description:
# The nosuid mount option specifies that the filesystem cannot contain setuid files.
#
# @summary 1.1.16 Ensure nosuid option set on /dev/shm partition (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_16
class secure_linux_cis::redhat7::cis_1_1_16 (
  Boolean $enforced = true,
  ) {
    if $enforced {

      if $facts['shm_nosuid'] == '' {

        notify { 'sns':
          message  => '[1.1.16] The "nosuid" option is not enabled on the /dev/shm partition',
          loglevel => 'warning',
        }
      }
    }
}
