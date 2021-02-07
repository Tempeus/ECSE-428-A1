Feature: unmark todo as completed

  As a project manager
  I would like to unmark a todo as completed
  So that my team can know that the task needs to be revisited

  # Normal Flow
  Scenario Outline: Project manager unmarks a todo as completed

    Given a todo <id> <title> exists
    When I unmark a todo <id> as completed
    Then the todo <id> shall not be marked as completed

    Examples:
      | id | title |
      | 0  | todo  |
      | 1  | todo1 |

  # Alternate Flow
  Scenario Outline: Project manager unmarks as completed an unmarked todo

    Given a todo <id> <title> exists
    And a todo <id> is unmarked as completed
    When I unmark a todo <id> as completed
    Then the todo <id> shall not be marked as completed

    Examples:
      | id | title |
      | 0  | todo  |
      | 1  | todo1 |

  # Error Flow
  Scenario Outline: Project manager unmarks as completed a non-existing todo

    Given a todo <id> <title> does not exist
    When I unmark a todo <id> as completed
    Then an error is generated with message "Missing todo"

    Examples:
      | id | title |
      | 0  | todo  |
      | 1  | todo1 |