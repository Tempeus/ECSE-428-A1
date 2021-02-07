Feature: change development mode

  As a company manager
  I would like to change the development mode
  So that my team are up to date on which mode they're on

  Scenario Outline: Company authorized manager changes the mode

    # Normal Flow
    Given a company authorized manager and the current mode is <mode>
    When the company manager requests to the mode to <newMode>
    Then the development mode is now <newMode>

    Examples:
      | mode        | newMode         |
      |  R&D        | Production      |
      | Production  | CleanUp         |

    # Alternate Flow
  Scenario Outline: Company authorized manager changes the mode to the same mode

    Given a company authorized manager and the current mode is <mode>
    When the company manager requests to the mode to the same mode <mode>
    Then the development mode is now <mode>

    Examples:
      | mode        |
      |  R&D        |
      | Production  |
      | CleanUp     |

    # Error Flow
  Scenario Outline: A non-authorized employee tries to changes the mode to the mode

    Given a non-authorized person and the current mode is <mode>
    When that non-authorized person requests to the mode to <newMode>
    Then an error is generated with message "You do not have enough permissions to do this action"

    Examples:
      | mode        | newMode         |
      |  R&D        | Production      |
      | Production  | CleanUp         |