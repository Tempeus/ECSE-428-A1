Feature: group messaging system

  As a user
  I would like to communicate with a team/group
  So that I can ask questions and get responses from different user the same time

  Scenario Outline: User successfully sends a message to group

    # Normal Flow
    Given User <sender> wants to send a message <message> to group <group>
    When user <sender> sends a message <message> to another group <group>
    Then the message is visible in the chat system

    Examples:
      | sender      | group              | message        |
      | Jim         | software           | Hi             |
      | Mark        | hardware           | I need help    |

    # Error Flow
  Scenario Outline: User sends a empty message to a group

    Given User <sender> wants to send a empty message <message> to group <group>
    When  user <sender> sends a empty message <message> to group <group>
    Then an error will appear saying "error, message cannot be empty"


    # Error Flow
  Scenario Outline: User sends a message to non-existing group

    Given User <sender> wants to send a message <message> to non-existing group <group>
    When  user <sender> sends a message <message> to group user <group>
    Then an error will appear saying "error, group does not exist in the system"
