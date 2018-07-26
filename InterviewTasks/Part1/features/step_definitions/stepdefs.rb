require 'capybara/cucumber'

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium
  config.app_host = "http://www.redfin.com"
end

Given("I navigated to test application home page") do
  visit('/')
end

When("I Login with valid credentials") do
  find_button('Log In').click
  find_button('Continue with Email').click
  fill_in('Email', with: 'acornsinterviewtask@mailinator.com')
  fill_in('Password', with: '42pDNXBc4y')
  find_button('Sign In').click
  sleep 3
end

Then("my first name {string} will be displayed in the user menu") do |firstname|
  expect(page).to have_content(firstname)
end

When("I search for a property in {string}, with max price {string},  minimum beds is {string}, {string} or more baths") do |city, maxprice, minbeds, minbaths|
  @city = city
  @maxprice = maxprice
  @minbeds = minbeds
  @minbaths = minbaths
  visit('/')
  find_button('Log In').click
  find_button('Continue with Email').click
  fill_in('Email', with: 'acornsinterviewtask@mailinator.com')
  fill_in('Password', with: '42pDNXBc4y')
  find_button('Sign In').click

  within(:css, "form.SearchBoxForm", :match => :first) do
    fill_in('search-box-input', with: @city)
    find(:css, "button").click
  end

  sleep 3
  select @maxprice, :from => 'quickMaxPrice'
  find_button('Filters').click
  sleep 3
  select @minbeds, :from => 'minBeds'
  select @minbaths, :from => 'baths'
  find_button('Apply Filters').click
  find_button('Table').click
  sleep 3
end

Then("the results returned will match my criteria") do
  page.all(:css, 'td.col_price').each do |el|
    expect(el.text.to_i).to be <= @maxprice.tr('$','').to_i * 1000
  end
  page.all(:css, 'td.col_beds').each do |el|
    expect(el.text.to_i).to be >= @minbeds.to_i
  end
  page.all(:css, 'td.col_baths').each do |el|
    expect(el.text.to_i).to be >= @minbaths.to_i
  end
end
