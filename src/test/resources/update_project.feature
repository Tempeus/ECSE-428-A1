Feature: update project

  As a project manager
  I would like to update a project title or description
  So that they can be changed if needed

  # Normal Flow
  Scenario Outline: Project manager updates a project description

    Given a project <id> <oldTitle> <oldDescription> exists
    When I update the description of a project <id> <newDescription>
    Then the description of a project <id> <oldTitle> <newDescription> shall be updated

    Examples:
      | id | oldTitle | oldDescription | newDescription |
      | 0  | project  | test           | new test       |
      | 1  | project1 | test1 &#%$     | new test1 &#%$ |

  # Alternate Flow
  Scenario Outline: Project manager updates a project title

    Given a project <id> <oldTitle> <oldDescription> exists
    When I update the title of a project <id> <newTitle>
    Then the title of a project <id> <newTitle> <oldDescription> shall be updated

    Examples:
      | id | oldTitle | oldDescription | newTitle     |
      | 0  | project  | test           | new project  |
      | 1  | project1 | test1 &#%$     | new project1 |

  # Error Flow
  Scenario Outline: Project manager updates a project that they do not have edit access to

    Given a project <id> <oldTitle> <oldDescription> exists
    And I do not have edit access to the project <id>
    When I update the description of a project <id> <newDescription>
    Then the description of a project <id> <newDescription> shall not be updated
    And an error is generated with message "You do not have edit access"

    Examples:
      | id | oldTitle | oldDescription | newDescription |
      | 0  | project  | test           | new test       |
      | 1  | project1 | test1 &#%$     | new test1 &#%$ |

  # Error Flow
  Scenario Outline: Project manager updates a non-existing project

    Given a project <id> does not exist
    When I update the description of a project <id> <newDescription>
    Then an error is generated with message "Missing project"

    Examples:
      | id | newDescription |
      | 0  | new test       |
      | 1  | new test1 &#%$ |

