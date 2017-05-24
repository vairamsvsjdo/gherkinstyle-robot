.. default-role:: code

.. code:: robotframework

    *** Variables ***
    var1    hello world

    *** Settings ***
    Library    Selenium2Library

    *** Test Cases ***
    | Example of how to use keyword with embedded arguments
    | | ${result}= | When user "bob" is logged in with the following password: "superSecret!"
    | | Should be equal | ${result} | username is bob and password is superSecret!

    *** Keywords ***
    | When user "${user}" is logged in with the following password: "${password}"
    | | ${result}= | Set Variable | username is ${user} and password is ${password}
    | | [Return] | ${result}
        
