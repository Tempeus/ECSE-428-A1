Feature: unassign projects

  As a project manager
  I would like to unassign projects to my developers
  So that my team can focus on another project

  Scenario Outline: Project manager successfully unassigns a project

    # Normal Flow
    Given a project manager managing a team with a developer <name> and must unassign an existing project <project>
    When the manager unassigns their developer <name> from the project <project>
    Then the developer <name> will be unassigned to project <project>

    Examples:
      | name        | project         |
      |  Jim        | Production      |
      | Mark        | CleanUp         |

    # Error Flow
  Scenario Outline: Project manager unassigns a project to an non-existing member

    Given a project manager must unassign an existing project <project>
    When the manager unassigns a non-existing developer with the project <project>
    Then an error will appear saying "the member does not exist"


    # Error Flow
  Scenario Outline: Project manager unassigns a non-existing project to a member

    Given project manager managing a team with a developer <name>
    When the manager unassigns their developer <name> with a non-existing project
    Then an error will appear saying "the project does not exist"
