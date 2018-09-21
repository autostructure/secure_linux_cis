# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include secure_linux_cis::redhat7::cis_4_2_2_1
class secure_linux_cis::redhat7::cis_4_2_2_1 (
  Boolean $enforced = true,
  Enum['rsyslog', 'syslog-ng', 'none'] $logging = 'rsyslog',
) {

  if $enforced and $logging == 'syslog-ng' {

    package { 'syslog-ng':
      ensure => installed,
      before => Service['syslog-ng'],
    }

    service { 'syslog-ng':
      ensure => running,
      enable => true,
    }

  }

}
