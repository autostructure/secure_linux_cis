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

    file { '/tmp/cis_scripts/dup_group.sh':
      owner  => 'root',
      group  => 'root',
      mode   => '0711',
      source => 'puppet:///modules/secure_linux_cis/dup_group.sh',
    }

    if $facts[ 'duplicate_group' ] {
      notify { 'dgrp':
        message  => '[6.2.19] There is a duplicate group name(s) in /etc/group. Check the duplicate_group fact for details',
        loglevel => 'warning',
      }
    }
  }
}
