# # tmp_nodev.rb
# # Contains the parsed values of the /tmp partition, looking for "nodev"
#
# Facter.add('tmp_nodev') do
#   setcode do
#     mounted = Facter::Core::Execution.exec('mount | grep /tmp')
#     parsed_mtd = /nodev.match(mounted)
#   end
# end
