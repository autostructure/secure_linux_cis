# 6.2.15 Ensure all groups in /etc/passwd exist in /etc/group (Scored)
#
#
# Description:
# Over time, system administration errors and changes can lead to groups being defined in /etc/passwd but not in /etc/group
#
# @summary 6.2.15 Ensure all groups in /etc/passwd exist in /etc/group (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_15
  class secure_linux_cis::redhat7::cis_6_2_15 (
  Boolean $enforced = true,
) {

  if $enforced {
    if $facts[ 'password_group_exist' ] {
      notify { 'pge':
        message => '[6.2.15] There is a group(s) in /etc/passwd that does not exist in /etc/group',
      }
    }
  }
}
