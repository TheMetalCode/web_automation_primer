#These step definitions use Regular Expression matching to perform particular actions when called from a step in the .feature file

Given(/^I am on the Google Home Page$/) do
  pending # express the regexp above with the code you wish you had
  #Hint: https://github.com/jnicklas/capybara#navigating
end

When(/^I search for Kittens$/) do
  pending # express the regexp above with the code you wish you had
  #Hint: find a good way to identify the search field, enter Kittens in it
  #Hint: find a good way to identify the search button, click it
  #Hint: get good at using CSS selectors, which can be used with capybara's "find" method.
  #Ex. find('#some_element_id').set 'text'
  #http://www.w3schools.com/cssref/css_selectors.asp
  #https://github.com/jnicklas/capybara#interacting-with-forms
  #https://github.com/jnicklas/capybara#clicking-links-and-buttons
end

Then(/^I see the Google Search Results Page$/) do
  pending # express the regexp above with the code you wish you had
  #Hint: how do you know you're on a different page than before?
  #https://github.com/jnicklas/capybara#navigating

  #Then steps are most often going to involve RSpec expectation matchers
  #Which take this form
  #expect(current_url).to contain(expected_string)
  #expect(current_url).to match(/\?some_param=\d+/)
  #https://relishapp.com/rspec/rspec-expectations/docs
end

Then(/^the Google Search Results Page has Kittens$/) do
  pending # express the regexp above with the code you wish you had
  #Hint: how can you find out if the word Kitten occurs on the page somewhere?
  #https://github.com/jnicklas/capybara#querying
end

When(/^I click the News Tab on the Google Search Results Page$/) do
  pending # express the regexp above with the code you wish you had
  #Hint: you should have the hand of finding and clicking elements by now
end

Then(/^I see the Google News Results Page$/) do
  pending # express the regexp above with the code you wish you had
  #Hint: you should have the hang of finding out where you are according to url by now
end

Then(/^the Google News Results Page has Kittens$/) do
  pending # express the regexp above with the code you wish you had
  #Hint: you should have the hang of querying a page by now
end

When(/^I click the first result on the Google Search Results page$/) do
  pending # express the regexp above with the code you wish you had
  #Hint: How might you go about figuring out what is the first result without knowing what the text of the link will always be?
  #You will want to look at the attributes of links instead of their text
  #https://github.com/jnicklas/capybara#finding
end

Then(/^I am redirected to the corresponding website from the search result$/) do
  pending # express the regexp above with the code you wish you had
  #Hint: Again, verifying by url that we got redirected elsewhere.
end