Feature: The login page

    @manual
    Scenario: Viewing login page
        # Make sure the login form is showing correctly
        Given I am on the login page
        When I am viewing the content on the page
        Then I should be able to see the login form

    @automated
    Scenario Outline: Filling out the login form correctly
        Given I am on the "http://127.0.0.1:8004/pages/login.html" page
        And I fill the field "email" with "<email>"
        And I fill the field "password" with "<password>"
        When I click on the element with the id "loginbutton"
        Then I should get an alert
        Examples:
            | email          | password |
            | admin@watch.it | admin!   |
            | tom@mail.uk    | PASSword |

    @automated
    Scenario Outline: Filling out the login form incorrectly
        Given I am on the "http://127.0.0.1:8004/pages/login.html" page
        And I fill the field "email" with "<email>"
        And I fill the field "password" with "<password>"
        When I click on the element with the id "loginbutton"
        Then I should be able to see the errors "<error>"
        Examples:
            | email          | password     | error |
            | admin@watch.it | passwordfail | login |
            | emailfail      | PASSword     | login |
            | emailfail      | passwordfail | login |