# 2.2.1.1 Ensure time synchronization is in use (Not Scored)
#
# Description:
# System time should be synchronized between all systems in an environment. This is
# typically done by establishing an authoritative time server or set of servers and having all
# systems synchronize their clocks to them.
# Rationale:
# Time synchronization is important to support time sensitive security mechanisms like
# Kerberos and also ensures log files have consistent time records across the enterprise,
# which aids in forensic investigations.
#
# @summary 2.2.1.1 Ensure time synchronization is in use (Not Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_2_1_1
class secure_linux_cis::redhat7::cis_2_2_1_1 (
  Array[String] $ntp_servers = [],
  Boolean $enforced = true,
) {

  if $enforced {

    class { '::ntp':
      servers  => $ntp_servers,
      restrict => [
        '-4 default kod nomodify notrap nopeer noquery',
        '-6 default kod nomodify notrap nopeer noquery',
      ],
    }

  }

}
