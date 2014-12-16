#These step definitions use Regular Expression matching to perform particular actions when called from a step in the .feature file

Given(/^I am on the Google Home Page$/) do
  visit('https://www.google.com')

  #Hint: https://github.com/jnicklas/capybara#navigating
end

When(/^I search for Kittens$/) do
  # express the regexp above with the code you wish you had
  #Hint: find a good way to identify the search field, enter Kittens in it
  #Hint: find a good way to identify the search button, click it
  fill_in "gbqfq", :with => 'Kittens'
  find('#gbqfb').click
  #Hint: get good at using CSS selectors, which can be used with capybara's "find" method.

  #http://www.w3schools.com/cssref/css_selectors.asp
  #https://github.com/jnicklas/capybara#interacting-with-forms
  #https://github.com/jnicklas/capybara#clicking-links-and-buttons
end

Then(/^I see the Google Search Results Page$/) do
  #Hint: how do you know you're on a different page than before?
  expect(current_url).to match('Kittens')
  #https://github.com/jnicklas/capybara#navigating
end

Then(/^the Google Search Results Page has Kittens$/) do
  expect(page).to have_content 'Kittens'
  #https://github.com/jnicklas/capybara#querying
end

When(/^I click the News Tab on the Google Search Results Page$/) do
  click_link "News"
  #Hint: you should have the hand of finding and clicking elements by now
end

Then(/^I see the Google News Results Page$/) do
  expect(current_url).to match('nws')
  #Hint: you should have the hang of finding out where you are according to url by now
end

Then(/^the Google News Results Page has Kittens$/) do
  expect(page).to have_content 'Kittens'
  #Hint: you should have the hang of querying a page by now
end

When(/^I click the first result on the Google Search Results page$/) do
  @search_results_first_link = first("#rso li:nth-child(2) a")['href']
  first('#rso li:nth-child(2) a').click
  #Hint: How might you go about figuring out what is the first result without knowing what the text of the link will always be?
  #You will want to look at the attributes of links instead of their text
  #https://github.com/jnicklas/capybara#finding
end

Then(/^I am redirected to the corresponding website from the search result$/) do
  expect(current_url).to eq(@search_results_first_link)
  #Hint: Again, verifying by url that we got redirected elsewhere.
end