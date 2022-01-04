Feature: Login
  As user, I want to be able to log in into vytrack under different roles with username and password

@login
  Given I login page
  When I enter "user name" in user name field
  And I enter the "password" to the password field
  And I press the "login" button
  Then I should see the "welcome" page

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

    @login_with_role
    Scenario: Login as driver
      Given user is on the login page
      And user logs in as "driver"

    @login_with_role
    Scenario: Login as sales manager
      Given user is on the login page
      And user logs in as "sales manager"

    @login_with_role
    Scenario: Login as store manager
      Given user is on the login page
      And user logs in as "store manager"

      @login_with_role_ddt
      Scenario Outline: Login as <role>
        Given user is on the login page
        Then user logs in as "<role>"

        Examples: roles
        | role               |
        | driver             |
        | sales manager      |
        | store manager      |

  @login_with_credentials_ddt
  Scenario Outline: DDT example with credentials, Login as <username>
    Given user is on the login page
    Then user enters "<username>" username and "<password>" password

    Examples:
    | username        | password      |
    | storemanager    | UserUser123   |
    | user160         | UserUser123   |
    | salesmanager110 | UserUser123   |

    @login_with_roles_ddt_2
  Scenario Outline: Login as <role> and verify <title> page title is correct
    Given user is on the login page
    And user logs in as "<role>"
    When user navigates to "<module>" then to "<sub module>"
    Then the page title should be "<title>"

    Examples: drivers
      | role    | module      | sub module        | title                                                             |
      | driver  | Fleet       | Vehicles          |   Car - Entities - System - Car - Entities - System               |
      | driver  | Fleet       | Vehicles Model    |   Vehicles Model - Entities - System - Car - Entities - System    |
      | driver  | Customers   | Accounts          |   Accounts - Customers                                            |
      | driver  | Customers   | Contacts          |   Contacts - Customers                                            |
      | driver  | Activities  | Calendar Events   |   Calendar Events - Activities                                    |
      | driver  | System      | Jobs              |   Jobs - System                                                   |


      Examples: sales managers
        | role           | module      | sub module        | title                                                             |
        | sales manager  | Fleet       | Vehicles          |   Car - Entities - System - Car - Entities - System               |
        | sales manager  | Fleet       | Vehicles Model    |   Vehicles Model - Entities - System - Car - Entities - System    |
        | sales manager  | Customers   | Accounts          |   Accounts - Customers                                            |
        | sales manager  | Customers   | Contacts          |   Contacts - Customers                                            |
        | sales manager  | Activities  | Calendar Events   |   Calendar Events - Activities                                    |
        | sales manager  | System      | Jobs              |   Jobs - System                                                   |

      Examples: store managers
        | role           | module      | sub module        | title                                                             |
        | store manager  | Fleet       | Vehicles          |   Car - Entities - System - Car - Entities - System               |
        | store manager  | Fleet       | Vehicles Model    |   Vehicles Model - Entities - System - Car - Entities - System    |
        | store manager  | Customers   | Accounts          |   Accounts - Customers                                            |
        | store manager  | Customers   | Contacts          |   Contacts - Customers                                            |
        | store manager  | Activities  | Calendar Events   |   Calendar Events - Activities                                    |
        | store manager  | System      | Jobs              |   Jobs - System                                                   |









