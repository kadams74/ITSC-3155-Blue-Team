Feature: Add a new Article Entry
  
  As a moviegoer
  So that I can easily contribue content to the Superblue movie website
  I want to be able to add a new Article Entry
  
  Scenario:As a blogger I want to be able to navigate from the homepage to the new Article Form
    Given I am on the homepage
    When I click on the "Articles" link
    Then I should be on the "Articles" page
    When I click on the "New article" linkThen I should be on the "New Article" page
    And I should see the "Title" field
    And I should see the "Text" field