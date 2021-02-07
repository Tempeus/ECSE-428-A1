Feature: login system

  As a developer
  I would like to login before accessing my files
  So that it prevents unwanted people from accessing my work

  Scenario Outline: Developer successfully login to their account

    # Normal Flow
    Given a developer with work email <email> and password <password>
    When the developer enters his details correctly
    Then he successfully login into the system

    Examples:
      | email             |  password  |
      | bob@company.com   |  aabbcc123 |
      | alice@yahoo.ca    |  jjkkbb89  |
      | carl@gmail.com    |  elephants |

  Scenario Outline: Developer unsuccessfully login with the wrong email but right password

    #Error FLow
    Given a developer with the work email <email> and password <password>
    When the developer enters the correct email but wrong password <wrongPass>
    Then the system will block him from entering the system

    Examples:
      | email             |  password  | wrongPass |
      | bob@company.com   |  aabbcc123 | aabbcc12  |
      | alice@yahoo.ca    |  jjkkbb89  | 1234      |
      | carl@gmail.com    |  elephants | cows      |

    # Error Flow
  Scenario Outline: Developer unsuccessfully login with the wrong password but right email

    Given a developer with the work email <email> and password <password>
    When the developer enters the correct password but wrong email <wrongEmail>
    Then the system will block him from entering the system

    Examples:
      | email             |  password  | wrongEmail       |
      | bob@company.com   |  aabbcc123 | bib@company.com  |
      | alice@yahoo.ca    |  jjkkbb89  | carl@gmail.com   |