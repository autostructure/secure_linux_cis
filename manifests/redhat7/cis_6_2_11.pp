# 6.2.11 Ensure no users have .forward files (Scored)
#
#
# Description:
# The .forward file specifies an email address to forward the user's mail to.
#
# @summary 6.2.11 Ensure no users have .forward files (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_11
  class secure_linux_cis::redhat7::cis_6_2_11 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/tmp/cis_scripts/forward.sh':
      owner  => 'root',
      group  => 'root',
      mode   => '0711',
      source => 'puppet:///modules/secure_linux_cis/forward.sh',
    }

    if $facts[ 'forward_files' ] {
      notify { 'ff':
        message  => '[6.2.11] There are .forward files on the system. Check the forward_files fact for details',
        loglevel => 'warning',
      }
    }
  }
}
