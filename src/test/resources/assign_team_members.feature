Feature: assign members to team

  As a team project manager
  I would like to assign members to my team
  So that my team has members to work on the project

  Scenario Outline: Company project manager assigns members to their team

    # Normal Flow
    Given a team with no members and a candidate <name>
    When the team project manager requests to assign the candidate to the team
    Then the candidate is assigned to the team

    Examples:
      | name      |
      | James     |
      | Ronald    |

    # Alternate Flow
  Scenario Outline: Company project manager assigns members to their team with existing members

    Given a team with existing members and a candidate <name>
    When the team project manager requests to assign the candidate to the team
    Then the candidate is assigned to the team

    Examples:
      | name      |
      | James     |
      | Ronald    |

    # Error Flow
  Scenario Outline: Company project manager assigns a non-existing members to their team

    Given a team with no members and a candidate <name>
    When the team project manager requests to assign the candidate to the team
    Then an error is generated with message "This person does not exist"

    Examples:
      | name      |
      | blarg     |
      | marvli    |