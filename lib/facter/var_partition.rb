# var_partition.rb
# Checks whether a seperate partition exists for /var

Facter.add('var_partition') do
  setcode Facter::Core::Execution.exec("mount | grep \"/var\"")
end
