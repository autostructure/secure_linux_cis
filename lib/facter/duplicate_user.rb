# duplicate_user.rb
# Ensures no duplicate user names exist in /etc/passwd

Facter.add('duplicate_user') do
  setcode do
    Facter::Core::Execution.exec('puppet:///modules/secure_linux_cis/dup_usr.sh')
  end
end
