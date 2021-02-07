Feature: change development role

  As a company developer
  I would like to change the development role
  So that I can be promoted to management or demoted to tester

  Scenario Outline: Company employee updates their role

    # Normal Flow
    Given a company authorized employee and the current role is <role>
    When the company employee requests to the role to <newRole>
    Then the development role is now <newRole>

    Examples:
    | role        | newRole         |
    | manager     | developer       |
    | manager     | tester          |

    # Alternate Flow
  Scenario Outline: Company employee updates their role to the same role

    Given a company authorized employee and the current role is <role>
    When the company employee requests to the mode to the same role <role>
    Then the development role is now <role>

    Examples:
      | role        |
      | manager     |
      | developer   |

    # Error Flow
  Scenario Outline: Company employee updates their role to a non-authorized high ranking role

    Given a company authorized employee and the current role is <role>
    When the company employee requests to the mode to the higher ranking role without permission <newRole>
    Then an error is generated with message "You do not have enough permissions to do this action"

    Examples:
      | role        | newRole         |
      | tester      | manager       |
      | developer   | manager          |