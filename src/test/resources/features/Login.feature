Feature: Login
  As user, I want to be able to log in into vytrack under different roles with username and password

  Scenario: Login as store manager
    Given user is on the login page
    Then user logs in as store manager
    And user verifies that "Dashboard" page subtitle is displayed

  Scenario: Login as store driver
    Given user is on the login page
    Then user logs in as driver
    And user verifies that "Dashboard" page subtitle is displayed

  Scenario: Login as sales manager
    Given user is on the login page
    Then user logs in as sales manager
    And user verifies that "Dashboard" page subtitle is displayed

    @negative_test
   Scenario: Verify that warning message is displayed when password not correct
     Given user is on the login page
     Then user enters "storemanager85" username and "wrong" password
     And user verify that "Invalid user name or password." message is displayed

  @negative_test
  Scenario: Verify that warning message is displayed when username is not correct
    Given user is on the login page
    Then user enters "wrong_username" username and "UserUser123" password
    And user verify that "Invalid user name or password." message is displayed