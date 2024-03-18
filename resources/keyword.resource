*** Settings ***
Documentation    This file contains the keywords to be used in the test cases
Library    RequestsLibrary
Library    BuiltIn


*** Keywords ***
Get all booking IDs
    ${res}=    GET    https://restful-booker.herokuapp.com/booking
    Log    ${res.json()}
    RETURN    ${res}

Get all booking IDs filter by
    [Arguments]    &{parameters}
    ${res}=    GET    https://restful-booker.herokuapp.com/booking    params=&{parameters}
    Log    ${res.json()}
    RETURN    ${res}

Get booking details based on IDs
    [Arguments]    ${id}
    ${res}=    GET    https://restful-booker.herokuapp.com/booking/${id}
    Log    ${res.json()}
    RETURN    ${res}


Ping Check if API is working
    GET    https://restful-booker.herokuapp.com/ping    expected_status=200
    

