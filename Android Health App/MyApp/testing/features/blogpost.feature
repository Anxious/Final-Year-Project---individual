Feature: A blog post page

    @manual
    Scenario: Viewing a blog post page
        # Make sure the blog posts is showing correctly
        Given I am on a blog post
        When I am viewing the content on the page
        Then I should be able to see the details of the post

    @automated
    Scenario Outline: Navigation to the blog list from a blog post via the button
        Given I am on the "<startpage>" page
        When I click on the button with the id "<buttonId>"
        Then I should redirect to the "<endpage>" page
        Examples:
            | startpage                                        | buttonId  | endpage                                   |
            | http://127.0.0.1:8004/pages/blogposts/post1.html | readMore1 | http://127.0.0.1:8004/pages/bloglist.html |
            | http://127.0.0.1:8004/pages/blogposts/post2.html | readMore2 | http://127.0.0.1:8004/pages/bloglist.html |
            | http://127.0.0.1:8004/pages/blogposts/post3.html | readMore3 | http://127.0.0.1:8004/pages/bloglist.html |