Feature: private messaging system

  As a user
  I would like to communicate with other user
  So that I can ask questions privately without notifying the whole team

  Scenario Outline: User successfully sends a message to another user

    # Normal Flow
    Given User <sender> wants to send a message <message> to another existing user <recipient>
    When user <sender> sends a message <message> to another user <recipient>
    Then the message is visible in the chat system

    Examples:
      | sender      | recipient       | message        |
      | Jim         | Carl            | Hi             |
      | Mark        | John            | I need help    |

    # Error Flow
  Scenario Outline: User sends a empty message to another user

    Given User <sender> wants to send a empty message <message> to another user <recipient>
    When  user <sender> sends a empty message <message> to another user <recipient>
    Then an error will appear saying "error, message cannot be empty"


    # Error Flow
  Scenario Outline: User sends a message to non-existing employee

    Given User <sender> wants to send a empty message <message> to another user <recipient>
    When  user <sender> sends a message <message> to another non-existing user <recipient>
    Then an error will appear saying "error, user does not exist in the system"
