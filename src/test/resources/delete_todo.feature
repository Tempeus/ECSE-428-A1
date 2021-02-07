Feature: delete todo

  As a project manager
  I would like to delete a todo
  So that they can be removed if no longer needed

  # Normal Flow
  Scenario Outline: Project manager deletes a todo

    Given a todo <id> <title> exists
    When I delete a todo <id>
    Then the todo <id> shall be removed

    Examples:
      | id | title |
      | 0  | todo  |
      | 1  | todo1 |

  # Alternate Flow
  Scenario Outline: Project manager deletes an non-existing todo

    Given a todo <id> does not exist
    When I delete a todo <id>
    Then the todo <id> shall be removed

    Examples:
      | id |
      | 0  |
      | 1  |

  # Error Flow
  Scenario Outline: Project manager deletes a todo that they do not have edit access to

    Given a todo <id> <title> exists
    And I do not have edit access to the todo <id>
    When I delete a todo <id>
    Then the todo <id> shall not be removed
    And an error is generated with message "You do not have edit access"

    Examples:
      | id | title |
      | 0  | todo  |
      | 1  | todo1 |