# 6.2.6 Ensure root PATH Integrity (Scored)
#
# @summary 6.2.6 Ensure root PATH Integrity (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_6
  class secure_linux_cis::redhat7::cis_6_2_6 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/tmp/cis_scripts/root_path':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
      # force  => 'yes',
      source => 'puppet:///modules/secure_linux_cis/root_path.sh',
    }

    if $facts['root_path'] {
      notify { 'rp':
        message  => '[6.2.6] There is a "." or other writable directory in the root executable path. Check the root_path fact for details',
        loglevel => 'warning',
      }
    }
  }
}
