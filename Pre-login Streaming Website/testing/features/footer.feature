Feature: The footer

    @manual
    Scenario: Viewing any page
        # Make sure the footer appears at the bottom of the page
        Given I am on a page on the website
        When I am viewing the content on the page
        Then I should be able to see the footer at the bottom of the page

    @automated
    Scenario Outline: Navigation to pages from other pages using the footer
        Given I am on the "<footerpage>" page
        When I am clicking the "<footeritem>" footer item
        Then I should redirect to the "<page>" page
        Examples:
            | footerpage                                  | footeritem | page                                        |
            | http://127.0.0.1:8004/index.html            | Home       | http://127.0.0.1:8004/index.html            |
            | http://127.0.0.1:8004/index.html            | Sign up    | http://127.0.0.1:8004/pages/subscribe.html  |
            | http://127.0.0.1:8004/index.html            | Contact us | http://127.0.0.1:8004/pages/contact-us.html |
            | http://127.0.0.1:8004/index.html            | FAQs       | http://127.0.0.1:8004/index.html#faqs       |
            | http://127.0.0.1:8004/pages/features.html   | Home       | http://127.0.0.1:8004/index.html            |
            | http://127.0.0.1:8004/pages/features.html   | Sign up    | http://127.0.0.1:8004/pages/subscribe.html  |
            | http://127.0.0.1:8004/pages/features.html   | Contact us | http://127.0.0.1:8004/pages/contact-us.html |
            | http://127.0.0.1:8004/pages/features.html   | FAQs       | http://127.0.0.1:8004/index.html#faqs       |
            | http://127.0.0.1:8004/pages/contact-us.html | Home       | http://127.0.0.1:8004/index.html            |
            | http://127.0.0.1:8004/pages/contact-us.html | Sign up    | http://127.0.0.1:8004/pages/subscribe.html  |
            | http://127.0.0.1:8004/pages/contact-us.html | Contact us | http://127.0.0.1:8004/pages/contact-us.html |
            | http://127.0.0.1:8004/pages/contact-us.html | FAQs       | http://127.0.0.1:8004/index.html#faqs       |
            | http://127.0.0.1:8004/pages/login.html      | Home       | http://127.0.0.1:8004/index.html            |
            | http://127.0.0.1:8004/pages/login.html      | Sign up    | http://127.0.0.1:8004/pages/subscribe.html  |
            | http://127.0.0.1:8004/pages/login.html      | Contact us | http://127.0.0.1:8004/pages/contact-us.html |
            | http://127.0.0.1:8004/pages/login.html      | FAQs       | http://127.0.0.1:8004/index.html#faqs       |
            | http://127.0.0.1:8004/pages/subscribe.html  | Home       | http://127.0.0.1:8004/index.html            |
            | http://127.0.0.1:8004/pages/subscribe.html  | Sign up    | http://127.0.0.1:8004/pages/subscribe.html  |
            | http://127.0.0.1:8004/pages/subscribe.html  | Contact us | http://127.0.0.1:8004/pages/contact-us.html |
            | http://127.0.0.1:8004/pages/subscribe.html  | FAQs       | http://127.0.0.1:8004/index.html#faqs       |



