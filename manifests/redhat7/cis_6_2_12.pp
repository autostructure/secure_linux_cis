# 6.2.12 Ensure no users have .netrc files (Scored)
#
#
# Description:
# The .netrc file contains data for logging into a remote host for file transfers via FTP.
#
# @summary 6.2.12 Ensure no users have .netrc files (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_12
  class secure_linux_cis::redhat7::cis_6_2_12 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/tmp/cis_scripts/netrc.sh':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0711',
      source => 'puppet:///modules/secure_linux_cis/netrc.sh',
    }

    if $facts[ 'netrc_files' ] {
      notify { 'n':
        message  => '[6.2.12] There are .netrc files on the system. Check the netrc_files fact for details',
        loglevel => 'warning',
      }
    }
  }
}
