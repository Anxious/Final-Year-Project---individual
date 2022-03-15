Feature: The navigation bar

    @manual
    Scenario Outline: Viewing the navigation bar from the blog list page
        # Make sure the navigation bar has all appropriate content displayed on the blog post page
        Given I am on the blog list of the website
        When I am viewing the navbar of the page
        Then I should be able the healthfo text and <link> on the right in <order> order.
        Examples:
            | Order | Link |
            | 1     | Home |

    @manual
    Scenario Outline: Viewing the navigation bar from a blog post
        # Make sure the navigation bar has all appropriate content displayed on the blog list page
        Given I am on the blog list of the website
        When I am viewing the navbar of the page
        Then I should be able the healthfo text and <link> on the right in <order> order.
        Examples:
            | Order | Link  |
            | 1     | Home  |
            | 2     | Posts |

    @automated
    Scenario Outline: Navigation to pages from other pages using the navbar
        Given I am on the "<startpage>" page
        When I am clicking the "<navitem>" item
        Then I should redirect to the "<endpage>" page
        Examples:
            | startpage                                        | navitem | endpage                                   |
            | http://127.0.0.1:8004/pages/bloglist.html        | Home    | http://127.0.0.1:8004/index.html          |
            | http://127.0.0.1:8004/pages/blogposts/post1.html | Home    | http://127.0.0.1:8004/index.html          |
            | http://127.0.0.1:8004/pages/blogposts/post1.html | Posts   | http://127.0.0.1:8004/pages/bloglist.html |
            | http://127.0.0.1:8004/pages/blogposts/post2.html | Home    | http://127.0.0.1:8004/index.html          |
            | http://127.0.0.1:8004/pages/blogposts/post2.html | Posts   | http://127.0.0.1:8004/pages/bloglist.html |
            | http://127.0.0.1:8004/pages/blogposts/post3.html | Home    | http://127.0.0.1:8004/index.html          |
            | http://127.0.0.1:8004/pages/blogposts/post3.html | Posts   | http://127.0.0.1:8004/pages/bloglist.html |
