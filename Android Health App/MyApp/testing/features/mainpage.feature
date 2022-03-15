Feature: The main page
    @manual
    Scenario: Viewing the main page
        # Make sure the main page is showing correctly
        Given I am on the main page
        When I am viewing the content on the page
        Then I should be able to see a hero and some introductory info

    @automated
    Scenario: Pressing a navigation button on the main page
        Given I am on the "<page>" page
        When I click on the button with the id "<buttonId>"
        Then I should redirect to the "<endpage>" page
        Examples:
            | page                             | buttonId     | endpage                             |
            | http://localhost:8004/index.html | viewBlogs    | http://localhost:8004/pages/bloglist.html |
            | http://localhost:8004/index.html | startReading | http://localhost:8004/pages/bloglist.html |

    @automated
    Scenario Outline: Using the main page carousel
        Given I am on the "<page>" page
        When I click on "<button>" button <times> times
        Then I should be able to see the image "<image>"
        Examples:
            | page                             | button                | times | image                                           |
            | http://localhost:8004/index.html | carousel-control-next | 0     | http://localhost:8004/resources/img/health1.png |
            | http://localhost:8004/index.html | carousel-control-next | 1     | http://localhost:8004/resources/img/health2.jpg |
            | http://localhost:8004/index.html | carousel-control-next | 2     | http://localhost:8004/resources/img/health3.jpg |
            | http://localhost:8004/index.html | carousel-control-next | 3     | http://localhost:8004/resources/img/health1.png |
            | http://localhost:8004/index.html | carousel-control-prev | 1     | http://localhost:8004/resources/img/health3.jpg |
            | http://localhost:8004/index.html | carousel-control-prev | 2     | http://localhost:8004/resources/img/health2.jpg |
            | http://localhost:8004/index.html | carousel-control-prev | 3     | http://localhost:8004/resources/img/health1.png |
