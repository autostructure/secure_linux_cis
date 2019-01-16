Facter.add('aaa') do
  setcode do
    password_change = Facter::Core::Execution.exec("chage --list luther | grep \"Last\"")
    number_parser_change = %r{\: ([^:]*)}.match(password_change)

    if number_parser_change == ''
      number_parser_change == 'blank'
    end
  end
end
