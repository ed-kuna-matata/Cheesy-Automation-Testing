=begin
stand-alone script 
script opens a browswer and navigates to the apple website.
no test yet
=end

require 'rubygems'
require 'watir-webdriver'

browser = Watir::Browser.new :safari
browser.goto 'http://www.apple.com'