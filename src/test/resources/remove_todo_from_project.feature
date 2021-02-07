Feature: remove todo from project

  As a project manager
  I would like to remove a todo from a project
  So that my team can forget a task that does not need to be completed

  # Normal Flow
  Scenario Outline: Project manager removes a todo from the project

    Given there exists a project <projectID> <projectTitle>
    And a todo <todoID> <todoTitle> exists
    And a todo <todoID> is assigned to a project <projectID>
    When I remove a todo <todoID> from a project <projectID>
    Then the todo <todoID> is not assigned to the project <projectID>

    Examples:
      | projectID | todoID | projectTitle | todoTitle |
      | 0         | 0      | project      | todo      |
      | 0         | 1      | secret       | hide      |
      | 1         | 2      | 231301       | create    |

  # Alternate Flow
  Scenario Outline: Project manager removes an un-assigned todo from the project

    Given there exists a project <projectID> <projectTitle>
    And a todo <todoID> <todoTitle> exists
    And a todo <todoID> is not assigned to a project <projectID>
    When I remove a todo <todoID> from a project <projectID>
    Then the todo <todoID> is not assigned to the project <projectID>

    Examples:
      | projectID | todoID | projectTitle | todoTitle |
      | 0         | 0      | project      | todo      |
      | 0         | 1      | secret       | hide      |
      | 1         | 2      | 231301       | create    |

  # Error Flow
  Scenario Outline: Project manager removes a non-existing todo from the project

    Given there exists a project <projectID> <projectTitle>
    And a todo <todoID> does not exist
    When I remove a todo <todoID> from a project <projectID>
    Then an error is generated with message "Missing todo"

    Examples:
      | projectID | todoID | projectTitle |
      | 0         | 0      | project      |
      | 0         | 1      | secret       |
      | 1         | 2      | 231301       |