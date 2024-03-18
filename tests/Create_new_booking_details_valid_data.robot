*** Settings ***
Library     BuiltIn
Resource    ../resources/keyword.resource
Library     ../resources/data.py
Library     RequestsLibrary
Library    Collections
Library    DataDriver    ../resources/valid_booking_details.csv
Test Template    Create booking with valid details

*** Test Cases ***    
Create booking details valid details    ${firstname}    ${lastname}    ${totalprice}    ${depositpaid}    ${checkindate}    ${checkoutdate}    ${additionalneeds}



*** Keywords ***
Create booking with valid details
    [Arguments]    ${firstname}    ${lastname}    ${totalprice}    ${depositpaid}    ${checkindate}    ${checkoutdate}    ${additionalneeds}
    ${totalprice}=    Evaluate    int(${totalprice})
    ${depositpaid}=    Evaluate    bool(${depositpaid})
    ${bookingdates}=    Create Dictionary    checkin=${checkindate}    checkout=${checkoutdate}
    &{data}=    Create Dictionary    firstname=${firstname}    lastname=${lastname}    totalprice=${totalprice}    depositpaid=${depositpaid}    bookingdates=${bookingdates}    additionalneeds=${additionalneeds}
    Log Dictionary    ${data}
    ${res}=     POST    https://restful-booker.herokuapp.com/booking    json=${data}    expected_status=anything
    Status Should Be    200    ${res}
    Should Be Equal    ${res.json()["booking"]}   ${data}