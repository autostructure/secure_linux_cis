<<<<<<< HEAD
require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'
require 'beaker/puppet_install_helper'

run_puppet_install_helper unless ENV['BEAKER_provision'] == 'no'
=======
require 'beaker-pe'
require 'beaker-puppet'
require 'beaker-rspec'
require 'beaker/puppet_install_helper'
require 'beaker/module_install_helper'

UNSUPPORTED_PLATFORMS = ['windows', 'Darwin'].freeze

run_puppet_install_helper
configure_type_defaults_on(hosts)
install_ca_certs unless ENV['PUPPET_INSTALL_TYPE'] =~ %r{pe}i
install_module_on(hosts)
install_module_dependencies_on(hosts)

unless ENV['RS_PROVISION'] == 'no' || ENV['BEAKER_provision'] == 'no'

  hosts.each do |host|
    # Need to disable update of ntp servers from DHCP, as subsequent restart of ntp causes test failures
    if fact_on(host, 'osfamily') == 'Debian'
      on host, 'dpkg-divert --divert /etc/dhcp-ntp.bak --local --rename --add /etc/dhcp/dhclient-exit-hooks.d/ntp'
      on host, 'dpkg-divert --divert /etc/dhcp3-ntp.bak --local --rename --add /etc/dhcp3/dhclient-exit-hooks.d/ntp'
    elsif fact_on(host, 'osfamily') == 'RedHat'
      on host, 'echo "PEERNTP=no" >> /etc/sysconfig/network'
    end
  end
end
>>>>>>> v1.0.0

RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
<<<<<<< HEAD
    # Install module and dependencies
    puppet_module_install(source: proj_root, module_name: 'secure_linux_cis')
    hosts.each do |host|
      on host, puppet('module', 'install', 'camptocamp-kmod'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'puppet-alternatives'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'camptocamp-postfix'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'puppetlabs-stdlib'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'herculesteam-augeasproviders_core'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'herculesteam-augeasproviders_sysctl'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'kemra102-auditd'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'herculesteam-augeasproviders_pam'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'puppetlabs-ntp'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'puppetlabs-firewall'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'herculesteam-augeasproviders_shellvar'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'puppet-logrotate'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'puppetlabs-cron_core'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'puppetlabs-augeas_core'), acceptable_exit_codes: [0, 1]
=======
    hosts.each do |host|
      copy_module_to(host, source: proj_root, module_name: 'php_oci8')
>>>>>>> v1.0.0
    end
  end
end
