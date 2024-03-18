*** Settings ***
Library     BuiltIn
Resource    ../resources/keyword.resource
Library     RequestsLibrary


*** Test Cases ***
Get method to retrieve all booking ID
    ${res}=    Get all booking IDs
    Status Should Be    200    ${res}

Get method to retrieve booking id based on name
    &{params}=    Create Dictionary    firstname=Bruce    lastname=Wayne
    ${res}=    Get all booking IDs filter by    &{params}
    Status Should Be    200    ${res}

Get method to retrieve booking id based on check in date
    &{params}=    Create Dictionary    checkin=2024-06-22
    ${res}=    Get all booking IDs filter by    &{params}
    Status Should Be    200    ${res}

Get method to retrieve booking id based on check out date
    &{params}=    Create Dictionary    checkout=2024-07-01
    ${res}=    Get all booking IDs filter by    &{params}
    Status Should Be    200    ${res}