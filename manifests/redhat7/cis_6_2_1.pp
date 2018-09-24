# 6.2.1 Ensure password fields are not empty (Scored)
#
#
# Description:
# An account with an empty password field means that anybody may log in as that user without providing a password.
#
# @summary 6.2.1 Ensure password fields are not empty (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_1
class secure_linux_cis::redhat7::cis_6_2_1 (
  Boolean $enforced = true,
) {

  if $enforced {
    exec {'no_password':
      command => "/etc/cat /etc/shadow | awk -F: '(\$2 == \"\" ) { print \$1 \" does not have a password \"}\'",
    }
  }
}
