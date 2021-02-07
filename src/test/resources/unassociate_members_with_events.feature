Feature: unassociate members with an event

  As a project manager
  I would like to add members to a reminder for a specific event
  So that they will be reminded of th event and will not forget it

  Scenario Outline: Project manager successfully unassociates an event

    # Normal Flow
    Given an event that will be happening in the future
    When the manager unassociates members to an event instance with date <date> and participant <participant>
    Then an event instance is unassociated with members and remind the participants when the time arrives

    Examples:
      | date    | participant |
      | sunday  | Jonas       |
      | monday  | Tritin      |

    # Error Flow
  Scenario Outline: Project manager unassociates an event putting a date that already occured

    Given an event that will be happening in the future
    When the manager unassociates an event instance with an already occured date <date> and participant <participant>
    Then an event instance is not unassociated with members and an error occurs saying "unable to unassociate the members to the event, wrong date"

    # Error Flow
  Scenario Outline: Project manager unassociates an event that already exists

    Given an event that is already unassociated
    When the manager attempts to unassociate an event instance with date <date> and participant <participant>
    Then an event instance is not unassociated and an error occurs saying "event already exists"