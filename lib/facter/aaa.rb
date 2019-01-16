Facter.add('home_directory_permission') do
  setcode do
    password_change = Facter::Core::Execution.exec("chage --list #{user} | grep \"Last\"")
    number_parser_change = %r{\: ([^:]*)}.match(password_change)
  end
end
