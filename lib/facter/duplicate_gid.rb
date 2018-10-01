# duplicate_gid.rb
# Ensures no duplicate GIDs exist in /etc/group

Facter.add('duplicate_gid') do
  setcode do
    Facter::Core::Execution.exec('puppet:///modules/secure_linux_cis/dup_gid.sh')
  end
end
