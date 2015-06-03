Given(/^I am on the puppy adoption site$/) do
  @browser.goto "http://puppies.herokuapp.com"
  sleep 2
end

When(/^I click the View Details button$/) do
  @browser.button(:value=>'View Details', :index => 1).click
  sleep 2
end

When(/^I click the Adopt Me button$/) do
  @browser.button(:value=>'Adopt Me!').click
  sleep 2
end

When(/^I click the Complete the Adoption button$/) do
  @browser.button(:value=>'Complete the Adoption').click
  sleep 2
end

When(/^I enter "([^"]*)" in the name field$/) do |name|
  @browser.text_field(:id=>'order_name').set(name)
  sleep 2
end

When(/^I enter "([^"]*)" in the address field$/) do |address|
  @browser.textarea(:id=>'order_address').set(address)
  sleep 2
end

When(/^I enter "([^"]*)" in the email field$/) do |email|
  @browser.text_field(:id=>'order_email').set(email)
  sleep 2
end

When(/^I select "([^"]*)" from the pay with dropdown$/) do |pay_type|
  @browser.select_list(:id=>'order_pay_type').select(pay_type)
  sleep 2
end

When(/^I click the Place Order button$/) do
  @browser.button(:value=>'Place Order').click
  sleep 2
end

Then(/^I should see "([^"]*)"$/) do |expected|
  	if @browser.text.include? expected
		puts 'TEST PASSED!'
	else fail 'DEFECT: Expected message not found on page'
	end 
	sleep 2
end