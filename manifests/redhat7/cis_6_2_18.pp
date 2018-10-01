# 6.2.18 Ensure no duplicate user names exist (Scored)
#
#
# Description:
# Although the useradd program will not let you create a duplicate user name, it is possible for an administrator to manually
# edit the /etc/passwd file and change the user name.
#
# @summary 6.2.18 Ensure no duplicate user names exist (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_18
  class secure_linux_cis::redhat7::cis_6_2_18 (
  Boolean $enforced = true,
) {

  if $enforced {
    if $facts[ 'duplicate_user' ] {
      notify { 'dusr':
        message => 'There is a duplicate user name(s) in /etc/passwd',
      }
    }
  }
}
