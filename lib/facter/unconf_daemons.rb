# unconf_daemons.rb
# Ensures no unconfined daemons exist
Facer.add('unconf_daemons') do
  setcode "ps -eZ | egrep \"initrc\" | egrep -vw \"tr|ps|egrep|bash|awk\" | tr ':' ' ' | awk '{ print $NF }'"
end
