Feature: get todos from category

  As a developer
  I would like to see all todos from a category
  So I can see what tasks that I would be more interested in taking

  # Normal Flow
  Scenario Outline: Developer gets all todos from a category

    Given there exists a category <categoryID> <categoryName>
    And a todo <todoID> <todoTitle> exists
    And a todo <todoID> is assigned to a category <categoryID>
    When I get all todos from a category <categoryID>
    Then the todo <todoID> is visible

    Examples:
      | categoryID | todoID | categoryName | todoTitle |
      | 0          | 0      | high         | todo      |
      | 0          | 1      | low          | hide      |
      | 1          | 2      | high         | create    |

  # Alternate Flow
  Scenario Outline: Developer gets all todos from an category

    Given there exists a category <categoryID> <categoryName>
    And there are no assigned todos in a category <categoryID>
    When I get all todos from a category <categoryID>
    Then there are no todos

    Examples:
      | categoryID | categoryName |
      | 0          | high         |
      | 0          | low          |
      | 1          | high         |

  # Error Flow
  Scenario Outline: Developer gets all todos from a non-existing category

    Given there is no category <categoryID> <categoryName>
    When I get all todos from a category <categoryID>
    Then an error is generated with message "Missing category"

    Examples:
      | categoryID | categoryName |
      | 0          | high         |
      | 0          | low          |
      | 1          | high         |