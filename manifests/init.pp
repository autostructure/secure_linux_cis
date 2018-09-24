# A description of what this class does
#
# @summary This class is the entry point for CIS hardening depending on OS.
#
# @example
#   include secure_linux_cis
class secure_linux_cis (
  Enum['rsyslog', 'syslog-ng', 'none'] $logging = 'rsyslog',
  String $logging_host = 'loghost.example.com',
  Boolean $is_logging_host = false,
  Integer $max_log_file = 8,
  Enum['1', '2', '3', '4'] $max_auth_tries = '4',
  Array $approved_mac_algorithms = ['hmac-sha2-512-etm@openssh.com','hmac-sha2-256-etm@openssh.com','umac-128-etm@openssh.com',
                                    'hmac-sha2-512','hmac-sha2-256','umac-128@openssh.com']
) {

  # Local Variable for full Operating System
  $os = "${facts['operatingsystem']}${facts['operatingsystemmajrelease']}"

  case $os {
    'RedHat7': {
      class { '::secure_linux_cis::redhat7':
        logging                 => $logging,
        logging_host            => $logging_host,
        is_logging_host         => $is_logging_host,
        max_log_file            => $max_log_file,
        max_auth_tries          => $max_auth_tries,
        approved_mac_algorithms => $approved_mac_algorithms,
      }
    }
    default: {
      fail("Operating System: ${os} is not supported at this time.")
    }
  }

}
