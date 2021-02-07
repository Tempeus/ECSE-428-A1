Feature: get todos from project

  As a developer
  I would like to see all todos from a project
  So I can see what tasks need to be completed

  # Normal Flow
  Scenario Outline: Developer gets all todos from the project

    Given there exists a project <projectID> <projectTitle>
    And a todo <todoID> <todoTitle> exists
    And a todo <todoID> is assigned to a project <projectID>
    When I get all todos from a project <projectID>
    Then the todo <todoID> is visible

    Examples:
      | projectID | todoID | projectTitle | todoTitle |
      | 0         | 0      | project      | todo      |
      | 0         | 1      | secret       | hide      |
      | 1         | 2      | 231301       | create    |

  # Alternate Flow
  Scenario Outline: Developer gets all todos from an empty project

    Given there exists a project <projectID> <projectTitle>
    And there are no assigned todos in a project <projectID>
    When I get all todos from a project <projectID>
    Then there are no todos

    Examples:
      | projectID | projectTitle |
      | 0         | project      |
      | 0         | secret       |
      | 1         | 231301       |

  # Error Flow
  Scenario Outline: Developer gets all todos from a project they are not assigned to

    Given there exists a project <projectID> <projectTitle>
    And I am not assigned to the project <projectID>
    When I get all todos from a project <projectID>
    Then an error is generated with message "You do not have access to this project"

    Examples:
      | projectID | projectTitle |
      | 0         | project      |
      | 0         | secret       |
      | 1         | 231301       |