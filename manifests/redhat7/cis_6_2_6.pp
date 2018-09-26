# 6.2.6 Ensure root PATH Integrity (Scored)
#
# @summary 6.2.6 Ensure root PATH Integrity (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_6
  class secure_linux_cis::redhat7::cis_6_2_6 (
  Boolean $enforced = true,
) {

  if $enforced {
    if $facts[root_path] {
      notify { 'rp':
        message => 'There is a "." or other writable directory in the root executable path',
      }
    }
  }
}
