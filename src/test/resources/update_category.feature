Feature: update category

  As a project manager
  I would like to update a category name
  So that they can be changed if needed

  # Normal Flow
  Scenario Outline: Project manager updates a category name

    Given a category <id> <oldName> exists
    When I update the name of a category <id> <newName>
    Then the name of a category <id> <newName> shall be updated

    Examples:
      | id | oldName | newName |
      | 0  | high    | HIGH    |
      | 1  | LOW     | low     |

  # Error Flow
  Scenario Outline: Project manager updates a category name that they do not have edit access to

    Given a category <id> <oldName> exists
    And I do not have edit access to the category <id>
    When I update the name of a category <id> <newName>
    Then the name of a category <id> <newName> shall not be updated
    And an error is generated with message "You do not have edit access"

    Examples:
      | id | oldName | newName |
      | 0  | high    | HIGH    |
      | 1  | LOW     | low     |

  # Error Flow
  Scenario Outline: Project manager updates a non-existing category

    Given a category <id> does not exist
    When I update the name of a category <id> <newName>
    Then an error is generated with message "Missing category"

    Examples:
      | id    | newName |
      | 0     | high    |
      | 1     | low     |