# shm_nodev.rb
# Ensures the nodev option is enabled on the /dev/shm partition

Facter.add('shm_nodev') do
  setcode do
    shm = Facter::Core::Execution.exec('mount | grep /dev/shm')
    if %r{nodev}.match(shm)
      true
    else
      false
    end
  end
end
