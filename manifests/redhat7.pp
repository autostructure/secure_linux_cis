# This is a wrapper class that declares the CIS controls for RedHat Enterprise Linux 7
#
# The RedHat 7 CIS Benchmark is updated for version: 2.2.0
#
# The benchmark can be found here:
# https://downloads.cisecurity.org/
#
# @summary This wrapper class declares CIS controls for the RedHat Enterprise Linux 7 Benchmark v2.2.0
#
# @example
#   include secure_linux_cis::redhat7
class secure_linux_cis::redhat7 (
  Array[String] $time_servers = [],
  Enum['rsyslog', 'syslog-ng', 'none'] $logging = 'rsyslog',
  String $logging_host = 'loghost.example.com',
  Boolean $is_logging_host = false,
  Integer $max_log_file = 8,
  Enum['1', '2', '3', '4'] $max_auth_tries = '4',
  Enum['ntp', 'chrony', 'none'] $time_sync = 'ntp',
  Boolean $ipv6_enabled = true,
  Array $approved_mac_algorithms = ['hmac-sha2-512-etm@openssh.com','hmac-sha2-256-etm@openssh.com','umac-128-etm@openssh.com',
                                    'hmac-sha2-512','hmac-sha2-256','umac-128@openssh.com']
) {
  include ::secure_linux_cis::redhat7::cis_1_1_1_1
  include ::secure_linux_cis::redhat7::cis_1_1_1_2
  include ::secure_linux_cis::redhat7::cis_1_1_1_3
  include ::secure_linux_cis::redhat7::cis_1_1_1_4
  include ::secure_linux_cis::redhat7::cis_1_1_1_5
  include ::secure_linux_cis::redhat7::cis_1_1_1_6
  include ::secure_linux_cis::redhat7::cis_1_1_1_7
  include ::secure_linux_cis::redhat7::cis_1_1_1_8

  include ::secure_linux_cis::redhat7::cis_1_1_2
  include ::secure_linux_cis::redhat7::cis_1_1_3
  include ::secure_linux_cis::redhat7::cis_1_1_4
  include ::secure_linux_cis::redhat7::cis_1_1_5
  include ::secure_linux_cis::redhat7::cis_1_1_6
  include ::secure_linux_cis::redhat7::cis_1_1_7
  include ::secure_linux_cis::redhat7::cis_1_1_8
  include ::secure_linux_cis::redhat7::cis_1_1_9
  include ::secure_linux_cis::redhat7::cis_1_1_10
  include ::secure_linux_cis::redhat7::cis_1_1_11
  include ::secure_linux_cis::redhat7::cis_1_1_12
  include ::secure_linux_cis::redhat7::cis_1_1_13
  include ::secure_linux_cis::redhat7::cis_1_1_14
  include ::secure_linux_cis::redhat7::cis_1_1_15
  include ::secure_linux_cis::redhat7::cis_1_1_16
  include ::secure_linux_cis::redhat7::cis_1_1_17
  include ::secure_linux_cis::redhat7::cis_1_1_18
  include ::secure_linux_cis::redhat7::cis_1_1_19
  include ::secure_linux_cis::redhat7::cis_1_1_20
  include ::secure_linux_cis::redhat7::cis_1_1_21
  include ::secure_linux_cis::redhat7::cis_1_1_22

  include ::secure_linux_cis::redhat7::cis_2_1_1
  include ::secure_linux_cis::redhat7::cis_2_1_2
  include ::secure_linux_cis::redhat7::cis_2_1_3
  include ::secure_linux_cis::redhat7::cis_2_1_4
  include ::secure_linux_cis::redhat7::cis_2_1_5
  include ::secure_linux_cis::redhat7::cis_2_1_6
  include ::secure_linux_cis::redhat7::cis_2_1_7

  class { '::secure_linux_cis::redhat7::cis_2_2_1_2':
    time_servers => $time_servers,
    time_sync    => $time_sync,
  }
  class { '::secure_linux_cis::redhat7::cis_2_2_1_3':
    time_servers => $time_servers,
    time_sync    => $time_sync,
  }
  include ::secure_linux_cis::redhat7::cis_2_2_2
  include ::secure_linux_cis::redhat7::cis_2_2_3
  include ::secure_linux_cis::redhat7::cis_2_2_4
  include ::secure_linux_cis::redhat7::cis_2_2_5
  include ::secure_linux_cis::redhat7::cis_2_2_6
  include ::secure_linux_cis::redhat7::cis_2_2_7
  include ::secure_linux_cis::redhat7::cis_2_2_8
  include ::secure_linux_cis::redhat7::cis_2_2_9
  include ::secure_linux_cis::redhat7::cis_2_2_10
  include ::secure_linux_cis::redhat7::cis_2_2_11
  include ::secure_linux_cis::redhat7::cis_2_2_12
  include ::secure_linux_cis::redhat7::cis_2_2_13
  include ::secure_linux_cis::redhat7::cis_2_2_14
  include ::secure_linux_cis::redhat7::cis_2_2_15
  include ::secure_linux_cis::redhat7::cis_2_2_16
  include ::secure_linux_cis::redhat7::cis_2_2_17
  include ::secure_linux_cis::redhat7::cis_2_2_18
  include ::secure_linux_cis::redhat7::cis_2_2_19
  include ::secure_linux_cis::redhat7::cis_2_2_20
  include ::secure_linux_cis::redhat7::cis_2_2_21

  include ::secure_linux_cis::redhat7::cis_2_3_1
  include ::secure_linux_cis::redhat7::cis_2_3_2
  include ::secure_linux_cis::redhat7::cis_2_3_3
  include ::secure_linux_cis::redhat7::cis_2_3_4
  include ::secure_linux_cis::redhat7::cis_2_3_5

  include ::secure_linux_cis::redhat7::cis_3_1_1
  include ::secure_linux_cis::redhat7::cis_3_1_2

  include ::secure_linux_cis::redhat7::cis_3_2_1
  include ::secure_linux_cis::redhat7::cis_3_2_2
  include ::secure_linux_cis::redhat7::cis_3_2_3
  include ::secure_linux_cis::redhat7::cis_3_2_4
  include ::secure_linux_cis::redhat7::cis_3_2_5
  include ::secure_linux_cis::redhat7::cis_3_2_6
  include ::secure_linux_cis::redhat7::cis_3_2_7
  include ::secure_linux_cis::redhat7::cis_3_2_8

  class { '::secure_linux_cis::redhat7::cis_3_3_1':
    ipv6_enabled => $ipv6_enabled,
  }
  class { '::secure_linux_cis::redhat7::cis_3_3_2':
    ipv6_enabled => $ipv6_enabled,
  }
  class { '::secure_linux_cis::redhat7::cis_3_3_3':
    ipv6_enabled => $ipv6_enabled,
  }

  include ::secure_linux_cis::redhat7::cis_3_4_1
  include ::secure_linux_cis::redhat7::cis_3_4_2
  include ::secure_linux_cis::redhat7::cis_3_4_3

  include ::secure_linux_cis::redhat7::cis_3_5_1
  include ::secure_linux_cis::redhat7::cis_3_5_2
  include ::secure_linux_cis::redhat7::cis_3_5_3
  include ::secure_linux_cis::redhat7::cis_3_5_4

  include ::secure_linux_cis::redhat7::cis_3_6_1
  include ::secure_linux_cis::redhat7::cis_3_6_2
  include ::secure_linux_cis::redhat7::cis_3_6_3
  include ::secure_linux_cis::redhat7::cis_3_6_4
  include ::secure_linux_cis::redhat7::cis_3_6_5

  # Set order for firewall rules to be applied
  Class['::secure_linux_cis::redhat7::cis_3_6_1']
  -> Class['::secure_linux_cis::redhat7::cis_3_6_3']
  -> Class['::secure_linux_cis::redhat7::cis_3_6_4']
  -> Class['::secure_linux_cis::redhat7::cis_3_6_5']
  -> Class['::secure_linux_cis::redhat7::cis_3_6_2']

  class { '::secure_linux_cis::redhat7::cis_4_1_1_1':
    max_log_file => $max_log_file,
  }
  include ::secure_linux_cis::redhat7::cis_4_1_1_2
  include ::secure_linux_cis::redhat7::cis_4_1_1_3
  include ::secure_linux_cis::redhat7::cis_4_1_2
  include ::secure_linux_cis::redhat7::cis_4_1_3
  include ::secure_linux_cis::redhat7::cis_4_1_4
  include ::secure_linux_cis::redhat7::cis_4_1_5
  include ::secure_linux_cis::redhat7::cis_4_1_6
  include ::secure_linux_cis::redhat7::cis_4_1_7
  include ::secure_linux_cis::redhat7::cis_4_1_8
  include ::secure_linux_cis::redhat7::cis_4_1_9
  include ::secure_linux_cis::redhat7::cis_4_1_10
  include ::secure_linux_cis::redhat7::cis_4_1_11
  #include ::secure_linux_cis::redhat7::cis_4_1_12
  include ::secure_linux_cis::redhat7::cis_4_1_13
  include ::secure_linux_cis::redhat7::cis_4_1_14
  include ::secure_linux_cis::redhat7::cis_4_1_15
  include ::secure_linux_cis::redhat7::cis_4_1_16
  include ::secure_linux_cis::redhat7::cis_4_1_17
  #include ::secure_linux_cis::redhat7::cis_4_1_18

  class { '::secure_linux_cis::redhat7::cis_4_2_1_1':
    logging => $logging,
  }

  class { '::secure_linux_cis::redhat7::cis_4_2_1_2':
    logging => $logging,
  }

  class { '::secure_linux_cis::redhat7::cis_4_2_1_3':
    logging => $logging,
  }

  class { '::secure_linux_cis::redhat7::cis_4_2_1_4':
    logging      => $logging,
    logging_host => $logging_host,
  }

  class { '::secure_linux_cis::redhat7::cis_4_2_1_5':
    logging         => $logging,
    is_logging_host => $is_logging_host,
  }

  class { '::secure_linux_cis::redhat7::cis_4_2_2_1':
    logging => $logging,
  }

  class { '::secure_linux_cis::redhat7::cis_4_2_2_2':
    logging => $logging,
  }

  class { '::secure_linux_cis::redhat7::cis_4_2_2_3':
    logging => $logging,
  }

  class { '::secure_linux_cis::redhat7::cis_4_2_2_4':
    logging      => $logging,
    logging_host => $logging_host,
  }

  class { '::secure_linux_cis::redhat7::cis_4_2_2_5':
    logging         => $logging,
    is_logging_host => $is_logging_host,
  }

  class { '::secure_linux_cis::redhat7::cis_4_2_3':
    logging => $logging,
  }

  class { '::secure_linux_cis::redhat7::cis_4_2_4': }

  include ::secure_linux_cis::redhat7::cis_5_1_1
  include ::secure_linux_cis::redhat7::cis_5_1_2
  include ::secure_linux_cis::redhat7::cis_5_1_3
  include ::secure_linux_cis::redhat7::cis_5_1_4
  include ::secure_linux_cis::redhat7::cis_5_1_5
  include ::secure_linux_cis::redhat7::cis_5_1_6
  include ::secure_linux_cis::redhat7::cis_5_1_7
  include ::secure_linux_cis::redhat7::cis_5_1_8
  include ::secure_linux_cis::redhat7::cis_5_2_1
  include ::secure_linux_cis::redhat7::cis_5_2_2
  include ::secure_linux_cis::redhat7::cis_5_2_3
  include ::secure_linux_cis::redhat7::cis_5_2_4

  class { '::secure_linux_cis::redhat7::cis_5_2_5':
    max_auth_tries => $max_auth_tries,
  }
  include ::secure_linux_cis::redhat7::cis_5_2_6
  include ::secure_linux_cis::redhat7::cis_5_2_7
  include ::secure_linux_cis::redhat7::cis_5_2_8
  include ::secure_linux_cis::redhat7::cis_5_2_9
  include ::secure_linux_cis::redhat7::cis_5_2_10
  class { '::secure_linux_cis::redhat7::cis_5_2_11':
    approved_mac_algorithms => $approved_mac_algorithms,
  }

}
