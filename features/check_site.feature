Feature: Check if cucumber-chef site available

    Scenario: Open website and click around to be sure that it's right website
    Given cucumber-chef url "http://cucumber-chef.org/" open it
    When it has "Cucumber-chef" in title
    And i can click on big "Git Hub" button
    And i can click on small "Buy Button"
    Then task finished