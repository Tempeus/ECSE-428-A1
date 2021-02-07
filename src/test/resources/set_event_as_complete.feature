-+Feature: set an event as complete

  As a developer
  I would like to set the event as complete
  So that my work schedule is less cluttered

  Scenario Outline: developer set an event as completed

    # Normal Flow
    Given an event occured and is finished and the status is <status>
    When the developer set an event as completed
    Then the event will have the status completed

    Examples:
      | status |
      | not finished |
      |todo          |

    # Error Flow
  Scenario Outline: Project developer set an event as completed on a non-existing event

    Given the event instance does not exist
    When the developer set the event instance as completed
    Then an event instance is not updated and an error occurs saying "unable to finalize completion, event does not exist"

    # Error Flow
  Scenario Outline: Project developer set an event that was already completed as completed

    Given an event is already defined as completed
    When the developer attempts to set the event instance as completed
    Then an event instance is not updated and an error occurs saying "unable to finalize completion, event is already set as completed"