# var_partition.rb
# Checks whether a seperate partition exists for /var

Facter.add('var_partition') do
  # rubocop:disable Style/StringLiterals
  setcode Facter::Core::Execution.exec("mount | grep \"/var\"")
  # rubocop:enable Style/StringLiterals
end
