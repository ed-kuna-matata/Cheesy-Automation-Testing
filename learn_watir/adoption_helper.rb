=begin
This is a suporting module for the adopting puppies automation
=end

module AdoptionHelper

	#supports :chrome :safari :firefox :ie
	def goto_the_puppy_adoption_site
		@browser = Watir::Browser.new :chrome
		@browser.goto 'http://puppies.herokuapp.com'
	end

	def adopt_puppy_number(num)
		@browser.button(:value=>'View Details', :index => num-1).click
		sleep 2
		@browser.button(:value=>'Adopt Me!').click
	end

	def continue_adopting_puppies
		@browser.button(:value=>'Adopt Another Puppy').click
	end

	def checkout_with(name, address, email, pay_type)
		@browser.button(:value=>'Complete the Adoption').click
		sleep 1
		@browser.text_field(:id=>'order_name').set(name)
		sleep 1
		@browser.textarea(:id=>'order_address').set(address)
		sleep 1
		@browser.text_field(:id=>'order_email').set(email)
		sleep 1
		@browser.select_list(:id=>'order_pay_type').select(pay_type)
		sleep 1
		@browser.button(:value=>'Place Order').click
	end

	def verify_page_contains(text)
		if @browser.text.include? text
			puts 'TEST PASSED!'
		else fail 'DEFECT: Expected message not found on page'
		end 
	end

	def close_the_browser
		@browser.close
	end
end #AdoptionHelper module