# 1.1.15 Ensure nodev option set on /dev/shm partition (Scored)
#
#
# Description:
# The nodev mount option specifies that the filesystem cannot contain special devices.
#
# @summary 1.1.15 Ensure nodev option set on /dev/shm partition (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_15
class secure_linux_cis::redhat7::cis_1_1_15 (
  Boolean $enforced = true,
  ) {

    if $enforced {

      if $facts['shm_nodev'] == false {

        notify { 'sn':
          message  => 'Not in compliance with CIS 1.1.15 (Scored). The "nodev" option is not set on the /dev/shm partition',
          loglevel => 'warning',
        }
      }
    }
}
