# 1.5.3 Ensure address space layout randomization (ASLR) is enabled (Scored)
#
#
# Description:
# Address space layout randomization (ASLR) is an exploit mitigation technique which randomly arranges the address space
# of key data areas of a process.
#
# @summary 1.5.3 Ensure address space layout randomization (ASLR) is enabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_5_3
  class secure_linux_cis::redhat7::cis_1_5_3 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line { 'sysctl_randomize':
      path => '/etc/sysctl.conf',
      line => 'kernal.randomize_va_space = 2',
    }
  }
}
