# 6.2.9 Ensure users own their home directories (Scored)
#
#
# Description:
# The user home directory is space defined for the particular user to set local environment variables and to store personal files.
#
# @summary 6.2.9 Ensure users own their home directories (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_9
  class secure_linux_cis::redhat7::cis_6_2_9 (
  Boolean $enforced = true,
) {

  if $enforced {
    if $facts[ 'home_directory_owner' ] {
      notify { 'hdo':
        message  => '[6.2.9] You have a home directory that is not owned by a user',
        loglevel => 'warning',
      }
    }
  }
}
