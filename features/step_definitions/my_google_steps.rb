#These step definitions use Regular Expression matching to perform particular actions when called from a step in the .feature file

Given(/^I am on the Google Home Page$/) do
  pending # express the regexp above with the code you wish you had
  #Hint: http://watirwebdriver.com/

  #TestFactory Hint: Use an instance of GoogleHome to visit the page
end

When(/^I search for Kittens$/) do
  pending # express the regexp above with the code you wish you had

  #TestFactory Hint: Using an instance of GoogleHome, perform a search
end

Then(/^I see the Google Search Results Page$/) do
  pending # express the regexp above with the code you wish you had
  #Hint: how do you know you're on a different page than before?

  #Then steps are most often going to involve RSpec expectation matchers
  #Which take this form
  #expect(current_url).to contain(expected_string)
  #expect(current_url).to match(/\?some_param=\d+/)
  #https://relishapp.com/rspec/rspec-expectations/docs

  #TestFactory Hint: Get an instance of GoogleSearchResults. How can you assert that the page url is loaded?
  #TestFactory Hint: If your GoogleSearchResults class has elements defined, how can you ensure all required elements are loaded?
end

Then(/^the Google Search Results Page has Kittens$/) do
  pending # express the regexp above with the code you wish you had
  #Hint: how can you find out if the word Kitten occurs on the page somewhere?

  #TestFactory Hint: What element(s) could you define on the GoogleResultsPage object that would always have text reflecting your search term?
  #TestFactory Hint: Especially if you're checking multiple elements for your search term, what method could you write to perform a singular check for accurate search results?
end

When(/^I click the News Tab on the Google Search Results Page$/) do
  pending # express the regexp above with the code you wish you had

  #TestFactory Hint: Make sure you've defined the various tabs, such as News, as elements on GoogleSearchResults
end

Then(/^I see the Google News Results Page$/) do
  pending # express the regexp above with the code you wish you had

  #TestFactory Hint: You can assert the page is loaded and all expected elements exist just as you did above with Google Search Results
end

Then(/^the Google News Results Page has Kittens$/) do
  pending # express the regexp above with the code you wish you had

  #TestFactory Hint: You can assert this page reflects your search term just as you did above with Google Search Results
end

When(/^I click the first result on the Google Search Results page$/) do
  pending # express the regexp above with the code you wish you had
  #Hint: How might you go about figuring out what is the first result without knowing what the text of the link will always be?
  #You will want to look at the attributes of links instead of their text

  #TestFactory Hint: Is there a method you could write for GoogleSearchResults that would click the first search result found?
end

Then(/^I am redirected to the corresponding website from the search result$/) do
  pending # express the regexp above with the code you wish you had
  #Hint: Again, verifying by url that we got redirected elsewhere.

  #TestFactory Hint: You're almost always getting redirected to a non-Google page here and we're not doing anything other than asserting a redirect, so you don't have to model the page you're being redirected
end