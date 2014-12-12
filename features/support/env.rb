require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'pry'

Capybara.run_server = false
#This means each attempt to interact with a web element will wait up to 10 seconds for it to exist
Capybara.default_wait_time = 10

#This will set us up to use Firefox as our browser of choice
Capybara.current_driver = :selenium
Capybara.app_host = 'http://www.google.com'
$env_url = Capybara.app_host