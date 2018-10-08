# tmp_nosuid.rb
# Contains the mount options for /tmp, ensuring nosuid is enabled

Facter.add('tmp_nosuid') do
  setcode do
    mounted = Facter::Core::Execution.exec('mount | grep /tmp')
    %r{nosuid}.match(mounted)
  end
end
