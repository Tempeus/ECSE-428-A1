Feature: delete a user profile

  As a company manager
  I would like to delete a profile from the tool
  So that the employee is no longer on the team

  Scenario Outline: Company authorized manager requests to delete the profile

    # Normal Flow
    Given an old team member with a company email <email>
    When the team manager requests to delete the profile of the old team member
    Then the old team member will no longer be in the team

    # Error Flow
  Scenario Outline: Company authorized manager requests to delete an non-existant profile

    Given a non existing old team member with a company email "bob@company.com"
    When the team manager requests to delete the profile of the old team member
    Then an error is generated with message "This company user does not exists"

    # Error Flow
  Scenario Outline: A non-authorized employee tries delete a profile

    Given an old team member with a company email "bob@company.com"
    When a non-authorized employee requests to delete the profile of the old team member
    Then an error is generated with message "You do not have adequate permissions to do this action"