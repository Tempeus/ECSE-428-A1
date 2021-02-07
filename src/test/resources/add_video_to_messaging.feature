Feature: add video to messaging feature

  As a user
  I would like to add video in the chat
  So that I can show video to other users

  Scenario Outline: User successfully sends a video to another user

    # Normal Flow
    Given User <sender> wants to send a video <attachment> to another existing user <recipient>
    When user <sender> sends a video <attachment> to another user <recipient>
    Then the video is visible in the chat system

    Examples:
      | sender      | recipient       | attachment |
      | Jim         | Carl            | video      |
      | Mark        | John            | video      |

    # Error Flow
  Scenario Outline: User sends a video that is in the wrong format to another user

    Given User <sender> wants to send a invalid format video <attachment> to another existing user <recipient>
    When user <sender> sends a invalid format video <attachment> to another user <recipient>
    Then an error will appear saying "error, video cannot be sent"

    # Error Flow
  Scenario Outline: User sends a video that exceeds the size limit to another user

    Given User <sender> wants to send a invalid size video <attachment> to another existing user <recipient>
    When user <sender> sends a invalid size video <attachment> to another user <recipient>
    Then an error will appear saying "error, video size to big, cannot be sent"
