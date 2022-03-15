Feature: The homepage
    @manual
    Scenario: Viewing the homepage
        # Make sure everything on the homepage is displaying correctly
        Given I am on the home page
        When I am viewing the content on the page
        Then I should be able to see a list of the employees working at the company

    @automated
    Scenario Outline: Visiting an employee page from the menu
        Given I am on the "<startpage>" page
        When I am clicking the "<employee>" employee
        Then I should redirect to the "<page>" page
        Examples:
            | startpage                      | employee       | page                                |
            | http://127.0.0.1:8000/homepage | Thomas Bradley | http://127.0.0.1:8000/employee?id=0 |
            | http://127.0.0.1:8000/homepage | Helen Davies   | http://127.0.0.1:8000/employee?id=1 |
            | http://127.0.0.1:8000/homepage | James Murphy   | http://127.0.0.1:8000/employee?id=2 |
