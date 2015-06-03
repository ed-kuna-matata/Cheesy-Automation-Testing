=begin
This script will...
	open a browswer
	navigate to a website
	follow the workflow to adopt puppies
	output test results
	close the browser
=end

require 'rubygems'
require 'watir-webdriver'
require_relative 'adoption_helper'

include AdoptionHelper

goto_the_puppy_adoption_site
sleep 3
adopt_puppy_number 1
sleep 2
continue_adopting_puppies
sleep 2
adopt_puppy_number 2 
sleep 2
checkout_with('Jon Doe','123 Main St','puppy_luv@foo.com','Check') 
sleep 2
verify_page_contains'Thank you for adopting a puppy!' 
sleep 2
close_the_browser