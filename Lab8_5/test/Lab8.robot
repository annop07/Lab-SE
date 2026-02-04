*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Browser To Login Page
    
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    
    
    ${chrome_options.binary_location}=    Set Variable    /usr/bin/chromium
    
    
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --headless

    
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path=r'/usr/bin/chromedriver')    sys, selenium.webdriver.chrome.service

    
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    
    Go To    https://computing.kku.ac.th

*** Test Cases ***
My First Selenium Test
    Open Browser To Login Page
    Log    Opened website successfully
    [Teardown]    Close Browser