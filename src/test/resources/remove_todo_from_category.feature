Feature: remove todo from category

  As a project manager
  I would like to remove a todo from a category
  So that I may correct an incorrectly label task

  # Normal Flow
  Scenario Outline: Project manager removes a todo from a category

    Given there exists a category <categoryID> <categoryName>
    And a todo <todoID> <todoTitle> exists
    And a todo <todoID> is assigned to a category <categoryID>
    When I remove a todo <todoID> from a category <categoryID>
    Then the todo <todoID> is not assigned to the category <categoryID>

    Examples:
      | categoryID | todoID | categoryName | todoTitle |
      | 0          | 0      | high         | todo      |
      | 0          | 1      | low          | hide      |
      | 1          | 2      | high         | create    |

  # Alternate Flow
  Scenario Outline: Project manager removes a todo from a category when the todo is already removed from a category

    Given there exists a category <categoryID> <categoryName>
    And a todo <todoID> <todoTitle> exists
    And a todo <todoID> is not assigned to a category <categoryID>
    When I remove a todo <todoID> from a category <categoryID>
    Then the todo <todoID> is not assigned to the category <categoryID>

    Examples:
      | categoryID | todoID | categoryName | todoTitle |
      | 0          | 0      | high         | todo      |
      | 0          | 1      | low          | hide      |
      | 1          | 2      | high         | create    |

  # Error Flow
  Scenario Outline: Project manager removes a non-existing todo from a category

    Given there exists a category <categoryID> <categoryName>
    And a todo <todoID> does not exist
    When I remove a todo <todoID> from a category <categoryID>
    Then an error is generated with message "Missing todo"

    Examples:
      | categoryID | todoID | categoryName |
      | 0          | 0      | high         |
      | 0          | 1      | low          |
      | 1          | 2      | high         |