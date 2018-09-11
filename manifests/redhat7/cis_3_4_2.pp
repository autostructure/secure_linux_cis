# 3.4.2 Ensure /etc/hosts.allow is configured (Scored)
#
# Description:
# The /etc/hosts.allow file specifies which IP addresses are permitted to connect to the host.
# It is intended to be used in conjunction with the /etc/hosts.deny file.
#
# Rationale:
# The /etc/hosts.allow file supports access control by IP and helps ensure that only authorized systems can connect to the system.
#
# @summary 3.4.2 Ensure /etc/hosts.allow is configured (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_3_4_2
class secure_linux_cis::redhat7::cis_3_4_2 (
  Boolean $enforced = true,
) {

  if $enforced {
    file { '/etc/hosts.allow':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => "ALL: ${facts['network']}/${facts['netmask']}",
    }
  }
}
