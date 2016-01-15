Web Automation Primer
=====================

A training excercise for those relatively new to automated web testing, using [Cucumber](http://cukes.info), [Watir Webdriver](http://watirwebdriver.com/), and [TestFactory](https://github.com/KualiCo/TestFactory).

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
- When you change directories into your clone, RVM will tell you to install ruby-2.3.0 if you don't already have it. Just follow the instructions it gives you. If you do already have the desired ruby version, RVM will automatically switch to that version and create a name gemset for you.
- Install the bundle:

```
gem install bundler --no-document
bundle install
gem install rubygems-bundler --no-document
gem regenerate_binstubs
```

- Note that there is basic Cucumber, WatirWebdriver, and TestFactory structure set up for you.
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

Insert Watir-Webdriver code into these steps to successfully perform a Google search for Kittens. You'll find some hints along the way. Ignore all hints related to TestFactory for now.

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

Insert Watir-Webdriver code into these steps to successfully find one search result and click on it.

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

Insert Watir-Webdriver code into these steps to successfully perform a search for Kittens, click the News tab, and verify that Kitten-related stuff is on the News page.

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

### The Page Object Design Pattern: Cleaning Up this Mess with TestFactory

Your completed automation code isn't going to be that messy right now since we're talking about a fairly trivial example, but we do still have an opportunity to apply some solid object-oriented design principles. Enter the [Page Object pattern](http://martinfowler.com/bliki/PageObject.html).

If an object is an entity modeled by software that has attributes (eg. a Car object would have many wheels, a motor, etc.) and behavior (eg. a Car object would accelerate, brake, turn, etc.), then we can imagine that an HTML web page conforming to this pattern quite easily. A page's DOM elements would comprise the page object's attributes, and methods could be written using those elements to describe and execute page behavior. Therefore, in our use of the Page Object pattern, every page we seek to test against should be defined as a Ruby class that our step definitions would then instantiate and use.

It is quite possible to [roll your own page object framework](http://watirmelon.com/2012/06/04/roll-your-own-page-objects/) and doing so for yourself would be a great extra-credit excercise to undertake.

However, for our purposes, we will use [TestFactory](https://github.com/KualiCo/TestFactory ) to streamline our implementation of page objects and to give our objects really neat built-in behavior. Give the README documentation, which is quite good, a good read to get an idea of all that TestFactory can do for us.

Page Object class stubs have been provided for you, with hints. The Cucumber step definitions have also been sprinkled with some additional hints related to TestFactory and page objects, which you are now free to pay attention to.

Your mission:

- In each class file in lib/page_objects, declare elements and methods to perform the web automation tasks you've already accomplished in your existing step definitions.
- Update features/step_definitions/my_google_steps.rb to use your newly crafted page object classes.

### Using Pry to debug when things go haywire

Let's say you have a scenario failing and you just can't figure out why. [Pry](http://pryrepl.org/) is...a lot of things, but for us it's a debugging tool with some pretty neat source code browsing features.

When a test fails, you'll see a stack trace in your console that should give you some indication of what part of your test code is the culprit:

```ruby
Feature: As a web automation tester in training I want to automate basic searching with Google

  Scenario: Basic search                           # features/my_google.feature:5
    Given I am on the Google Home Page             # features/step_definitions/my_google_steps.rb:3
    When I search for Kittens                      # features/step_definitions/my_google_steps.rb:11
          unable to locate element, using {:id=>"gbqfqqq", :tag_name=>"input or textarea", :type=>"(any text type)"} (Watir::Exception::UnknownObjectException)
          ./features/step_definitions/my_google_steps.rb:15:in `/^I search for Kittens$/'
          features/my_google.feature:8:in `When I search for Kittens'
    Then I see the Google Search Results Page      # features/step_definitions/my_google_steps.rb:26
    And the Google Search Results Page has Kittens # features/step_definitions/my_google_steps.rb:42

Failing Scenarios:
cucumber features/my_google.feature:5 # Scenario: Basic search

1 scenario (1 failed)
4 steps (1 failed, 2 skipped, 1 passed)
```

The above means either the page isn't loading or you've identified the element incorrectly - in either case the element is not being found. We can stop the test execution just before the failing line not only to freeze the browser view and observe visually, but to explore the relevant code in the Pry console as well. To set such a breakpoint:

features/step_definitions/my_google_steps.rb:12
```ruby
When(/^I search for Kittens$/) do
  binding.pry #Set a binding.pry at the line of code where you want the program to stop executing for further inspection
  @browser.text_field(id: "gbqfqqq").set 'Kittens'
  @browser.text_field(id: "gbqfqqq").click
end
```

You can then re-run the cucumber scenario to trigger the breakpoint and investigate further.

![A pry console](https://cloud.githubusercontent.com/assets/1831850/12362848/4af137d8-bb7a-11e5-897e-e367c58d3f94.png)

From there you can:

- [Inspect the desired element in the browser](http://screencast.com/t/o0dPtFg9e7) and discern the correct element identifier to use.

- Try out the new identifier right in the console to make sure it works before committing the code:

![Trying out the id I found](https://cloud.githubusercontent.com/assets/1831850/12362896/a0383b6a-bb7a-11e5-9fba-4d6b21637df5.png)

- Explore the "page" object to see what attributes it has:

![Exploring an object in pry is similar to exploring a file system](https://cloud.githubusercontent.com/assets/1831850/12362934/cfa5007c-bb7a-11e5-90a3-a62b3800a414.png)

You also have three basic step debugging commands to use in your Pry console:

- 'continue' or 'c': Continues execution until either next binding.pry breakpoint or, if there isn't one, until the program finishes or terminates.
- 'step' or 's': This 'steps into' the next line of code in the entire execution stack, including both the code you wrote along with the code made available via your various Gems.
- 'next' or 'n': This 'steps over' to the next line of code in the specific function you're in, while skipping over any underlying code that might be in the stack.

The 'continue' command will be by far the most common for us - use it when you're doing exploring and ready for the test to continue executing. Don't forget to remove all binding.pry statements when you're finished debugging.

This definitely isn't everything you can do with Pry, but it covers most of how we'll use it as UI test automators.

### Using Rubocop to Maintain Good Ruby Practices

[Rubocop](https://github.com/bbatsov/rubocop) is a tool we use to enforce good Ruby coding practices according to Ruby community standards.

Run it in your console like so:

```
rubocop --auto-correct
```

That will fix all the trivial problems it finds (missing spaces, indentation, etc.) and will alert you of more serious problems that you need to fix.

Rubocop is configured in .rubocop.yml. Note the exceptions that have been configured.
