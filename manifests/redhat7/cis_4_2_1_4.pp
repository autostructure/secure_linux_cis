# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include secure_linux_cis::redhat7::cis_4_2_1_4
class secure_linux_cis::redhat7::cis_4_2_1_4 (
  Boolean $enforced = true,
  Enum['rsyslog', 'syslog-ng', 'none'] $logging = 'rsyslog',
  String $logging_host = 'loghost.example.com',
) {

  if $enforced and $logging == 'rsyslog' {

    file_line { 'audit.rules sudo.log 1':
      ensure => present,
      path   => '/etc/rsyslog.conf',
      line   => "*.* @@${logging_host}",
      match  => '\*\.\* @@',
    }

  }
}
