Feature: assign todo to project

  As a project manager
  I would like to assign a todo to a project
  So that my team can see new tasks that need to be completed

  # Normal Flow
  Scenario Outline: Project manager assigns a todo to the project

    Given there exists a project <projectID> <projectTitle>
    And a todo <todoID> <todoTitle> exists
    And a todo <todoID> is not assigned to a project <projectID>
    When I assign a todo <todoID> to a project <projectID>
    Then the todo <todoID> is assigned to the project <projectID>

    Examples:
      | projectID | todoID | projectTitle | todoTitle |
      | 0         | 0      | project      | todo      |
      | 0         | 1      | secret       | hide      |
      | 1         | 2      | 231301       | create    |

  # Alternate Flow
  Scenario Outline: Project manager assigns an already assigned todo to the project

    Given there exists a project <projectID> <projectTitle>
    And a todo <todoID> <todoTitle> exists
    And a todo <todoID> is assigned to a project <projectID>
    When I assign a todo <todoID> to a project <projectID>
    Then the todo <todoID> is assigned to the project <projectID>

    Examples:
      | projectID | todoID | projectTitle | todoTitle |
      | 0         | 0      | project      | todo      |
      | 0         | 1      | secret       | hide      |
      | 1         | 2      | 231301       | create    |

  # Error Flow
  Scenario Outline: Project manager assigns a non-existing todo to the project

    Given there exists a project <projectID> <projectTitle>
    And a todo <todoID> does not exist
    When I assign a todo <todoID> to a project <projectID>
    Then an error is generated with message "Missing todo"

    Examples:
      | projectID | todoID | projectTitle |
      | 0         | 0      | project      |
      | 0         | 1      | secret       |
      | 1         | 2      | 231301       |