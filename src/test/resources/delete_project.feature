Feature: delete project

  As a project manager
  I would like to delete a project
  So that they can be removed if no longer needed

  # Normal Flow
  Scenario Outline: Project manager deletes a project

    Given a project <id> <title> exists
    When I delete a project <id>
    Then the project <id> shall be removed

    Examples:
      | id | title    |
      | 0  | project  |
      | 1  | project1 |

  # Alternate Flow
  Scenario Outline: Project manager deletes an non-existing todo

    Given a project <id> does not exist
    When I delete a project <id>
    Then the project <id> shall be removed

    Examples:
      | id |
      | 0  |
      | 1  |

  # Error Flow
  Scenario Outline: Project manager deletes a project that they do not have edit access to

    Given a project <id> <title>exists
    And I do not have edit access to the project <id>
    When I delete a project <id>
    Then the project <id> shall not be removed
    And an error is generated with message "You do not have edit access"

    Examples:
      | id | title    |
      | 0  | project  |
      | 1  | project1 |