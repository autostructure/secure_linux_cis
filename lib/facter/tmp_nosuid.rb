# tmp_nosuid.rb
# Contains the mount options for /tmp, ensuring nosuid is enabled

Facter.add('tmp_nosuid') do
  setcode do
    mounted = Facter::Core::Execution.exec('mount | grep /tmp')
    if %r{nosuid}.match(mounted)
      true
    else
      false
    end
  end
end
