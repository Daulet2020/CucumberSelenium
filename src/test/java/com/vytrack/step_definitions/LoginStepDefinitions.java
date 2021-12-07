package com.vytrack.step_definitions;

import com.vytrack.pages.LoginPage;
import com.vytrack.utilities.BrowserUtils;
import com.vytrack.utilities.ConfigurationReader;
import com.vytrack.utilities.Driver;
import io.cucumber.java.en.*;
import org.junit.Assert;

import java.util.Map;

public class LoginStepDefinitions {
    LoginPage loginPage = new LoginPage();   //created login page object

    @Given("user is on the login page")
    public void user_is_on_the_login_page() {
        System.out.println("I am on login page");
        Driver.get().get(ConfigurationReader.getProperty("url"));
    }

    @Then("user logs in as store manager")
    public void use_logs_in_as_store_manager() {
        System.out.println("Login as store manager");
        //we read username and password from property file
        String userName = ConfigurationReader.getProperty("user_name");
        String password = ConfigurationReader.getProperty("password");
        loginPage.login(userName, password);
    }

    @Then("user verifies that {string} page subtitle is displayed")
    public void user_verifies_that_page_subtitle_is_displayed(String string) {
        Assert.assertEquals(string, loginPage.getPageSubTitle());
        System.out.println("Verifying page subtitle: "+string);
    }

    @Then("user logs in as driver")
    public void user_logs_in_as_driver() {
        String userName = ConfigurationReader.getProperty("driver_username");
        String password = ConfigurationReader.getProperty("driver_password");
        loginPage.login(userName, password);
        System.out.println("Logged in as driver");
    }

    @Then("verify user can't log in")
    public void verify_user_can_t_log_in() {
        loginPage.errorMessage.isDisplayed();
        System.out.println("Error message is displayed");
    }

    @Then("user logs in as sales manager")
    public void user_logs_in_as_sales_manager() {
        System.out.println("Loginn as sales manager");

    }
    //     Then user enters "storemanager85" username and "wrong" password
    @Then("user enters {string} username and {string} password")
    public void user_enters_username_and_password(String string, String string2) {
        System.out.println("Login with "+string+" username and "+string2+" password.");
    }

    @Then("user verify that {string} message is displayed")
    public void user_verify_that_message_is_displayed(String string) {
        System.out.println("Verified that warning message is displayed: "+string);
    }
//
//    Then user logs in as driver with following credentials
//              | username | user160      |
//              | password | UserUser123  |
    @Then("user logs in as driver with following credentials")
    public void user_logs_in_as_driver_with_following_credentials(Map<String, String> dataTable) {
        System.out.println(dataTable);
        loginPage.login(dataTable.get("username"), dataTable.get("password"));

    }

    @Given("user logs in as {string}")
    public void user_logs_in_as(String role) {
        loginPage.login(role);
    }





}
