require 'pry'

# load rspec into Cucumber World
require 'rspec/expectations'
World(RSpec::Matchers)

# load test-factory into Cucumber World
require 'test-factory'
World Foundry
World StringFactory
World DateFactory

#loading page object files
Dir["#{File.dirname(__FILE__)}/../../lib/*.rb"].each {|f| require f }
Dir["#{File.dirname(__FILE__)}/../../lib/page_objects/*.rb"].each {|f| require f }
Dir["#{File.dirname(__FILE__)}/../../lib/data_objects/*.rb"].each {|f| require f }

browser = Watir::Browser.new

Before do
  @browser = browser
end

at_exit {
  browser.cookies.clear
  browser.close
}