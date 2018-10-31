# var_tmp_partition_noexec.rb
# This ensures the noexec option exists for the /var/tmp partition

Facter.add('var_tmp_partition_noexec') do
  parsed = setcode Facter::Core::Execution.exec("mount | grep \"/var/tmp\"")
  %r{noexec}.match(parsed)
end
