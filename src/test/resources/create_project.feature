Feature: create project

  As a project manager
  I would like to create projects
  So that I can organize what my team needs to do

  # Normal Flow
  Scenario Outline: Project manager creates a project

    Given a project <title> does not exist
    When I create a project <title>
    Then the project <title> shall be created

    Examples:
      | title    |
      | project  |
      | secret   |
      | Q1023210 |

  # Alternate Flow
  Scenario Outline: Project manager creates a project with a description

    Given a project <title> does not exist
    When I create a project <title> with a description <description>
    Then the project <title> <description shall be created

    Examples:
      | title    | description |
      | project  | small       |
      | secret   | big         |
      | Q1023210 | huge        |

  # Error Flow
  Scenario Outline: Project manager creates a project without a name

    Given a project <title> does not exist
    When I create a project without a title
    Then an error is generated with message "A project needs a title to be created"

    Examples:
      | title    |
      | project  |
      | secret   |
      | Q1023210 |