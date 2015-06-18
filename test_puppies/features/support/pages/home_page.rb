class HomePage
	include PageObject

	page_url "http://puppies.herokuapp.com"

	divs(:name, :class => 'name')
	buttons(:view_detail, :value => 'View Details')

	def select_puppy(name)
		index = index_for(name)
		view_detail_elements[index].click #available via buttons method
	end

	private

	def index_for(name)
		name_elements.find_index {
			|the_div| the_div.text == name #available via divs method
		}
	end

end

=begin
The plural versions of div and button methods create a method called 
[name]_elements where [name] is the name in our declarations. This gives
us the ability to index all of the 'View Details' buttons and store all
of the puppy's names as a collection. So instead of calls within our step
definitions to puppy numbers we can make calls to puppy names 

	def select_puppy_number(num)
		button_element(:value => 'View Details', :index => num -1).click
	end

The button_element method, in turn, was an alternative to the button method. 
Instead of assigning the elements statically, it defines the elements 
ahead of time and locates the indexes while the script is running.
button_element does not have a name param since it will not generate any 
additional methods for us.

	button(:first_puppy, :value => 'View Details', :index => 0)
	button(:second_puppy, :value => 'View Details', :index => 1)
=end