package com.vytrack.step_definitions;

import com.vytrack.pages.CreateCarPage;
import io.cucumber.java.en.*;

import java.util.List;
import java.util.Map;

public class CreateCarStepDefinitions {
    CreateCarPage createCarPage = new CreateCarPage();

    @Then("user click on {string} button")
    public void user_click_on_button(String string) {

    }
//    Then user adds new car information:
//            |License Plate  | Driver      |Location       |Model Year       |Color |
//            | TestPlates    |Test Driver  |Washington D.C.| 2020            |Black|
//            | CoolPlates    |Pro Driver   |Reston, VA     | 2011            |White|
    @Then("user adds new car information:")
    public void user_adds_new_car_information(List<Map<String, String>> dataTable) {

           }

}
