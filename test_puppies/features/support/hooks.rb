require 'watir-webdriver'


Before do
	#supports :chrome :safari :firefox :ie	
	@browser = Watir::Browser.new :chrome
end


After do
  @browser.close
end