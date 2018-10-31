# var_log_partition.rb
# Ensures /var/log has a separate partition

Facter.add('var_log_partition') do
  setcode Facter::Core::Execution.exec("mount | grep \"/var/log\"")
end
