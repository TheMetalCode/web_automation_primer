#These step definitions use Regular Expression matching to perform particular actions when called from a step in the .feature file

Given(/^I am on the Google Home Page$/) do
  @google = GoogleHome.new
  @google.load
  #Hint: https://github.com/jnicklas/capybara#navigating
  #SitePrism Hint: Get an instance of Google, then call the method that gives you an instance of GoogleHome,and load it
end

When(/^I search for Kittens$/) do
  # express the regexp above with the code you wish you had
  #Hint: find a good way to identify the search field, enter Kittens in it
  #Hint: find a good way to identify the search button, click it
  #Hint: get good at using CSS selectors, which can be used with capybara's "find" method.

  #http://www.w3schools.com/cssref/css_selectors.asp
  #https://github.com/jnicklas/capybara#interacting-with-forms
  #https://github.com/jnicklas/capybara#clicking-links-and-buttons
  @google.set_search_field('Kittens')
  @google.click_search_button
  #SitePrism Hint: Using an instance of GoogleHome, perform a search
end

Then(/^I see the Google Search Results Page$/) do
  #Hint: how do you know you're on a different page than before?
  #https://github.com/jnicklas/capybara#navigating
  #Then steps are most often going to involve RSpec expectation matchers
  #Which take this form
  #expect(current_url).to contain(expected_string)
  #expect(current_url).to match(/\?some_param=\d+/)
  #https://relishapp.com/rspec/rspec-expectations/docs
  @google_search_results = GoogleSearchResults.new
  @google_search_results.load(query:@google.search_field)
  @google_search_results.displayed?
  expect(@google_search_results.all_there?).to be_truthy
  #SitePrism Hint: Get an instance of GoogleSearchResults.
  # If your GoogleSearchResults class has set_url_matcher, how can you assert that the page url is loaded?
  # SitePrism Hint: If your GoogleSearchResults class has elements defined, how can you use one assert to ensure all defined elements are present?
end

Then(/^the Google Search Results Page has Kittens$/) do
  expect(@google_search_results.get_search_field).to include @google.search_field
  #https://github.com/jnicklas/capybara#querying

  #SitePrism Hint: What element(s) could you define on the GoogleResultsPage object that would always have text reflecting your search term?
  #SitePrism Hint: Especially if you're checking multiple elements for your search term, what method could you write to perform a singular check for accurate search results?
end

When(/^I click the News Tab on the Google Search Results Page$/) do
  @google_search_results.click_news_tab
  #Hint: you should have the hand of finding and clicking elements by now

  #SitePrism Hint: Make sure you've defined the various tabs, such as News,
  # as an element on GoogleSearchResults
end

Then(/^I see the Google News Results Page$/) do
  @google_news_results = GoogleNewsResults.new
  @google_news_results.load(query:"kittens")
  @google_news_results.displayed?
  # expect(@google_news_results.all_there?).to be_truthy
  #Hint: you should have the hang of finding out where you are according to url by now

  #SitePrism Hint: You can assert the page is loaded and all expected
  # elements exist just as you did above with Google Search Results
end

Then(/^the Google News Results Page has Kittens$/) do
  # expect(@news_results_page).to have_search_results 'Kittens'
  #Hint: you should have the hang of querying a page by now

  #SitePrism Hint: You can assert this page reflects your search term
  # just as you did above with Google Search Results
end

When(/^I click the first result on the Google Search Results page$/) do
  @news_results_page.click_first_search_result
  # Hint: How might you go about figuring out what is the first result without knowing what the text of the link will always be?
  # You will want to look at the attributes of links instead of their text
  # https://github.com/jnicklas/capybara#finding
  #
  # SitePrism Hint: Is there a method you could write for GoogleSearchResults
  # that would click the first search result found?
end
#
Then(/^I am redirected to the corresponding website from the search result$/) do
  # expect(current_url).to eq(@search_results_first_link)
  #Hint: Again, verifying by url that we got redirected elsewhere.

  #SitePrism Hint: You're almost getting redirected to a non-Google page here
  # and we're not doing anything other than asserting a redirect, so you don't
  # have to model the page you're being redirected
end