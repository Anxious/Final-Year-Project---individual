Feature: The navigation bar

    @manual
    Scenario: Viewing the navigation bar
        # Make sure the navigation bar has all appropriate content displayed
        Given I am on any page of the website
        When I am viewing the navbar of the page
        Then I should be able to see <link> in the <order> order.
        Examples:
            | Order | Link   |
            | 1     | Home   |
            | 2     | Search |

    @automated
    Scenario Outline: Navigation to pages from other pages using the navbar
        Given I am on the "<startpage>" page
        When I am clicking the "<navitem>" item
        Then I should redirect to the "<page>" page
        Examples:
            | startpage                           | navitem | page                           |
            | http://127.0.0.1:8000/homepage      | Home    | http://127.0.0.1:8000/homepage |
            | http://127.0.0.1:8000/homepage      | Search  | http://127.0.0.1:8000/search   |
            | http://127.0.0.1:8000/search        | Home    | http://127.0.0.1:8000/homepage |
            | http://127.0.0.1:8000/search        | Search  | http://127.0.0.1:8000/search   |
            | http://127.0.0.1:8000/employee?id=0 | Home    | http://127.0.0.1:8000/homepage |
            | http://127.0.0.1:8000/employee?id=0 | Search  | http://127.0.0.1:8000/search   |
