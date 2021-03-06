.. default-role:: code

.. code:: robotframework

    *** Variables ***

    *** Settings ***

    *** Test Cases ***
    | Example of how to use keyword with embedded arguments working
    | | Given Todo "value1" expected
    | | ${output}= | When user "bob" is logged in with the following password: "superSecret!"
    | | And Variable at the end kw "value1"
    | | And Variable in "value1" "value2" the middle continuous
    | | And Variable in the end continuous "value1" "value2"
    | | Then Variable "${output}" is correct

    | Example of how to use keyword with embedded arguments NOT working
    | | Given Todo "value1" expected
    | | ${output}= | When user "bob" is logged in with the following password: "superSecret!"
    | | And Variable at the end kw "value1"
    | | And Variable in "value1" "value2" the middle continuous
    | | And Variable in the end continuous "value1" "value2"
    | | Then Variable "${output}" is correct
    | | Then Keywords below this keywords fail
    | | Then Validate builtin with gherkin call

    *** Keywords ***
    | When user "${user}" is logged in with the following password: "${password}"
    | | ${result}= | Set Variable | username is ${user} and password is ${password}
    | | [Return] | ${result}

    | Todo "${arg1}" expected
    | | Log | this is a todo ${arg1} |

    | Variable at the end kw "${arg1}"
    | | Log | ${arg1} is at the end |

    | Variable in "${arg1}" "${arg2}" the middle continuous
    | | Log | ${arg1} ${arg2} is in the middle |

    | Variable in the end continuous "${arg1}" "${arg2}"
    | | Log | ${arg1} ${arg2} is at the end |

    | Variable "${arg1}" is correct
    | | Should be equal | ${arg1} | username is bob and password is superSecret!

    | Keywords below this keywords fail
    | | Log | another then keyword

    | Validate builtin with gherkin call
        Log "another then keyword"
