Feature: create an event

  As a project manager
  I would like to create a reminder for a specific event
  So that I will not forget it

  Scenario Outline: Project manager successfully creates an event

    # Normal Flow
    Given an event that will be happening in the future
    When the manager creates an event instance with date <date> , time <time> and participant <participant>
    Then an event instance is created and remind the participants when the time arrives

    Examples:
      | date        | time     | participant|
      | Mar 13th    | 11:30    |Jonas       |
      | Feb   15th  | 14:00    |Tritin      |

    # Error Flow
  Scenario Outline: Project manager creates an event putting a date that already occured

    Given an event that will be happening in the future
    When the manager creates an event instance with an already occured date <date>, time <time> and participant <participant>
    Then an event instance is not created and an error occurs saying "unable to create the event, wrong date"

    # Error Flow
  Scenario Outline: Project manager creates an event that already exists

    Given an event that is already created
    When the manager attempts to create an event instance with date <date>, time <time> and participant <participant>
    Then an event instance is not created and an error occurs saying "event already exists"