*** Keywords ***
When user "${user}" is logged in with the following password: "${password}"
    ${result}=    Set Variable    username is ${user} and password is ${password}
    [Return]    ${result}

Todo "${arg2}" expected
    Log    this is a todo ${arg2}

Variable at the end kw "${arg1}"
    Log    ${arg1} is at the end    console=yes

Variable in "${arg1}" "${arg2}" the middle continuous
    Log    ${arg1} ${arg2} is in the middle

Variable in the end continuous "${arg1}" "${arg2}"
    Log    ${arg1} ${arg2} is at the end

Variable "${arg1}" is correct
    Should be equal    ${arg1}   username is bob and password is superSecret!

Validate "${arg1}" calling another keyword
    Variable "${arg1}" is correct

Validate "${arg1}" calling another keyword at end
    Variable at the end kw "${arg1}"

Keywords below this keywords fail
    Log    another then keyword

Validate builtin with gherkin call "${arg1}"
    Log "${arg1}"


*** Test Cases ***
Example of how to use keyword with embedded arguments working
    Given Todo "value1" expected
    ${output}=    When user "bob" is logged in with the following password: "superSecret!"
    And Variable at the end kw "value1"
    And Variable in "value1" "value2" the middle continuous
    And Variable in the end continuous "value1" "value2"
    Then Variable "${output}" is correct
    Then Validate "${output}" calling another keyword
    Then Validate "${output}" calling another keyword at end
    
Example of how to use keyword with embedded arguments NOT working
    Given Todo "value1" expected
    ${output}=    When user "bob" is logged in with the following password: "superSecret!"
    And Variable at the end kw "value1"
    And Variable in "value1" "value2" the middle continuous
    And Variable in the end continuous "value1" "value2"
    Then Variable "${output}" is correct
    Then Validate "${output}" calling another keyword
    Then Validate "${output}" calling another keyword at end
    Then Validate builtin with gherkin call "successful"
