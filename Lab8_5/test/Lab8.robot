*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Browser To Login Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --headless
    
    Create Webdriver    Chrome    options=${chrome_options}    executable_path=/usr/bin/chromedriver
    Go To    https://computing.kku.ac.th

*** Test Cases ***
My First Selenium Test
    Open Browser To Login Page
    Title Should Be    College of Computing, Khon Kaen University
    [Teardown]    Close Browser