Feature: The blog list page

    @manual
    Scenario: Viewing the bloglist page
        # Make sure the bloglist is showing correctly
        Given I am on the bloglist page
        When I am viewing the content on the page
        Then I should be able to see a list of the available blog posts to view

    @automated
    Scenario: Pressing a blog post button on the bloglist page
        Given I am on the "<page>" page
        When I click on the button with the id "<buttonId>"
        Then I should redirect to the "<endpage>" page
        Examples:
            | page                                      | buttonId  | endpage                                          |
            | http://localhost:8004/pages/bloglist.html | readPost1 | http://localhost:8004/pages/blogposts/post1.html |
            | http://localhost:8004/pages/bloglist.html | readPost2 | http://localhost:8004/pages/blogposts/post2.html |
            | http://localhost:8004/pages/bloglist.html | readPost3 | http://localhost:8004/pages/blogposts/post3.html |