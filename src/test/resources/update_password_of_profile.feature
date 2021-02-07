Feature: update password of profile

  As a company user
  I would like to update my password for the tool
  So that my account is secure if someone has access to my old password

  Scenario Outline: Company authorized developer requests to change their password

    # Normal Flow
    Given a company user with a company email <email> and password <password>
    When the company user requests to change their password to <newPassword>
    Then the company developer's password is now <newPassword>

    Examples:
      | email               |  password  | newPassword |
      | bob@company.com     |  aabbcc123 | 123124      |
      | alice@company.ca    |  jjkkbb89  | gopaijdfpai |
      | carl@company.com    |  elephants | cows        |

    # Alternate Flow
  Scenario Outline: A company user requests to change the password to the same password

    Given a company user with a company email <email> and password <password>
    When the company user requests to change their password to the same password <password>
    Then the company developer's password is now <password>

    Examples:
      | email               |  password  |
      | bob@company.com     |  aabbcc123 |
      | alice@company.ca    |  jjkkbb89  |
      | carl@company.com    |  elephants |

    # Error Flow
  Scenario Outline: A company user requests to change the password and leaves the field empty

    Given a company user with a company email <email> and password <password>
    When the company user requests to change their password to an empty string
    Then an error is generated with message "You must enter something in the field"