# 4.1.3 Ensure auditing for processes that start prior to auditd is enabled (Scored)
#
# Description:
# Configure grub so that processes that are capable of being audited can be audited even if
# they start up prior to auditd startup.
#
# Rationale:
# Audit events need to be captured on processes that start up prior to auditd, so that
# potential malicious activity cannot go undetected.
#
# @summary A short summary of the purpose of this class
#
# @example
#   include secure_linux_cis::redhat7::cis_4_1_3
class secure_linux_cis::redhat7::cis_4_1_3 (
  Boolean $enforced = true,
) {

  if $enforced {

    # TODO: Find a way to enforce this value without overwriting other parameters on the line
    file_line { 'GRUB_CMDLINE_LINUX':
      ensure => present,
      path   => '/etc/default/grub',
      line   => 'GRUB_CMDLINE_LINUX="audit=1"',
      match  => '^GRUB_CMDLINE_LINUX=',
    }

  }

}
