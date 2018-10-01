# duplicate_group.rb
# Ensures no duplicate group names exist in /etc/group

Facter.add('duplicate_group') do
  setcode do
    Facter::Core::Execution.exec('puppet:///modules/secure_linux_cis/dup_group.sh')
  end
end
