Feature: Login
  As user, I want to be able to log in into vytrack under different roles with username and password

  @store_manager
  Scenario: Login as store manager
    Given user is on the login page
    Then user logs in as store manager
    And user verifies that "Dashboard" page subtitle is displayed
  @driver
  Scenario: Login as store driver
    Given user is on the login page
    Then user logs in as driver
    And user verifies that "Dashboard" page subtitle is displayed

  @driver_negative
  Scenario: Driver login negative
    Given user is on the login page
    Then user logs in as driver
    And verify user can't log in

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

  @driver_with_data_table
  Scenario: Login as driver (data table example)
    Given user is on the login page
    Then user logs in as driver with following credentials
      | username | user160      |
      | password | UserUser123  |
    And user verifies that "Quick Launchpad" page subtitle is displayed