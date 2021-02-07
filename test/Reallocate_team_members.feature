Feature: reallocate members to another team

  As a team project manager
  I would like to re-assign members to another team
  So that my team has members to work on the project

  Scenario Outline: Company project manager re-assigns members to their team

    # Normal Flow
    Given a team with member <name> and another team <teamName>
    When the <teamName> project manager requests to re-assign the member to the team
    Then the candidate is re-assigned to the team

    Examples:
      | name      | teamName              |
      | James     | Safety Critical HCI   |
      | Ronald    | Web development team  |

  Scenario Outline: Company project manager requests a re-assignment of a non-existing member

    #Error FLow
    Given a team with a non-existing member <name> and another team <teamName>
    When the team project manager requests to assign the candidate to the team
    Then an error message appear saying "the user you request for re-assignment does not exist"

    Examples:
      | name      | teamName              |
      | JameS     | Safety Critical HCI   |
      | Ronaid    | Web development team  |

    # Error Flow
  Scenario Outline: Company project manager re-assigns a member to a non-existing team

    Given a team with member <name> and a non-existing team
    When the team project manager requests to re-assign the candidate to the non-existing team
    Then an error is generated with message "the team for reassignment does not exist"

    Examples:
      | name      |
      | James     |
      | Ronald    |