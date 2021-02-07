Feature: mark todo as completed

  As a project manager
  I would like to mark a todo as completed
  So that my team can know which tasks do not need to be worked on

  # Normal Flow
  Scenario Outline: Project manager marks a todo as completed

    Given a todo <id> <title> exists
    When I mark a todo <id> as completed
    Then the todo <id> shall be marked as completed

    Examples:
      | id | title |
      | 0  | todo  |
      | 1  | todo1 |

  # Alternate Flow
  Scenario Outline: Project manager marks an already completed todo as completed

    Given a todo <id> <title> exists
    And a todo <id> is marked as completed
    When I mark a todo <id> as completed
    Then the todo <id> shall be marked as completed

    Examples:
      | id | title |
      | 0  | todo  |
      | 1  | todo1 |

  # Error Flow
  Scenario Outline: Project manager marks a non-existing todo as completed

    Given a todo <id> <title> does not exist
    When I mark a todo <id> as completed
    Then an error is generated with message "Missing todo"

    Examples:
      | id | title |
      | 0  | todo  |
      | 1  | todo1 |