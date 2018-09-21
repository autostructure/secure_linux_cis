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

    file_line { 'rsyslog.conf logging_host':
      ensure => present,
      path   => '/etc/rsyslog.conf',
      line   => "*.* @@${logging_host}",
      match  => '\*\.\* @@',
      notify => Exec['reload rsyslog 4_2_1_4'],
    }

    exec { 'reload rsyslog 4_2_1_4':
      command     => '/bin/pkill -HUP rsyslogd',
      refreshonly => true,
    }

  }

}
