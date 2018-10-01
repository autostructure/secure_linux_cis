# 6.2.3 Ensure no legacy "+" entries exist in /etc/shadow (Scored)
#
#
# Description:
# The character + in various files used to be markers for systems to insert data from NIS maps at a certain point
# in a system configuration file. These entries are no longer required on most systems, but may exist in files that have been imported
# from other platforms.
#
# @summary 6.2.3 Ensure no legacy "+" entries exist in /etc/shadow (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_3
  class secure_linux_cis::redhat7::cis_6_2_3 (
  Boolean $enforced = true,
) {

  if $enforced {
    if $facts[ 'plus_shadow' ] {
      notify { 'ps':
        message  => '[6.2.3] You have "+" entries in /etc/shadow. It is recommended they are removed',
        loglevel => 'warning',
      }
    }
  }
}
