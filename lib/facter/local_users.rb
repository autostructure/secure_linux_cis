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
        number_parser_max = %r{\d+}.match(maximum_number_of_days_between_password_change)
        local_users[user] = {}

        minimum_number_of_days_between_password_change = Facter::Core::Execution.exec("chage --list #{user} | grep \"Min\"")
        number_parser_min = %r{\d+}.match(minimum_number_of_days_between_password_change)
        local_users[user] = {}

        warning_number_of_days_between_password_change = Facter::Core::Execution.exec("chage --list #{user} | grep \"warn\"")
        number_parser_warn = %r{\d+}.match(warning_number_of_days_between_password_change)
        local_users[user] = {}

        local_users[user] = {
          'max_days_between_password_change'  => number_parser_max[0].to_i,
          'min_days_between_password_change'  => number_parser_min[0].to_i,
          'warn_days_between_password_change' => number_parser_warn[0].to_i,
        }
      end
    end
    local_users
  end
end
