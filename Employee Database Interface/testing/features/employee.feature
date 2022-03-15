Feature: The employee page

    @manual
    Scenario: Viewing the employee page
        # Make sure everything on a employee page is displaying correctly
        Given I am on an employee page
        When I am viewing the content on the page
        Then I should be able to see the details of that employee, including any supervisors and/or subordinates they have

    @automated
    Scenario Outline: Using the backbutton on the employee page
        Given I am on the "<startpage>" page
        And I navigate to the page "<page>"
        When I am clicking the button with the id "<button>"
        Then I should redirect to the "<startpage>" page
        Examples:
            | startpage                           | page                                | button     |
            | http://localhost:8000/homepage      | http://127.0.0.1:8000/employee?id=0 | backButton |
            | http://localhost:8000/search        | http://127.0.0.1:8000/employee?id=2 | backButton |
            | http://127.0.0.1:8000/employee?id=0 | http://127.0.0.1:8000/employee?id=4 | backButton |

    @automated
    Scenario Outline: Using the hierarchy on the employee page
        Given I am on the "<startpage>" page
        When I am clicking the hierarchy employee "<employee>"
        Then I should redirect to the "<page>" page
        Examples:
            | startpage                           | employee       | page                                |
            | http://127.0.0.1:8000/employee?id=1 | Thomas Bradley | http://127.0.0.1:8000/employee?id=0 |
            | http://127.0.0.1:8000/employee?id=1 | Dean Smith     | http://127.0.0.1:8000/employee?id=3 |
            | http://127.0.0.1:8000/employee?id=1 | Derek Holmes   | http://127.0.0.1:8000/employee?id=4 |