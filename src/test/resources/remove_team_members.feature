Feature: remove members from the team

  As a team project manager
  I would like to remove members from the team
  So that if a member left the project, there is a way to remove them from the team

  Scenario Outline: Company project manager removes members to their team

    # Normal Flow
    Given a team with member <name> and another team <teamName>
    When the <teamName> project manager requests to remove the member from the team
    Then the candidate is removed to the team

    Examples:
      | name      | teamName              |
      | James     | Safety Critical HCI   |
      | Ronald    | Web development team  |

  Scenario Outline: Company project manager requests a removal of a non-existing member

    #Error FLow
    Given a team with a non-existing member <name> and another team <teamName>
    When the team project manager requests to remove the member from the team
    Then an error message appear saying "the user you request for remove does not exist"

    Examples:
      | name      | teamName              |
      | JameS     | Safety Critical HCI   |
      | Ronaid    | Web development team  |

    # Error Flow
  Scenario Outline: Company project manager remove a member from a non-existing team

    Given a team with member <name> and a non-existing team
    When the team project manager requests to remove the member from the non-existing team
    Then an error is generated with message "the team for the removal does not exist"

    Examples:
      | name      |
      | James     |
      | Ronald    |