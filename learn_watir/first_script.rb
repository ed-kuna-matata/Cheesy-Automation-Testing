=begin
script opens a browswer and navigates to the apple website.
=end

require 'rubygems'
require 'watir-webdriver'

browser = Watir::Browser.new :safari
browser.goto 'http://www.apple.com'