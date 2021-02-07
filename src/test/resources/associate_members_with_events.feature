Feature: associate members with an event

  As a project manager
  I would like to add members to a reminder for a specific event
  So that they will be reminded of th event and will not forget it

  Scenario Outline: Project manager successfully associates an event

    # Normal Flow
    Given an event that will be happening in the future
    When the manager associates members to an event instance with date <date>, time <time> and participant <participant>
    Then an event instance is associated with members and remind the participants when the time arrives

    Examples:
      | date        | time     | participant|
      | Mar 13th    | 11:30    |Jonas       |
      | Feb   15th  | 14:00    |Tritin      |

    # Error Flow
  Scenario Outline: Project manager associates an event putting a date that already occured

    Given an event that will be happening in the future
    When the manager associates an event instance with an already occured date <date>, time <time> and participant <participant>
    Then an event instance is not associated with members and an error occurs saying "unable to associate the members to the event, wrong date"

    # Error Flow
  Scenario Outline: Project manager associates an event that already exists

    Given an event that is already associated
    When the manager attempts to associate an event instance with date <date>, time<time> and participant <participant>
    Then an event instance is not associated and an error occurs saying "event already exists"