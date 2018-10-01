# 6.2.14 Ensure no users have .rhosts files (Scored)
#
#
# Description:
# While no .rhosts files are shipped by default, users can easily create them.
#
# @summary 6.2.14 Ensure no users have .rhosts files (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_14
  class secure_linux_cis::redhat7::cis_6_2_14 (
  Boolean $enforced = true,
) {

  if $enforced {
    if $facts[ 'rhost_files' ] {
      notify { 'rf':
        message  => '[6.2.14] A user(s) has .rhost files in their home directory',
        loglevel => 'warning',
      }
    }
  }
}
