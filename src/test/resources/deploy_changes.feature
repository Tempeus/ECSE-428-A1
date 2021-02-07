Feature: deploy changes

  As a developer
  I would like to deploy changes
  So that the system is updated with new features

  Scenario Outline: Developer successfully deploys changes

    # Normal Flow
    Given developer <name> wants to deploy changes on project <project> on date <deploymentDate>
    When developer <name> deploys changes on project <project> on date <deploymentDate>
    Then project <project> is updated with latest deployment date <deploymentDate> and developer <name> who deployed it

    Examples:
      | name        | project         | deploymentDate |
      |  Jim        | Production      | Mar 13 2020    |
      | Mark        | CleanUp         | Feb 01 2021    |

    # Error Flow
  Scenario Outline: Developer deploys changes an non-existing project

    Given developer <name> must deploy changes on an existing project <project>
    When  developer <name> deploys changes on an non-existing project <project>
    Then an error will appear saying "error, project does not exist"


    # Error Flow
  Scenario Outline: Developer deploys no changes an a project

    Given developer <name> wants to deploy project <project> on date <deploymentDate> with no changes
    When developer <name> deploys the project <project> on date <deploymentDate>
    Then an error will appear saying "error, deployment unchanged"
