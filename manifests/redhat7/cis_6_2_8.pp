# 6.2.8 Ensure users' home directories permissions are 750 or more restrictive (Scored)
#
#
# Description:
# While the system administrator can establish secure permissions for users' home directories, the users can easily override these.
#
# @summary 6.2.8 Ensure users' home directories permissions are 750 or more restrictive (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_8
  class secure_linux_cis::redhat7::cis_6_2_8 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/tmp/cis_scripts/home_dir_perm.sh':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0711',
      source => 'puppet:///modules/secure_linux_cis/home_dir_perm.sh',
    }

    if $facts[ 'home_directory_permission' ] {
      notify { 'hdp':
        message  => '[6.2.8] One or more user directories have permissions less restrictive than 750. Check the home_directory_permission fact for details', # lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
