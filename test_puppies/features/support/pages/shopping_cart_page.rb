class ShoppingCartPage

	def initialize(browser)
		@browser = browser
	end

	def cart_total
		@browser.td(:class => 'total_cell').text
	end	

end #end ShoppingCartPage class

=begin
PERFORMANCE ISSUE: Implemeting the folloing functionality
	for use in steps.rb creates too much lag, causing test errors

	NAME_COLUMN = 1
	SUBTOTAL_COLUMN = 3
	LINES_PER_PUPPY = 6

	def name_for_line_item(line_item)
		@browser.table(:index => 0)[row_for(line_item)][1].text
	end	

	def subtotal_for_line_item(line_item)
		@browser.table(:index => 0)[row_for(line_item)][3].text
	end	

	def proceed_to_checkout
		@browser.button(:value => 'Complete the Adoption').click
	end

	def continue_shopping
		@browser.button(:value => 'Adopt Another Puppy').click
	end

=end

