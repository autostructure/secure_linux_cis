# rhost_files.rb
# This fact contains any .rhost files that any users may posses

Facter.add('rhost_files') do
  setcode do
    Facter::Core::Execution.exec('puppet:///modules/secure_linux_cis/rhost.sh')
  end
end
