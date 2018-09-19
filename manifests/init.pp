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
) {

  # Local Variable for full Operating System
  $os = "${facts['operatingsystem']}${facts['operatingsystemmajrelease']}"

  case $os {
    'RedHat7': {
      class { '::secure_linux_cis::redhat7':
        logging         => $logging,
        logging_host    => $logging_host,
        is_logging_host => $is_logging_host,
      }
    }
    default: {
      fail("Operating System: ${os} is not supported at this time.")
    }
  }

}
