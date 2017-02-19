require 'rspec'
require 'webmock/rspec'
require 'capybara/rspec'
require 'support/fake_github'
WebMock.disable_net_connect!(allow_localhost: true)


RSpec.configure do |config|
  config.before(:each) do
    stub_request(:any, /api.github.com/).to_rack(FakeGitHub)
  end
end
