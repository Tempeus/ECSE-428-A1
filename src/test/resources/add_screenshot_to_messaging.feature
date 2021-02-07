Feature: add screenshot to messaging feature

  As a user
  I would like to add screenshot in the chat
  So that I can show screenshot to other users

  Scenario Outline: User successfully sends a screenshot to another user

    # Normal Flow
    Given User <sender> wants to send a screenshot <attachment> to another existing user <recipient>
    When user <sender> sends a screenshot <attachment> to another user <recipient>
    Then the screenshot is visible in the chat system

    Examples:
      | sender      | recipient       | attachment      |
      | Jim         | Carl            | screenshot      |
      | Mark        | John            | screenshot      |

    # Error Flow
  Scenario Outline: User sends a screenshot that is in the wrong format to another user

    Given User <sender> wants to send a invalid format screenshot <attachment> to another existing user <recipient>
    When user <sender> sends a invalid format screenshot <attachment> to another user <recipient>
    Then an error will appear saying "error, screenshot cannot be sent"

    # Error Flow
  Scenario Outline: User sends a screenshot that exceeds the size limit to another user

    Given User <sender> wants to send a invalid size screenshot <attachment> to another existing user <recipient>
    When user <sender> sends a invalid size screenshot <attachment> to another user <recipient>
    Then an error will appear saying "error, screenshot size to big, cannot be sent"
