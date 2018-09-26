# home_directory_permission.rb
# Contains all user directories that have permissions less restrictive than 750

Facter.add('home_directory_permission') do
  setcode do
    Facter::Core::Execution.exec('puppet:///modules/secure_linux_cis/home_dir_perm.sh')
  end
end
