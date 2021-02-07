Feature: create category

  As a project manager
  I would like to create categories
  So that I can organize the tasks

  # Normal Flow
  Scenario Outline: Project manager creates a category

    Given a category <name> does not exist
    When I create a category <name>
    Then the category <name> shall be created

    Examples:
      | name |
      | high |
      | low  |
      | QA   |

  # Alternate Flow
  Scenario Outline: Project manager creates a category that already exists

    Given a category <name> exists
    When I create a category <name>
    Then the category <name> shall be created
    And there shall only be one category with the name <name>

    Examples:
      | name |
      | high |
      | low  |
      | QA   |

  # Error Flow
  Scenario Outline: Project manager creates a category without a name

    Given a category <name> does not exist
    When I create a category without a name
    Then an error is generated with message "A category needs a name to be created"

    Examples:
      | name |
      | high |
      | low  |
      | QA   |