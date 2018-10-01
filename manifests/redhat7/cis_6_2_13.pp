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
    if $facts[ 'netrc_access' ] {
      notify { 'na':
        message => '[6.2.13] There are .netrc files that are either group or world accessible'}
    }
  }
}
