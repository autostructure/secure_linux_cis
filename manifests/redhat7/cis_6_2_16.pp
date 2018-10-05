# 6.2.16 Ensure no duplicate UIDs exist (Scored)
#
#
# Description:
# Although the useradd program will not let you create a duplicate User ID (UID),
# it is possible for an administrator to manually edit the /etc/passwd file and change the UID field.
#
# @summary 6.2.16 Ensure no duplicate UIDs exist (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_16
  class secure_linux_cis::redhat7::cis_6_2_16 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/tmp/cis_scripts/dup_uid.sh':
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0711',
      source => 'puppet:///modules/secure_linux_cis/dup_uid.sh',
    }

    if $facts[ 'duplicate_uid' ] {
      notify { 'du':
        message  => '[6.2.16] There are duplicate UIDs in /etc/passwd. Check the duplicate_uid fact for details',
        loglevel => 'warning',
      }
    }
  }
}
