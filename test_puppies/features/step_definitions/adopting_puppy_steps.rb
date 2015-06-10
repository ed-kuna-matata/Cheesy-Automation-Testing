#Step Definitions

Given(/^I am on the puppy adoption site$/) do
  @browser.goto "http://puppies.herokuapp.com"
  sleep 1
end

When(/^I click the first View Details button$/) do
  @browser.button(:value=>'View Details', :index => 0).click
end

When(/^I click the second View Details button$/) do
  @browser.button(:value=>'View Details', :index => 1).click
end

When(/^I click the Adopt Me button$/) do
  @browser.button(:value=>'Adopt Me!').click
  @cart = ShoppingCartPage.new(@browser)
end

When(/^I ciick the Adopt Another Puppy button$/) do
  @browser.button(:value => 'Adopt Another Puppy').click
end

When(/^I click the Complete the Adoption button$/) do
  @browser.button(:value => 'Complete the Adoption').click
end

When(/^I enter "([^"]*)" in the name field$/) do |name|
  @browser.text_field(:id=>'order_name').set(name)
end

When(/^I enter "([^"]*)" in the address field$/) do |address|
  @browser.textarea(:id=>'order_address').set(address)
end

When(/^I enter "([^"]*)" in the email field$/) do |email|
  @browser.text_field(:id=>'order_email').set(email)
end

When(/^I select "([^"]*)" from the pay with dropdown$/) do |pay_type|
  @browser.select_list(:id=>'order_pay_type').select(pay_type)
end

When(/^I click the Place Order button$/) do
  @browser.button(:value=>'Place Order').click
end

Then(/^I should see "([^"]*)"$/) do |expected|
  if @browser.text.should include expected
		puts 'TEST PASSED!'
	else fail "\nDEFECT: Expected message not found on page"
	end 
end

=begin
BRITTLE: This code would break if there are any changes to this HTML table
EASY FIX: To avoid having to identify HTML elements by index,
    ask the developer to add name and id attributes to the elements
=end
Then(/^I should see "([^"]*)" as the name for line item (\d+)$/) do |name, line_item|
  row = (line_item.to_i - 1) * 6
  if @browser.table(:index => 0)[row][1].text.should include name
    puts 'TEST PASSED!'
  else fail "\nDEFECT: Expected name not found for line item: " + line_item
  end 
end

Then(/^I should see "([^"]*)" as the subtotal for line item (\d+)$/) do |subtotal, line_item|
  row = (line_item.to_i - 1) * 6
  if @browser.table(:index => 0)[row][3].text.should include subtotal
    puts 'TEST PASSED!'
  else fail "\nDEFECT: Expected subtotal amount not found for line item: " + line_item
  end 
end

Then(/^I should see "([^"]*)" as the cart total$/) do |total|
  if @cart.cart_total.should == total
    puts 'TEST PASSED!'
  else fail "\nDEFECT: Expected total amount not found"
  end 
end
