# A description of what this class does
#
# Description:
#
#
# Rationale:
#
#
# @summary A short summary of the purpose of this class
#
# @example
#   include secure_linux_cis::redhat7::cis_5_3_3
class secure_linux_cis::redhat7::cis_5_3_3 (
  Boolean $enforced = true,
  Integer $past_passwords = 5,
) {

  $services = [
    'system-auth',
    'password-auth'
  ]

  if $enforced {

    if $past_passwords < 5 {
      fail('CIS recommends setting old password limit to previous 5.')
    }

    else {

      $services.each | $service | {

        file_line { "password recycle ${service}":
          ensure => 'present',
          path   => "/etc/pam.d/${service}",
          line   => "password sufficient pam_unix.so remember=${past_passwords}",
          match  => '^#?password sufficient pam_unix\.so|^#?password required pam_pwhistory\.so',
        }

      }

    }

  }

}
