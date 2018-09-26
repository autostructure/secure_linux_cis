# home_directory_owner.rb
# Contains users that do not own home directories

Facter.add('home_directory_owner') do
  setcode do
    Facter::Core::Execution.exec('puppet:///modules/secure_linux_cis/home_dir_own.sh')
  end
end
