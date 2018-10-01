# 6.2.10 Ensure users' dot files are not group or world writable (Scored)
#
#
# Description:
# While the system administrator can establish secure permissions for users' "dot" files, the users can easily override these.
#
# @summary 6.2.10 Ensure users' dot files are not group or world writable (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_10
  class secure_linux_cis::redhat7::cis_6_2_10 (
  Boolean $enforced = true,
) {

  if $enforced {
    if $facts[ 'dot_file_writable' ] {
      notify { 'dfw':
        message  => '[6.2.10] There are DOT files that are either group or world writable',
        loglevel => 'warning',
      }
    }
  }
}
