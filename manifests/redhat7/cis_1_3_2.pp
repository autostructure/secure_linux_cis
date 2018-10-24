# 1.3.2 Ensure filesystem integrity is regularly checked (Scored)
#
#
# Description:
# Periodic checking of the filesystem integrity is needed to detect changes to the filesystem.
#
# @summary 1.3.2 Ensure filesystem integrity is regularly checked (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_3_2
  class secure_linux_cis::redhat7::cis_1_3_2 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line { 'cron_aide':
      path => '/etc/crontab',
      line => '0 5 * * * /usr/sbin/aide --check',
    }
  }
}
