Feature: The subscribe page

    @manual
    Scenario: Viewing the subscribe page
        # Make sure the subscribe form is showing correctly
        Given I am on the subscribe page
        When I am viewing the content on the page
        Then I should be able to see the subscribe form

    Scenario Outline: Filling out the subscribe form
        Given I am on the "http://127.0.0.1:8004/pages/subscribe.html" page
        And I fill the field "name" with "<name>"
        And I fill the field "password" with "<password>"
        And I fill the field "password2" with "<password2>"
        And I fill the field "email" with "<email>"
        And I fill the field "ccholder" with "<ccholder>"
        And I fill the field "ccmm" with "<ccmm>"
        And I fill the field "ccyy" with "<ccyy>"
        And I fill the field "ccnumber" with "<ccnumber>"
        And I fill the field "cccvc" with "<cccvc>"
        When I click on the element with the id "subscribebutton"
        Then I should get an alert
        Examples:
            | name   | password     | password2    | email        | ccholder    | ccmm | ccyy | ccnumber         | cccvc |
            | Thomas | goodpassword | goodpassword | tom@mail.com | Thomas York | 12   | 22   | 1234567890123456 | 123   |


    Scenario Outline: Filling out the subscribe form incorrectly
        Given I am on the "http://127.0.0.1:8004/pages/subscribe.html" page
        And I fill the field "name" with "<name>"
        And I fill the field "password" with "<password>"
        And I fill the field "password2" with "<password2>"
        And I fill the field "email" with "<email>"
        And I fill the field "ccholder" with "<ccholder>"
        And I fill the field "ccmm" with "<ccmm>"
        And I fill the field "ccyy" with "<ccyy>"
        And I fill the field "ccnumber" with "<ccnumber>"
        And I fill the field "cccvc" with "<cccvc>"
        When I click on the element with the id "subscribebutton"
        Then I should be able to see the errors "<errors>"
        Examples:
            | name     | password     | password2    | email        | ccholder    | ccmm | ccyy | ccnumber          | cccvc | errors                                                              |
            |          | a            |              |              |             |      |      |                   |       | name, password, password2, email, ccholder, ccdate, ccnumber, cccvc |
            |          | goodpassword | goodpassword | tom@mail.com | Thomas York | 12   | 22   | 12345678901234567 | 123   | name                                                                |
            | Thomas Y | go           | goodpassword | tom@mail.com | Thomas York | 12   | 22   | 12345678901234567 | 123   | password                                                            |
            | Thomas Y | goodpassword | goodpasswor  | tom@mail.com | Thomas York | 12   | 22   | 12345678901234567 | 123   | password2                                                           |
            | Thomas Y | goodpassword | goodpassword | tom@mailcom  | Thomas York | 12   | 22   | 12345678901234567 | 123   | email                                                               |
            | Thomas Y | goodpassword | goodpassword | tom@mail.com |             | 12   | 22   | 12345678901234567 | 123   | ccholder                                                            |
            | Thomas Y | goodpassword | goodpassword | tom@mail.com | Thomas York | 13   | 22   | 12345678901234567 | 123   | ccdate                                                              |
            | Thomas Y | goodpassword | goodpassword | tom@mail.com | Thomas York | 12   | 20   | 12345678901234567 | 123   | ccdate                                                              |
            | Thomas Y | goodpassword | goodpassword | tom@mail.com | Thomas York | 12   | 22   | 12345678901234567 | 123   | ccnumber                                                            |
            | Thomas Y | goodpassword | goodpassword | tom@mail.com | Thomas York | 12   | 22   | 123456789012345   | 1234  | cccvc                                                               |