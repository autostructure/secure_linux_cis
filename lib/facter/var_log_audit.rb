# var_log_audit.rb
# Ensures a seperate partition exists for /var/log/audit

Facter.add('var_log_audit') do
  setcode Facter::Core::Execution.exec("mount | grep \"/var/log/audit\"")
end
