Feature: The homepage

    @manual
    Scenario: Viewing the search page
        # Make sure everything on the search page is displaying correctly
        Given I am on the search page
        When I am viewing the content on the page
        Then I should be able to see a search bar with instructions on how to use it

    @automated
    Scenario Outline: Searching for an employee
        Given I am on the "<startpage>" page
        When I type "<searchbarInput>" inside the search input
        Then I should see the employees "<employeeOutput>"
        Examples:
            | startpage                    | searchbarInput | employeeOutput             |
            | http://127.0.0.1:8000/search | Thomas         | Thomas Bradley             |
            | http://127.0.0.1:8000/search | Davies         | Helen Davies               |
            | http://127.0.0.1:8000/search | Murphy         | James Murphy               |
            | http://127.0.0.1:8000/search | Dean           | Dean Smith                 |
            | http://127.0.0.1:8000/search | th             | Thomas Bradley, Dean Smith |

    @automated
    Scenario Outline: Searching for an employee with the filter option
        Given I am on the "<startpage>" page
        And I am filtering for "<filter>"
        When I type "<searchbarInput>" inside the search input
        Then I should see the employees "<employeeOutput>"
        Examples:
            | startpage                    | filter   | searchbarInput | employeeOutput             |
            | http://127.0.0.1:8000/search | name     | Th             | Thomas Bradley, Dean Smith |
            | http://127.0.0.1:8000/search | division | Transact       | Dean Smith, Derek Holmes   |
            | http://127.0.0.1:8000/search | date     | 2009           | James Murphy               |
            | http://127.0.0.1:8000/search | date     | 09/12/2008     | Helen Davies               |
