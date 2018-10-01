# 6.2.19 Ensure no duplicate group names exist (Scored)
#
#
# Description:
# Although the groupadd program will not let you create a duplicate group name, it is possible for an administrator to manually edit
# the /etc/group file and change the group name.
#
# @summary 6.2.19 Ensure no duplicate group names exist (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_19
  class secure_linux_cis::redhat7::cis_6_2_19 (
  Boolean $enforced = true,
) {

  if $enforced {
    if $facts[ 'duplicate_group' ] {
      notify { 'dgrp':
        message  => '[6.2.19] There is a duplicate group name(s) in /etc/group',
        loglevel => 'warning',
      }
    }
  }
}
