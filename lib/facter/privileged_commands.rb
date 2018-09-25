# This fact privileged_commands returns an array of commands on each partition with the
# setuid/setguid bit set on execution
#
Facter.add('privileged_commands') do
  confine kernel: :Linux
  setcode do
    partitions = Facter.value(:partitions)
    result = []
    puts partitions.inspect
    partitions.each_value do |_partition, attributes|
      result.push(Facter::Core::Execution.exec("find #{attributes['mount']} -xdev \( -perm -4000 -o -perm -2000 \) -type f"))
    end
    result
  end
end
