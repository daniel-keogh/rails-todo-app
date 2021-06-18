Feature: search for todos by category

    As a busy user
    So that I can find and group related todos
    I want to include and search for categories in the todos I create
    
Background: todos in database

    Given the following todos exist:
    | title                   | description      | status      | category | due_date   |
    | Buy milk                | We're almost out | Due         | Shopping | 2021-04-29 |
    | Buy bread               | We're almost out | Done        |          | 2021-04-28 |
    | Get something for lunch |                  | Due         | Shopping | 2021-04-27 |
    | Complete assignment     | It's due soon    | In Progress | College  | 2021-05-10 |
    
Scenario: add a category to an existing todo
    When I go to the edit page for "Buy bread"
    And I fill in "Category" with "Shopping"
    And I press "Save Changes"
    Then the category of "Buy bread" should be "Shopping"
    
Scenario: change a todo's category
    When I go to the edit page for "Complete assignment"
    And I fill in "Category" with "Deadlines"
    And I press "Save Changes"
    Then the category of "Complete assignment" should be "Deadlines"

Scenario: find todos with the same category
    Given I am on the details page for "Buy milk"
    When I follow "More in this Category"
    Then I should be on the Categories page for "Buy milk"
    And I should see "Get something for lunch"
    But I should not see "Complete assignment"

Scenario: categories should be in titlecase
    When I go to the edit page for "Buy bread"
    And I fill in "Category" with "SHOPPING"
    And I press "Save Changes"
    Then the category of "Buy bread" should be "Shopping"
    
Scenario: the category name should be displayed on the categories page
    Given I am on the details page for "Buy milk"
    When I follow "More in this Category"
    Then I should be on the Categories page for "Buy milk"
    And I should see "Shopping"

Scenario: can't find todos if they aren't assigned a category (sad path)
    Given I am on the details page for "Buy bread"
    When I follow "More in this Category"
    Then I should be on the home page
    And I should see "Todo has no category"
