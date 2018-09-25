# This fact privileged_commands returns an array of commands on each partition with the
# setuid/setguid bit set on execution
#
Facter.add('privileged_commands') do
  confine kernel: :Linux
  setcode do
    partitions = Facter.value(:partitions)
    partitions.each_value do |_partition, attributes|
      result = Facter::Core::Execution.exec("find #{attributes['mount']} -xdev \( -perm -4000 -o -perm -2000 \) -type f").split("\n")
      programs.push(result)
    end
    programs
  end
end
