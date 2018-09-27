# local_users.rb
# This fact contains a dictionary of local users and their value for max number of days between a password change
Facter.add(:local_users) do
  confine osfamily: 'RedHat'
  setcode do
    local_users = {}
    user_list = Facter::Core::Execution.exec('egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1').split("\n")
    if user_list
      user_list.each do |user|
        maximum_number_of_days_between_password_change = Facter::Core::Execution.exec("chage --list #{user} | grep \"Max\"")
        number_parser = /\d+/.match(maximum_number_of_days_between_password_change)
        local_users[user][max_days_between_password_change] = number_parser[0].to_i
        #
      end
    end
    local_users
  end
end
