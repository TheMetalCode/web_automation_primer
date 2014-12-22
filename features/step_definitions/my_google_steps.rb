#These step definitions use Regular Expression matching to perform particular actions when called from a step in the .feature file

Given(/^I am on the Google Home Page$/) do
  $app = Google.new
  $app.home.load
end

When(/^I search for Kittens$/) do
  $app.home.set_search_field('Kittens')
  $app.home.click_search_button
end

Then(/^I see the Google Search Results Page$/) do
  $app.search_results.load(query:$app.home.get_search_field)
  $app.search_results.displayed?
end

Then(/^the Google Search Results Page has Kittens$/) do
  expect($app.search_results).to have_content $app.home.get_search_field
end

When(/^I click the first result on the Google Search Results page$/) do
  $first_search_result_url = $app.search_results.get_first_search_result_url
  $app.search_results.click_first_search_result
end

Then(/^I am redirected to the corresponding website from the search result$/) do
  expect(current_url).to include($first_search_result_url)
end
#
When(/^I click the News Tab on the Google Search Results Page$/) do
  $app.search_results.news_tab.value
  $app.search_results.click_news_tab
end

Then(/^I see the Google News Results Page$/) do
  $app.news_results.load(query:$app.home.get_search_field)
  $app.news_results.displayed?
  expect($app.news_results.all_there?).to be_truthy
end

Then(/^the Google News Results Page has Kittens$/) do
  expect($app.news_results).to have_content('Kittens')
end

When(/^I click the first result on the Google News Results page$/) do
  $first_news_result_url = $app.news_results.get_first_news_result_url
  $app.news_results.click_first_news_result
end

Then(/^I am redirected to the corresponding website from the news results$/) do
  expect(current_url).to include($first_news_result_url)
end