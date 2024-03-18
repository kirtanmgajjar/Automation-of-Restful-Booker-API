*** Settings ***
Library     BuiltIn
Resource    ../resources/keyword.resource
Library     RequestsLibrary


*** Test Cases ***
Get method to retrieve booking details based on booking Id
    ${res}=    Get booking details based on IDs   1
    Status Should Be    200    ${res}
    &{exp_res}=    Evaluate    {'firstname': 'Sally', 'lastname': 'Brown', 'totalprice': 225, 'depositpaid': True, 'bookingdates': {'checkin': '2017-01-09', 'checkout': '2023-10-10'}, 'additionalneeds': 'Breakfast'}
    Should Be Equal    ${res.json()}    ${exp_res}