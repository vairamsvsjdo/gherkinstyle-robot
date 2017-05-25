*** Keywords ***
| When user "${user}" is logged in with the following password: "${password}"
| | ${result}= | Set Variable | username is ${user} and password is ${password}
| | [Return] | ${result}

| Todo "${variable1}" expected
| | Log | this is a todo ${variable1} |

| Variable at the end kw "${result}"
| | Log | ${result} is at the end |

| Variable in "${value1}" "${value2}" the middle continuous
| | Log | ${value1} ${value2} is in the middle |

| Variable in the end continuous "${value1}" "${value2}"
| | Log | ${value1} ${value2} is at the end |

| Variable "${value}" is correct
| | Should be equal | ${value} | username is bob and password is superSecret!

| Validate another keyword
| | Log | another then keyword

*** Test Cases ***
| Example of how to use keyword with embedded arguments
| | Given Todo "value1" expected
| | ${result}= | When user "bob" is logged in with the following password: "superSecret!"
| | And Variable at the end kw "value1"
| | And Variable in "value1" "value2" the middle continuous
| | And Variable in the end continuous "value1" "value2"
| | Then Validate another keyword