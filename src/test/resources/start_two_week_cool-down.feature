Feature: start two week cool-down

  As a project manager
  I would like to assign a team to start a two week cool-down
  So that my team can work on a project efficiently

  Scenario Outline: Project manager successfully assigns a team to start a two week cool-down

    # Normal Flow
    Given a project manager managing different teams <team>
    When the manager assigns a team <team> with rwo week cool-down <mode>
    Then the team <team> will start working in two week cool-down
    Examples:
      | team        | mode            |
      | software    | normal          |
      | hardware    | twoWeekCoolDown |

    # Error Flow
  Scenario Outline: Project manager assigns a team that has already in two week cool-down mode

    Given a team <team> already started working in two week cool-down <mode>
    When the manager assigns a team <team> with two week cool-down <mode>
    Then an error will appear saying "team is already in two week cool-down mode"


    # Error Flow
  Scenario Outline: Project manager starts two week cool-down mode on a non-existing team

    Given project manager managing different teams <team>
    When the manager assigns two week cool-down to a non-existing team <team>
    Then an error will appear saying "team does not exist"
