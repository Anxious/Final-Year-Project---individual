Feature: Home page content

@manual
Scenario: Viewing the home page
    # Make sure the hero appears with both text and logo
    Given I am on the home page 
    When I am viewing the content on the page
    Then I should be able to see a hero at the top of the page with a slogan and logo

@manual
Scenario: Viewing the home page
    # Make sure the about us section appears correctly
    Given I am on the home page 
    When I am viewing the content on the page
    Then I should be able to see an about section with an image and a description

@manual
Scenario: Viewing the home page
    # Make sure the FAQ section appears correctly
    Given I am on the home page 
    When I am viewing the content on the page
    Then I should be able to see an FAQ section with 6 questions and answers

@manual
Scenario: Viewing the home page
    # Make sure the testimonials section appears correctly
    Given I am on the home page 
    When I am viewing the content on the page
    Then I should be able to see a testimonials section with 3 testimonials and their authors

@automated
Scenario: Viewing the testimonials section
    Given I am on the "http://127.0.0.1:8004/index.html" page 
    When I am clicking the subscribe button
    Then I should redirect to the "http://127.0.0.1:8004/pages/subscribe.html" page
