# 1.1.13 Ensure separate partition exists for /home (Scored)
#
#
# Description:
# The /home directory is used to support disk storage needs of local users.
#
# @summary 1.1.13 Ensure separate partition exists for /home (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_13
class secure_linux_cis::redhat7::cis_1_1_13 (
  Boolean $enforced = true,
  ) {
    if $enforced {

      if $facts['mount_home'] == '' {

        notify {'mh':
          message  => '[1.1.13] There is not a seperate partition for /home',
          loglevel => 'warning',
        }
      }
    }
}
