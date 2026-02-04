*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Browser To Login Page
    
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --headless
    
    Call Method    ${chrome_options}    set_binary_location    /usr/bin/chromium

    
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path=r'/usr/bin/chromedriver')    sys, selenium.webdriver.chrome.service

    
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    
    Go To    https://computing.kku.ac.th

*** Test Cases ***
My First Selenium Test
    Open Browser To Login Page
    Title Should Be    College of Computing, Khon Kaen University
    [Teardown]    Close Browser