# tmp_noexec.rb
# Ensures noxec option exists on tmp.mount

Facter.add('tmp_noexec') do
  setcode do
    mounted = Facter::Core::Execution.exec('mount | grep /tmp')
    if %r{noexec}.match(mounted)
      true
    else
      false
    end
  end
end
