Feature: As a web automation tester in training I want to automate basic searching with Google

  #A scenario is a single test, a collection of Given, When, and Then steps
  Scenario: Basic search
    #A Given step is for setting up the scenario, aka doing the things necessary for the test to occur
    Given I am on the Google Home Page
    #A When step take an action
    When I search for Kittens
    #A Then step tests the results of the action
    Then I see the Google Search Results Page
    #An And step mimics the purpose of the step above it, so this would function as another Then step
    And the Google Search Results Page has Kittens

    #You can perform any number of additional When-Then tests within a given scenario
#    When I click the first result on the Google Search Results page
#    Then I am redirected to the corresponding website from the search result

  #A new scenario for a News search, note that we're re-using a couple of earlier steps
  #Cucumber steps are defined once but can be reused all over
  Scenario: Basic search, then switch to News
    Given I am on the Google Home Page
    And I search for Kittens
    When I click the News Tab on the Google Search Results Page
    Then I see the Google News Results Page
    And the Google News Results Page has Kittens