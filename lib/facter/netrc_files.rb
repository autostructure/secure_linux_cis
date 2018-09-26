# netrc_files.rb
# Contains any .netrc files on the system

Facter.add('netrc_files') do
  setcode do
    Facter::Core::Execution.exec('puppet:///modules/secure_linux_cis/netrc.sh')
  end
end
