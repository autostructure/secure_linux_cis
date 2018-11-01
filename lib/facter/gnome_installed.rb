# gnome_installed.rb
# Returns true if GNOME is installed
Facter.add('gnome_installed') do
  setcode do
    if Facter::Core::Execution.exec('rpm -qa | grep gnome')
      true
    else
      false
    end
  end
end
