Feature: assign projects

  As a project manager
  I would like to assign projects to my developers
  So that my team can focus on a specific project

  Scenario Outline: Project manager successfully assigns a project

    # Normal Flow
    Given a project manager managing a team with a developer <name> and must assign an existing project <project>
    When the manager assigns their developer <name> with the project <project>
    Then the developer <name> will be assigned to project <project>

    Examples:
      | name        | project         |
      |  Jim        | Production      |
      | Mark        | CleanUp         |

    # Error Flow
  Scenario Outline: Project manager assigns a project to an non-existing member

    Given a project manager must assign an existing project <project>
    When the manager assigns a non-existing developer with the project <project>
    Then an error will appear saying "the member does not exist"


    # Error Flow
  Scenario Outline: Project manager assigns a non-existing project to a member

    Given project manager managing a team with a developer <name>
    When the manager assigns their developer <name> with a non-existing project
    Then an error will appear saying "the project does not exist"
