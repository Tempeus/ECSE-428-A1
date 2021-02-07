Feature: delete category

  As a project manager
  I would like to delete a category
  So that they can be removed if no longer needed

  # Normal Flow
  Scenario Outline: Project manager deletes a category

    Given a category <id> <name> exists
    When I delete a category <id>
    Then the category <id> shall be removed

    Examples:
      | id | name |
      | 0  | high |
      | 1  | low  |

  # Alternate Flow
  Scenario Outline: Project manager deletes an non-existing category

    Given a category <id> <name> does not exist
    When I delete a category <id>
    Then the category <id> shall be removed

    Examples:
      | id |
      | 0  |
      | 1  |

  # Error Flow
  Scenario Outline: Project manager deletes a category that they do not have edit access to

    Given a category <id> <name> exists
    And I do not have edit access to the category <id>
    When I delete a category <id>
    Then the todo <id> shall not be removed
    And an error is generated with message "You do not have edit access"

    Examples:
      | id | name |
      | 0  | high |
      | 1  | low  |