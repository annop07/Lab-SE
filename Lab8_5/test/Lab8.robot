*** Settings ***
Library           BuiltIn

*** Test Cases ***
Example Test
    Log    Hello Jenkins from Robot Framework
    Should Be True    ${TRUE}