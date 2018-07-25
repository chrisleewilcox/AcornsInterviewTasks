Feature: Redfin Login and Search
  Part 1 of the interview tasks

  Scenario: Signing in with valid username and password
    Given I navigated to test application home page
    When I Login with valid credentials
    Then my first name "QA" will be displayed in the user menu
