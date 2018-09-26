# forward_files.rb
# Contains any .forward files that may exist on a system

Facter.add('forward_files') do
  setcode do
    Facter::Core::Execution.exec('puppet:///modules/secure_linux_cis/forward.sh')
  end
end
