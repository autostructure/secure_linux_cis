# dot_file_writable.rb
# Contains dot files that are either group or world writable

Facter.add('dot_file_writable') do
  setcode do
    Facter::Core::Execution.exec('puppet:///modules/secure_linux_cis/dot_file_wr.sh')
  end
end
