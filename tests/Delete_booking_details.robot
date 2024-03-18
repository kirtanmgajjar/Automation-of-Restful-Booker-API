*** Settings ***
Library     BuiltIn
Resource    ../resources/keyword.resource
Library     ../resources/data.py
Library     RequestsLibrary
Library    Collections

*** Variables ***
${id}    2707

*** Test Cases ***    
Delete booking details by ID
    ${res}=     DELETE    https://restful-booker.herokuapp.com/booking/${id}    expected_status=anything
    Status Should Be    403    ${res}
    
