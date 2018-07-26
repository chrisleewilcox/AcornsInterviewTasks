Feature: Redfin Login and Search
  Part 1 of the interview tasks

  Scenario: Signing in with valid username and password
    Given I navigated to test application home page
    When I Login with valid credentials
    Then my first name "QA" will be displayed in the user menu

  Scenario: Searching for a property in a city with at least 3 filters
    When I search for a property in "Santa Ana", with max price "$850k",  minimum beds is "6", "3" or more baths
    Then the results returned will match my criteria
