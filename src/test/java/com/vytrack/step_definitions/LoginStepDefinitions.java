package com.vytrack.step_definitions;

import com.vytrack.utilities.ConfigurationReader;
import com.vytrack.utilities.Driver;
import io.cucumber.java.en.*;

public class LoginStepDefinitions {
    @Given("user is on the login page")
    public void user_is_on_the_login_page() {
        System.out.println("I am on login page");
        Driver.getDriver().get(ConfigurationReader.getProperty("url"));
    }

    @Then("user logs in as store manager")
    public void use_logs_in_as_store_manager() {
        System.out.println("Login as store manager");
    }

    @Then("user verifies that {string} page subtitle is displayed")
    public void user_verifies_that_page_subtitle_is_displayed(String string) {
        System.out.println("Verifying page subtitle: "+string);
    }
    @Then("user logs in as driver")
    public void user_logs_in_as_driver() {
        System.out.println("Login as driver");

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



}
