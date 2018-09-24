# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include secure_linux_cis::redhat7::cis_3_7
class secure_linux_cis::redhat7::cis_3_7 (
  Boolean $enforced = true,
) {

  if $enforced {

    $facts['networking']['interfaces'].each | String $name, Hash $attributes | {
      if $name =~ /wlan/ {
        exec { "Disable wireless network interface: ${name}":
          command => "/sbin/ip link set ${name} down",
        }
      }
    }

  }

}
