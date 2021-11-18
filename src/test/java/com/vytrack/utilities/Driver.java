package com.vytrack.utilities;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

public class Driver {
    private static WebDriver driver;

    // you can not do like this, if constructor is private Driver obj = new Driver()
    private Driver(){

    }
    public static WebDriver getDriver(){
        if(driver==null){
            String browser = utils.ConfigurationReader.getProperty("browser");
            switch (browser){
                case "chrome":
                    WebDriverManager.chromedriver().setup();
                    driver = new ChromeDriver();
                    break;
                case "firefox":
                    WebDriverManager.firefoxdriver().setup();
                    driver = new FirefoxDriver();
                    break;
                default:
                    //if browser type is wrong, stop tests and throw exception
                    throw new RuntimeException("Wrong browser type!");
            }
        }
        return driver;
    }
    public static void close(){
        //if driver still exists
        if (driver!=null){
            //close all browsers
            driver.quit();
            //destroy driver object, ready for gc (garbage collector)
            driver=null;
        }
    }
}