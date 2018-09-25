# This fact privileged_commands returns an array of commands on each partition with the
# setuid/setguid bit set on execution
#
Facter.add('privileged_commands') do
  confine kernel: :Linux
  setcode do
    partitions = Facter.value(:partitions)
    results = []
    puts partitions.inspect
    partitions.each_pair do |_partition, attributes|
      puts attributes.inspect
      result2 = Facter::Core::Execution.exec("find #{attributes['mount']} -xdev \\\( -perm -4000 -o -perm -2000 \\\) -type f")
      result2.split("\n")
      result2.each do |result|
        results.push(result)
      end
    end
    result
  end
end
