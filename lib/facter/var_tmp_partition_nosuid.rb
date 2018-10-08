# var_tmp_partition_nosuid.rb
# Ensures the nosuid option exists on the /var/tmp partition

Facter.add('var_tmp_partition_nosuid') do
  parsed = setcode Facter::Core::Execution.exec('mount | grep /var/tmp')
  %r{nosuid}.match(parsed)
end
