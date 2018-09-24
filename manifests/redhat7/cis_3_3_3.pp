# 3.3.3 Ensure IPv6 is disabled (Not Scored)
#
# Description:
# Although IPv6 has many advantages over IPv4, few organizations have implemented IPv6.
#
# Rationale:
# If IPv6 is not to be used, it is recommended that it be disabled to reduce the attack surface
# of the system.
#
# @summary 3.3.3 Ensure IPv6 is disabled (Not Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_3_3_3
class secure_linux_cis::redhat7::cis_3_3_3 (
  Boolean $enforced = true,
  Boolean $ipv6_enabled = true,
) {

  if $enforced and !$ipv6_enabled {

    shellvar { 'GRUB_CMDLINE_LINUX cis_3_3_3':
      ensure       => present,
      variable     => 'GRUB_CMDLINE_LINUX',
      target       => '/etc/default/grub',
      value        => 'ipv6.disable=1',
      array_append => true,
      notify       => Exec['reload grub2 configuration 3_3_3'],
    }

    exec { 'reload grub2 configuration 3_3_3':
      command     => '/sbin/grub2-mkconfig > /boot/grub2/grub.cfg',
      refreshonly => true,
    }

  }

}
