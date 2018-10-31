# var_tmp_partition_nosuid.rb
# Ensures the nosuid option exists on the /var/tmp partition

Facter.add('var_tmp_partition_nosuid') do
  # rubocop:disable Style/StringLiterals
  parsed = setcode do
    Facter::Core::Execution.exec("mount | grep \"/var/tmp\"")
  end
  # rubocop:enable Style/StringLiterals
  %r{nosuid}.match(parsed)
end
