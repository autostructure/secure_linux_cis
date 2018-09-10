# A description of what this class does
#
# @summary This class is the entry point for CIS hardening depending on OS.
#
# @example
#   include secure_linux_cis
class secure_linux_cis {

  # Local Variable for full Operating System
  $os = "${facts['operatingsystem']}${facts['operatingsystemmajrelease']}"

  case $os {
    'RedHat7': {
      include ::secure_linux_cis::redhat7
    }
    default: {
      fail("Operating System: ${os} is not supported at this time.")
    }
  }

}
