# 6.2.7 Ensure all users' home directories exist (Scored)
#
#
# Description:
# Users can be defined in /etc/passwd without a home directory or with a home directory that does not actually exist.
#
# @summary 6.2.7 Ensure all users' home directories exist (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_7
  class secure_linux_cis::redhat7::cis_6_2_7 (
  Boolean $enforced = true,
) {

  if $enforced {
    file { '/var/home_directory_cis.sh':
      source => 'puppet:///modules/secure_linux_cis/home_directory.sh',
      notify => Exec['home_dir'],
    }
    exec { 'home_dir':
      command   => '/usr/./home_directory_cis.sh',
      subscribe => File['/var/home_directory_cis.sh'],
    }
  }
}
