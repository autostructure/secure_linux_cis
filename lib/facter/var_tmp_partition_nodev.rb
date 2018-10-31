# var_tmp_partition_parsed.rb
# Parses the var_tmp_partition custom fact to ensure nodev option is set

Facter.add('var_tmp_partition_nodev') do
  parsed = setcode Facter::Core::Execution.exec("mount | grep \"/var/tmp\"")
  %r{nodev}.match(parsed)
end
