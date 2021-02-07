Feature: create todo

  As a project manager
  I would like to create todos
  So that they can be assigned and completed by developers

  # Normal Flow
  Scenario Outline: Project manager creates a todo

    Given a todo <title> <description> does not exist
    When I create a todo <title> <description>
    Then the todo <title> <description> shall be created

    Examples:
      | title | description |
      | todo  | test        |
      | todo1 | test1 &#%$  |

  # Alternate Flow
  Scenario Outline: Project manager creates a todo that is already marked as completed

    Given a todo <title> <description> does not exist
    When I create a completed todo <title> <description>
    Then the new todo <title> <description> shall be created

    Examples:
      | title | description |
      | todo  | test        |
      | todo1 | test1 &#%$  |

  # Error Flow
  Scenario Outline: Project manager creates a todo without a title

    Given a todo <title> <description> does not exist
    When I create a todo <description>
    Then the todo <title> description> is not created
    And an error is generated with message "A todo needs a title to be created"

    Examples:
      | title | description |
      | todo  | test        |
      | todo1 | test1 &#%$  |