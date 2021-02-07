Feature: update an event

  As a project manager
  I would like to update a reminder for a specific event
  So that event does not have the wrong information

  Scenario Outline: Project manager successfully updates an event

    # Normal Flow
    Given an event that will be happening in the future
    When the manager creates an event instance with date <date>, time <time> and participant <participant>
    Then an event instance is created and remind the participants when the time arrives

    Examples:
      | date        | time     | participant|
      | Mar 13th    | 11:30    |Jonas       |
      | Feb   15th  | 14:00    |Tritin      |

    # Error Flow
  Scenario Outline: Project manager updates an event putting a date that already occured

    Given an event that will be happening in the future
    When the manager updates an event instance with an already occured date <date>, time <time>  and participant <participant>
    Then an event instance is not updated and an error occurs saying "unable to updated the event, wrong date"

    # Error Flow
  Scenario Outline: Project manager updates an event that already occured

    Given an event that is already created and already occured
    When the manager attempts to updated an event instance with date <date>, time <time> and participant <participant>
    Then an event instance is not updated and an error occurs saying "event already happened"