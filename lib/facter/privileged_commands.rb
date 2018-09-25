# This fact privileged_commands returns an array of commands on each partition with the
# setuid/setguid bit set on execution
#
Facter.add('xorg_x11_packages') do
  confine kernel: :linux
  setcode do
    partitions = Facter.value(:partitions)
    programs = []
    partitions.each_value do |_partition, attributes|
      result = Facter::Core::Execution.exec("find #{attributes['mount']} -xdev \( -perm -4000 -o -perm -2000 \) -type f").split("\n")
      programs.push(result)
    end
    programs
  end
end
