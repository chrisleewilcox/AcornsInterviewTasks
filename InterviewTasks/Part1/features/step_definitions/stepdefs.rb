require 'capybara/cucumber'

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium
  config.app_host = "http://www.redfin.com"
end

Given("I navigated to test application home page") do
  visit("/")
  sleep 2
  find_button('Log In').click
end

When("I Login with valid credentials") do
  sleep 2
  find_button('Continue with Email').click
  sleep 2
  fill_in('Email', with: 'acornsinterviewtask@mailinator.com')
  fill_in('Password', with: '42pDNXBc4y')
  sleep 2
  find_button('Sign In').click
  sleep 2
end

Then("my first name {string} will be displayed in the user menu") do |firstname|
  puts find('#userMenu').find('span.name').text
  if find('#userMenu').find('span.name').text != firstname
    raise "Test Step Failed: Cannot find first name #{firstname}"
  end
end
