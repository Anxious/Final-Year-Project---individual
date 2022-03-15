Feature: The contact us page

    @manual
    Scenario: Viewing the contact page
        # Make sure the contact us form is showing correctly
        Given I am on the contact us page
        When I am viewing the content on the page
        Then I should be able to see the contact form

    @automated
    Scenario Outline: Filling out the contactus form correctly
        Given I am on the "http://127.0.0.1:8004/pages/contact-us.html" page
        And I fill the field "contactname" with "<name>"
        And I fill the field "contactemail" with "<email>"
        And I select the option "<topic>"
        And I fill the field "contacttext" with "<text>"
        When I click on the element with the id "contactbutton"
        Then I should get an alert
        Examples:
            | name        | email       | topic         | text                          |
            | Tom Hesketh | tom@mail.uk | Payment Issue | My payment was declined. Why? |


    @automated
    Scenario Outline: Filling out the contactus form incorrectly
        Given I am on the "http://127.0.0.1:8004/pages/contact-us.html" page
        And I fill the field "contactname" with "<name>"
        And I fill the field "contactemail" with "<email>"
        And I select the option "<topic>"
        And I fill the field "contacttext" with "<text>"
        When I click on the element with the id "contactbutton"
        Then I should be able to see the errors "<errors>"
        Examples:
            | name        | email       | topic         | text                          | errors                   |
            |             |             |               |                               | name, email, topic, text |
            |             | tom@mail.uk | Payment Issue | My payment was declined. Why? | name                     |
            | Tom Hesketh | tom@mail    | Payment Issue | My payment was declined. Why? | email                    |
            | Tom Hesketh | tom@mail.uk |               | My payment was declined. Why? | topic                    |
            | Tom Hesketh | tom@mail.uk | Payment Issue |                               | text                     |

