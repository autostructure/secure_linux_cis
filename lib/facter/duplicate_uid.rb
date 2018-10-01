# duplicate_uid.rb
# Ensures there are no duplicate UIDs in /etc/passwd

Facter.add('duplicate_uid') do
  setcode do
    Facter::Core::Execution.exec('puppet:///modules/secure_linux_cis/dup_uid.sh')
  end
end
