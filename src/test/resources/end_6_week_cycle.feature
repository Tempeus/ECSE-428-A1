Feature: end six week cycle

  As a project manager
  I would like to assign a team to end a six week cycle
  So that my team can work on a project normally

  Scenario Outline: Project manager successfully assigns a team to end a six week cycle

    # Normal Flow
    Given a project manager managing different teams <team>
    When the manager assigns a team <team> to end six week cycle <status> <mode>
    Then the team <team> will end working in six week cycle
    Examples:
      | team        | mode         | status  |
      | software    | normal       | ongoing |
      | hardware    | sixWeekCycle | finished|

    # Error Flow
  Scenario Outline: Project manager assigns a team that has already ended six week cycle mode

    Given a team <team> already ended working in six week cycle <status>
    When the manager assigns a team <team> to end six week cycle <status> <mode>
    Then an error will appear saying "team has already finished six week cycle mode"

    # Error Flow
  Scenario Outline: Project manager ends six week cycle mode on a non-existing team

    Given project manager managing different teams <team>
    When the manager assigns end six weeks cycle to a non-existing team <team>
    Then an error will appear saying "team does not exist"
