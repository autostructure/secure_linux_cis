# non-login.rb
# Ensures certain accounts used for managing applications cannot be accessed

Facter.add('nologin') do
  setcode do
    # rubocop:disable Metrics/LineLength
    Facter::Core::Execution.exec("egrep -v \"^\\+\" /etc/passwd | awk -F: '($1!=\"root\" && $1!=\"sync\" && $1!=\"shutdown\" && $1!=\"halt\" && $3<1000 && $7!=\"/sbin/nologin\" && $7!=\"/bin/false\") {print}")
    # rubocop:enable Metrics/LineLength
  end
end
