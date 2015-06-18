#Step Definitions

=begin
PageObject::PageFactory has two methods, visit() and on() which replace the 
need to use the Web Driver method, browser.goto() by passing the PageFactory
module to the World object created by Cucumber in env.rb
PageFactory also creates a @current_page instance variable for repetative
tasks on multiple pages, such as validating strings on a page
=end

Given(/^I am on the puppy adoption site$/) do
  visit(HomePage) #replaces   @browser.goto "http://puppies.herokuapp.com"
  sleep 1
end

When(/^I click the View Details button for "([^"]*)"$/) do |name|
  on(HomePage).select_puppy name
end

When(/^I click the Adopt Me button$/) do
  on(DetailsPage).add_to_cart
end

When(/^I ciick the Adopt Another Puppy button$/) do
  on(ShoppingCartPage).continue_shopping
end

When(/^I click the Complete the Adoption button$/) do
  on(ShoppingCartPage).proceed_to_checkout
end

=begin
The difference between the Wed Driver methods text_field and text_area 
is that textarea supports multiple lines of text
=end
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
  if @current_page.text.should include expected
		puts 'TEST PASSED!'
  end
end

Then(/^I should see "([^"]*)" as the name for (line item \d+)$/) do |name, line_item|
  on(ShoppingCartPage).name_for_line_item(line_item).should include name
end

Then(/^I should see "([^"]*)" as the subtotal for (line item \d+)$/) do |subtotal, line_item|
  on(ShoppingCartPage).subtotal_for_line_item(line_item).should include subtotal
end

Then(/^I should see "([^"]*)" as the cart total$/) do |total|
  if on(ShoppingCartPage).cart_total.should == total
    puts 'TEST PASSED!'
  end
end
