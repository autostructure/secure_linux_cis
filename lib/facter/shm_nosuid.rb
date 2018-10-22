# shm_nosuid.rb
# Ensures the nosuid option is enabled for the /dev/shm partition

Facter.add('shm_nosuid') do
  setcode do
    shmns = Facter::Core::Execution.exec('mount | grep /dev/shm')
    %r{nosuid}.match(shmns)
  end
end
