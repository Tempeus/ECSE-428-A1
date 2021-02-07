Feature: delete an event

  As a project manager
  I would like to delete a reminder for a specific event
  So that I wont get confused

  Scenario Outline: Project manager successfully deleted an event

    # Normal Flow
    Given an event that will be happening in the future
    When the manager creates an event instance with date <date> and participant <participant>
    Then an event instance is created and remind the participants when the time arrives

    Examples:
      | date    | participant |
      | sunday  | Jonas       |
      | monday  | Tritin      |

    # Error Flow
  Scenario Outline: Project manager attempts to delete an event that does not exist

    Given an event that will be happening in the future
    When the manager attempts to delete the event instance
    Then an error occurs saying "the event you want to delete does not exist"

    # Error Flow
  Scenario Outline: Project manager attempts to delete an event that already occured

    Given the event already happened
    When the manager attempts to delete the event instance
    Then an error occurs saying "the event you want to delete already occured"