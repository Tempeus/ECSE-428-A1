Feature: update date of event

  As a project manager
  I would like to update the date for a specific event
  So that event does not have the wrong information

  Scenario Outline: Project manager successfully updates the date of an event

    # Normal Flow
    Given an event that will be happening in the future with date <date>, time <time> and participant <paticipant>
    When the manager updates the date <time>
    Then an event with the updated date <date> is now created

    Examples:

    #before
      | date        | time     | participant|
      | Mar 13th    | 11:30    |Jonas       |
      | Feb   15th  | 14:00    |Tritin      |

    #after
      | date        | time     | participant|
      | Apr 13th    | 11:30     |Jonas       |
      | Feb   15th  | 14:00    |Tritin      |


    # Error Flow
  Scenario Outline: Project manager updates an event putting a date that already occured

    Given an event that will be happening in the future
    When the manager updates an event instance with an already occured date <time>
    Then an event instance is not updated and an error occurs saying "unable to updated the date of the event, wrong date"

    # Error Flow
  Scenario Outline: Project manager updates time of an event that has already occured

    Given an event that is already created and already occured
    When the manager attempts to updated an event instance with new date <date>
    Then an event instance is not updated and an error occurs saying "unable to update date, event already happened, "