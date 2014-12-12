Web Automation Primer
=====================

A training excercise for those relatively new to automated web testing, using [Cucumber](http://cukes.info), [Capybara](https://github.com/jnicklas/capybara), and [SitePrism](https://github.com/natritmeyer/site_prism).

## But What If I'm Not Good At Ruby Yet?

Keep in mind that you need only be competent in basic object-oriented programming in Ruby to get started, and that your skillset in this regard will absolutely grow in a relatively short time. Certainly don't be intimidated simply because you don't think of yourself as a programmer yet.

If you'd like, there are a couple of free online resources that will help you get familiar with the basics:

- [Code School's free "Try Ruby" course](https://www.codeschool.com/courses/try-ruby).
- For both fun and education, I highly recommend [Bloc's Ruby Warrior game](https://www.bloc.io/ruby-warrior/#/).
- Another tool I really like is [Exercism](http://exercism.io), which is likely a bit more advanced than you'd really need to start web automation, but it will excercise (see what I did there?) your ability to write and refactor good object-oriented code while giving and receiving feedback.

## The Mission: Automate Google

Let's start with automating some simple operations on a website you likely know well and use every day. This excercise will be incremental in that we'll start with a single action on a single page, progress to an action on a different page, and then end up with a test that spans multiple pages, which is where we'll introduce the Page Object pattern, which in short is how we'll apply object-oriented design principles to our test code.

Some basic first steps:

- Set up [Homebrew](http://brew.sh) if you haven't already. SKIP THIS STEP if you're on Linux instead of OSX.

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Follow on-screen instructions to run "brew doctor" after the install.

- Set up [Ruby Version Manager](http://rvm.io) (RVM) if you haven't already.

```
\curl -sSL https://get.rvm.io | bash -s stable --autolibs=enable
```

- "Watch" this repo so you're notified when it updates (eg. when I change or add instructions).
- Fork this repo, and then clone it to your local machine.
- When you change directories into your clone, RVM will tell you to install ruby-2.1.5 if you don't already have it. Just follow the instructions it gives you. If you do already have the desired ruby version, RVM will automatically switch to that version and create a name gemset for you.
- Install the bundle:

```
gem install bundler
bundle install
gem install rubygems-bundler
gem regenerate_binstubs
```

- Note that there is basic Cucumber, Capybara, and SitePrism structure set up for you.
    - features/my_google.feature: This is the file that will contain our Gherkin-formatted description of our desired behavior, which will drive the tests.
    - features/step_definitions/my_google_steps.rb: This is the file that translates the plain-english steps from the .feature files into executable ruby code. This is the "meat" of our test automation.
    - features/support/env.rb: This is the file that contains initialization and setup for our automated tests.
    - page_objects: This is the folder that will contain our page object class definitions when it comes time to create them.

Another important step: how to run Cucumber tests!

```
cucumber #runs all tests
cucumber features/my_google.feature #runs just one feature file's tests
cucumber features/my_google.feature:5 #runs just one test located by line number in the feature file
```

### The Mission Part One: Simple Search

Given this Cucumber scenario:

features/my_google.feature:5

```ruby
  Scenario: Basic search
    Given I am on the Google Home Page
    When I search for Kittens
    Then I see the Google Search Results Page
    And the Google Search Results Page has Kittens
```

Insert Capybara code into these steps to successfully perform a Google search for Kittens. You'll find some hints along the way.

features/step_definitions/my_google_steps.rb:

```ruby
Given(/^I am on the Google Home Page$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I search for Kittens$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see the Google Search Results Page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the Google Search Results Page has Kittens$/) do
  pending # express the regexp above with the code you wish you had
end
```

### The Mission Part Two: Browse Search Results

Given these two Cucumber steps:

features/my_google.feature:16

```ruby
    When I click the first result on the Google Search Results page
    Then I am redirected to the corresponding website from the search result
```

Insert Capybara code into these steps to successfully find one search result and click on it.

features/step_definitions/my_google_steps.rb

```ruby
When(/^I click the first result on the Google Search Results page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am redirected to the corresponding website from the search result$/) do
  pending # express the regexp above with the code you wish you had
end
```

### The Mission Part Three: Narrow Results by News Tab

Given this Cucumber scenario:

features/my_google.feature:21

```ruby
  Scenario: Basic search, then switch to News
    Given I am on the Google Home Page
    And I search for Kittens
    When I click the News Tab on the Google Search Results Page
    Then I see the Google News Results Page
    And the Google News Results Page has Kittens
```

Insert Capybara code into these steps to successfully perform a search for Kittens, click the News tab, and verify that Kitten-related stuff is on the News page.

features/step_definitions/my_google_steps.rb

```ruby
When(/^I click the News Tab on the Google Search Results Page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see the Google News Results Page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the Google News Results Page has Kittens$/) do
  pending # express the regexp above with the code you wish you had
end
```

### The Page Object Design Pattern: Cleaning Up this Mess with SitePrism
Coming soon...

### Using Pry to debug when things go haywire

Coming soon...
