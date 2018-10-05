# 6.2.13 Ensure users' .netrc Files are not group or world accessible
#
#
# Description:
# While the system administrator can establish secure permissions for users' .netrc files, the users can easily override these.
#
# @summary 6.2.13 Ensure users' .netrc Files are not group or world accessible
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_13
  class secure_linux_cis::redhat7::cis_6_2_13 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/tmp/cis_scripts/netrc_access.sh':
      owner  => 'root',
      group  => 'root',
      mode   => '0711',
      source => 'puppet:///modules/secure_linux_cis/netrc_access.sh',
    }

    if $facts[ 'netrc_access' ] {
      notify { 'na':
        message  => '[6.2.13] There are .netrc files that are either group or world accessible. Check the netrc_access fact for details',
        loglevel => 'warning',
      }
    }
  }
}
