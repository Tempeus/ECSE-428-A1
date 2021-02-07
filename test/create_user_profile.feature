Feature: create a user profile

  As a company user
  I would like to create a profile for the tool
  So that my team can easily identify me

  Scenario Outline: Company authorized developer uses their company email to create a profile under the company

    # Normal Flow
    Given a company user with a company email <email>
    When the company user inputs their company email <email> and password <password>
    Then a new company user is created

    Examples:
      | email             |  password  |
      | bob@company.com   |  aabbcc123 |
      | alice@yahoo.ca    |  jjkkbb89  |
      | carl@gmail.com    |  elephants |

    # Error Flow
  Scenario Outline: A company user tries to create an account with a company email that is already in use

    Given a company user with company email "bob@company.com"
    And an exisitng company user with company email "bob@company.com"
    When company user with company email "bob@company.com" tries to create an account
    Then an error is generated with message "This company user already exists"

    # Error Flow
  Scenario Outline: A non-authorized person tries to create an account with a non-company email

    Given a non-authorized person with the email "bob@gmail.com"
    When that non-authorized person creates an account
    Then an error is generated with message "User is not allowed to create an account under this company"