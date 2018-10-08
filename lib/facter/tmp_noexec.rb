# tmp_noexec.rb
# Ensures noxec option exists on tmp.mount

Facter.add('tmp_noexec') do
  setcode do
    mounted = Facter::Core::Execution.exec('mount | grep /tmp')
    %r{noexec}.match(mounted)
  end
end
