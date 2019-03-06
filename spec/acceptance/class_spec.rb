require 'spec_helper_acceptance'

<<<<<<< HEAD
describe 'secure_linux_cis' do
  context 'with default parameters' do
    # Using puppet_apply as a helper
    it 'works idempotently with no errors' do
      pp = <<-LINUX_TEST
      class { 'secure_linux_cis': }
      LINUX_TEST
=======
describe 'secure_linux_cis class' do
  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'works idempotently with no errors' do
      pp = <<-EOS
      class { 'secure_linux_cis': }
      EOS
>>>>>>> v1.0.0

      # Run it twice and test for idempotency
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end
  end
end
