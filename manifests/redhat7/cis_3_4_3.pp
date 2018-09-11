# 3.4.3 Ensure /etc/hosts.deny is configured (Scored)
#
# Description:
# The /etc/hosts.deny file specifies which IP addresses are not permitted to connect to the host.
# It is intended to be used in conjunction with the /etc/hosts.allow file.
#
# Rationale:
# The /etc/hosts.deny file serves as a failsafe so that any host not specified in /etc/hosts.allow is denied access to the system.
#
# @summary 3.4.3 Ensure /etc/hosts.deny is configured (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_3_4_3
class secure_linux_cis::redhat7::cis_3_4_3 (
  Boolean $enforced = true,
) {

  if $enforced {
    file { '/etc/hosts.deny':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => 'ALL: ALL',
    }
  }
}
