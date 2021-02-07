Feature: start six week cycle

  As a project manager
  I would like to assign a team to start a six week cycle
  So that my team can work on a project efficiently

  Scenario Outline: Project manager successfully assigns a team to start a six week cycle

    # Normal Flow
    Given a project manager managing different teams <team>
    When the manager assigns a team <team> with six week cycle <mode>
    Then the team <team> will start working in six week cycle
    Examples:
      | team        | mode         |
      | software    | normal       |
      | hardware    | sixWeekCycle |

    # Error Flow
  Scenario Outline: Project manager assigns a team that has already in six week cycle mode

    Given a team <team> already started working in six week cycle <mode>
    When the manager assigns a team <team> with six week cycle <mode>
    Then an error will appear saying "team is already in six week cycle mode"


    # Error Flow
  Scenario Outline: Project manager starts six week cycle mode on a non-existing team

    Given project manager managing different teams <team>
    When the manager assigns six weeks cycle to a non-existing team <team>
    Then an error will appear saying "team does not exist"
