Feature: update todo

  As a project manager
  I would like to update a todo
  So that they can be changed if needed

  # Normal Flow
  Scenario Outline: Project manager updates a todo description

    Given a todo <id> <oldTitle> <oldDescription> exists
    When I update the description of a todo <id> <newDescription>
    Then the description of a todo <id> <oldTitle> <newDescription> shall be updated

    Examples:
      | id | oldTitle | oldDescription | newDescription |
      | 0  | todo     | test           | new test       |
      | 1  | todo1    | test1 &#%$     | new test1 &#%$ |

  # Alternate Flow
  Scenario Outline: Project manager updates a todo title

    Given a todo <id> <oldTitle> <oldDescription> exists
    When I update the title of a todo <id> <newTitle>
    Then the title of a todo <id> <newTitle> <oldDescription> shall be updated

    Examples:
      | id | oldTitle | oldDescription | newTitle  |
      | 0  | todo     | test           | new todo  |
      | 1  | todo1    | test1 &#%$     | new todo1 |

  # Error Flow
  Scenario Outline: Project manager updates a non-existing todo

    Given a todo <id> does not exist
    When I update the description of a todo <id> <newDescription>
    Then an error is generated with message "Missing todo"

    Examples:
      | id | newDescription |
      | 0  | test        |
      | 1  | test1 &#%$  |