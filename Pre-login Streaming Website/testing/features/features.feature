Feature: The features page

    @manual
    Scenario: Viewing the features page
        # Make sure the introduction is showing correctly
        Given I am on the features page
        When I am viewing the content on the page
        Then I should be able to see an introduction section and it's content

    @manual
    Scenario: Viewing the features page
        # Make sure the what's hot previews are showing correctly
        Given I am on the features page
        When I am viewing the content on the page
        Then I should be able to see a what's hot section and it's content

    @manual
    Scenario: Viewing the features page
        # Make sure the new releases section is showing correctly
        Given I am on the features page
        When I am viewing the content on the page
        Then I should be able to a new releases section and it's content

    @automated
    Scenario: Using the features page carousel
        Given I am on the "http://127.0.0.1:8004/pages/features.html" page
        When I click on "<button>" button <times> times
        Then I should be able to see the item "<title>"
        Examples:
            | button                | times | title             |
            | carousel-control-next | 0     | Treasure Island   |
            | carousel-control-next | 1     | We're the Millers |
            | carousel-control-next | 2     | Shaun of the Dead |
            | carousel-control-next | 3     | Treasure Island   |
            | carousel-control-prev | 1     | Shaun of the Dead |
            | carousel-control-prev | 2     | We're the Millers |
            | carousel-control-prev | 3     | Treasure Island   |