*** Settings ***
Library     BuiltIn
Resource    ../resources/keyword.resource
Library     ../resources/data.py
Library     RequestsLibrary
Library    Collections
Library    RequestsLibrary
Suite Setup    Get suite variable
Test Template    Update new booking with invalid details

*** Variables ***
@{json_data}


*** Test Cases ***    
with no firstname    &{json_data[0]}
with no lastname    &{json_data[1]}
with no total price    &{json_data[2]}
with no deposit paid   &{json_data[3]}
with no check in date    &{json_data[4]}
with no check out date    &{json_data[5]}



*** Keywords ***
Get suite variable
    @{json_data}=    Get Invalid Booking Details
    Set Suite Variable    @{json_data}

Update new booking with invalid details
    [Arguments]    &{data}
    Log Dictionary    ${data}
    ${res}=     PUT    https://restful-booker.herokuapp.com/booking    json=${data}    expected_status=anything
    Status Should Be    404    ${res}