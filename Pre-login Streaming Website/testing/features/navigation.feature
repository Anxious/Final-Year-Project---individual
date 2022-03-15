Feature: The navigation bar

    @manual
    Scenario Outline: Viewing the navigation bar
        # Make sure the navigation bar has all appropriate content displayed
        Given I am on any page of the website
        When I am viewing the navbar of the page
        Then I should be able some sort of branding on the left, and <link> on the right in <order> order.
        Examples:
            | Order | Link        |
            | 1     | Home        |
            | 2     | Our content |
            | 3     | Contact us  |
            | 4     | Login       |
            | 5     | Subscribe   |

    @automated
    Scenario Outline: Navigation to pages from other pages using the navbar
        Given I am on the "<startpage>" page
        When I am clicking the "<navitem>" item
        Then I should redirect to the "<page>" page
        Examples:
            | startpage                                   | navitem    | page                                        |
            | http://127.0.0.1:8004/index.html            | Home       | http://127.0.0.1:8004/index.html            |
            | http://127.0.0.1:8004/index.html            | Featured   | http://127.0.0.1:8004/pages/features.html   |
            | http://127.0.0.1:8004/index.html            | Contact Us | http://127.0.0.1:8004/pages/contact-us.html |
            | http://127.0.0.1:8004/index.html            | Login      | http://127.0.0.1:8004/pages/login.html      |
            | http://127.0.0.1:8004/index.html            | Subscribe  | http://127.0.0.1:8004/pages/subscribe.html  |
            | http://127.0.0.1:8004/pages/features.html   | Featured   | http://127.0.0.1:8004/pages/features.html   |
            | http://127.0.0.1:8004/pages/features.html   | Home       | http://127.0.0.1:8004/index.html            |
            | http://127.0.0.1:8004/pages/features.html   | Contact Us | http://127.0.0.1:8004/pages/contact-us.html |
            | http://127.0.0.1:8004/pages/features.html   | Login      | http://127.0.0.1:8004/pages/login.html      |
            | http://127.0.0.1:8004/pages/features.html   | Subscribe  | http://127.0.0.1:8004/pages/subscribe.html  |
            | http://127.0.0.1:8004/pages/contact-us.html | Contact Us | http://127.0.0.1:8004/pages/contact-us.html |
            | http://127.0.0.1:8004/pages/contact-us.html | Home       | http://127.0.0.1:8004/index.html            |
            | http://127.0.0.1:8004/pages/contact-us.html | Featured   | http://127.0.0.1:8004/pages/features.html   |
            | http://127.0.0.1:8004/pages/contact-us.html | Login      | http://127.0.0.1:8004/pages/login.html      |
            | http://127.0.0.1:8004/pages/contact-us.html | Subscribe  | http://127.0.0.1:8004/pages/subscribe.html  |
            | http://127.0.0.1:8004/pages/login.html      | Login      | http://127.0.0.1:8004/pages/login.html      |
            | http://127.0.0.1:8004/pages/login.html      | Home       | http://127.0.0.1:8004/index.html            |
            | http://127.0.0.1:8004/pages/login.html      | Featured   | http://127.0.0.1:8004/pages/features.html   |
            | http://127.0.0.1:8004/pages/login.html      | Contact Us | http://127.0.0.1:8004/pages/contact-us.html |
            | http://127.0.0.1:8004/pages/login.html      | Subscribe  | http://127.0.0.1:8004/pages/subscribe.html  |
            | http://127.0.0.1:8004/pages/subscribe.html  | Subscribe  | http://127.0.0.1:8004/pages/subscribe.html  |
            | http://127.0.0.1:8004/pages/subscribe.html  | Home       | http://127.0.0.1:8004/index.html            |
            | http://127.0.0.1:8004/pages/subscribe.html  | Featured   | http://127.0.0.1:8004/pages/features.html   |
            | http://127.0.0.1:8004/pages/subscribe.html  | Contact Us | http://127.0.0.1:8004/pages/contact-us.html |
            | http://127.0.0.1:8004/pages/subscribe.html  | Login      | http://127.0.0.1:8004/pages/login.html      |








