Feature: login system

  As a developer
  I would like to logout from my account before leaving
  So that it prevent people from accessing my machine without login it

  Scenario Outline: Developer successfully logout to their account

    # Normal Flow
    Given A developer is logged into the system
    When the developer wants to end the session and attempts to log out
    Then the account no longer has access to the system and logs out

  Scenario Outline: The account of developer automatically logs out after being inactive for an hour

    #Alternative FLow
    Given A developer is logged into the system
    When the account has been inactive for more than an hour
    Then the account no longer has access to the system and logs out


    # Alternative Flow
  Scenario Outline: the account of developer automatically logs out when the computer goes to sleep

    Given A developer is logged into the system
    When the computer falls asleep
    Then the account no longer has access to the system and logs out
