@javascript
Feature: As a web automation tester in training I want to automate basic searching with Google

  Scenario: Basic search
    Given I am on the Google Home Page
    When I search for Kittens
    Then I see the Google Search Results Page
    And the search_results Page has Kittens
    When I click the first result on the Google Search Results page
    Then I am redirected to the corresponding website from the search result

  Scenario: Basic search, then switch to News
    Given I am on the Google Home Page
    And I search for Kittens
    When I click the News Tab on the Google Search Results Page
    Then I see the Google News Results Page
    And the news_results Page has Kittens
    When I click the first result on the Google News Results page
    Then I am redirected to the corresponding website from the news results
