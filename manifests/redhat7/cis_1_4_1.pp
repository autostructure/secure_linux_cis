# 1.4.1 Ensure permissions on bootloader config are configured (Scored)
#
#
# Description:
# The grub configuration file contains information on boot settings and passwords for unlocking boot options.
# The grub configuration is usually located at /boot/grub2/grub.cfg and linked as /etc/grub2.cfg. Additional settings can be found in the
# /boot/grub2/user.cfg file.
#
# @summary 1.4.1 Ensure permissions on bootloader config are configured (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_4_1
class secure_linux_cis::redhat7::cis_1_4_1 (
  Boolean $enforced = true,
) {

  if $enforced {

    exec { 'grub_own':
      command => 'chown root:root /boot/grub2/grub.cfg',
      path    => '/bin/',
      creates => '/tmp/grub2_referance',
    }
    exec { 'grub_mod':
      command => 'chmod og-rwx /boot/grub2/grub.cfg',
      path    => '/bin/',
    }
    exec { 'user_own':
      command => 'chown root:root /boot/grub2/user.cfg',
      path    => '/bin/',
    }
    exec { 'user_mod':
      command => 'chmod og-rwx /boot/grub2/user.cfg',
      path    => '/bin/',
    }

    Exec['grub_own'] ~> Exec['grub_mod'] ~> Exec['user_own'] ~> Exec['user_mod']
  }
}
