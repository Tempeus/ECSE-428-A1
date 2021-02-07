Feature: assign todo to category

  As a project manager
  I would like to assign a todo to a category
  So that my team can know what type of task they are

  # Normal Flow
  Scenario Outline: Project manager assigns a todo to a category

    Given there exists a category <categoryID> <categoryName>
    And a todo <todoID> <todoTitle> exists
    And a todo <todoID> is not assigned to a category <categoryID>
    When I assign a todo <todoID> to a category <categoryID>
    Then the todo <todoID> is assigned to the category <categoryID>

    Examples:
      | categoryID | todoID | categoryName | todoTitle |
      | 0          | 0      | high         | todo      |
      | 0          | 1      | low          | hide      |
      | 1          | 2      | high         | create    |

  # Alternate Flow
  Scenario Outline: Project manager assigns a todo to a category when the todo is already assigned to another category

    Given there exists a category <oldCategoryID> <oldCategoryName>
    And there exists a category <newCategoryID> <newCategoryName>
    And a todo <todoID> <todoTitle> exists
    And a todo <todoID> is assigned to a category <oldCategoryID>
    When I assign a todo <todoID> to a category <newCategoryID>
    Then the todo <todoID> is assigned to the category <oldCategoryID>
    And the todo <todoID> is assigned to the category <newCategoryID>

    Examples:
      | oldCategoryID | oldCategoryName | newCategoryID | newCategoryName| todoID | todoTitle |
      | 0             | high            | 1             | QA             | 0      | todo      |
      | 0             | low             | 1             | frontend       | 1      | show      |
      | 1             | medium          | 2             | backend        | 2      | search    |

  # Error Flow
  Scenario Outline: Project manager assigns a non-existing todo to a category

    Given there exists a category <categoryID> <categoryName>
    And a todo <todoID> does not exist
    When I assign a todo <todoID> to a category <newCategoryID>
    Then an error is generated with message "Missing todo"

    Examples:
      | categoryID | todoID | categoryName |
      | 0          | 0      | high         |
      | 0          | 1      | low          |
      | 1          | 2      | high         |