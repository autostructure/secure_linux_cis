# home_directory.rb

Facter.add('home_directory') do
  setcode do
    Facter::Core::Execution.exec('puppet:///modules/secure_linux_cis/home_directory.sh')
  end
end
