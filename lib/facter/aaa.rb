Facter.add('aaa') do
  setcode do
    password_change = Facter::Core::Execution.exec("chage --list luther | grep \"Last\"")
    number_parser_change = %r{\: ([^:]*)}.match(password_change)

    if number_parser_change == '' then
      echo "yay"
    else
      echo "suspicious"
    end
  end
end
