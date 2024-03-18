*** Settings ***
Library     BuiltIn
Resource    ../resources/keyword.resource
Library     ../resources/data.py
Library     RequestsLibrary
Library    Collections
Library    DataDriver    ../resources/valid_booking_details_for_update.csv
Test Template    Update booking with valid details

*** Test Cases ***    
Update booking details invalid details    ${id}    ${firstname}    ${lastname}    ${totalprice}    ${depositpaid}    ${checkindate}    ${checkoutdate}    ${additionalneeds}



*** Keywords ***
Update booking with valid details
    [Arguments]    ${id}    ${firstname}    ${lastname}    ${totalprice}    ${depositpaid}    ${checkindate}    ${checkoutdate}    ${additionalneeds}
    ${totalprice}=    Evaluate    int(${totalprice})
    ${depositpaid}=    Evaluate    bool(${depositpaid})
    ${bookingdates}=    Create Dictionary    checkin=${checkindate}    checkout=${checkoutdate}
    &{data}=    Create Dictionary    firstname=${firstname}    lastname=${lastname}    totalprice=${totalprice}    depositpaid=${depositpaid}    bookingdates=${bookingdates}    additionalneeds=${additionalneeds}
    Log Dictionary    ${data}
    ${res}=     PUT    https://restful-booker.herokuapp.com/booking/${id}    json=${data}    expected_status=anything
    Status Should Be    403    ${res}