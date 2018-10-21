Feature: Creating/editing a devspace from docker image is disallowed in case it conflicts with the name of an already existing devspace

  Background:
    Given user is logged in to DevSpaces
    And user account contains one devspace created from docker image
    And user account contains one devspace created from a devspace template

  Scenario: User is entering the name of a devspace that doesn't exist  for the user account
    Given user is creating/editing a Devspace from a docker image
    When the user is entering the desired name
    Then the name of the devspace is validating in data-model (ws_instance) of devspaces
    And there is a feedback whether the name is available for use

  Scenario: User is entering the name of a devspace that exist  for the user account
    Given user is creating/editing a Devspace from a docker image
    When the user is entering the desired name
    Then the name of the devspace is validating in data-model (ws_instance) of devspaces
    And there is a feedback whether the name is not available for use

  Scenario: User is creating a devspace and choose an existing name for the user account
    Given user is creating a Devspace from a docker image
    When the user enters the desired name
    Then the name of the devspace is validated in data-model (ws_instance) of devspaces
    And the user is not allowed to proceed to the next step

  Scenario: User is editing a devspace and choose an existing name for the user account
    Given user is editing a Devspace from a docker image
    When the user enters the desired name
    Then the name of the devspace is validated in data-model (ws_instance) of devspaces
    And the user is not allowed to validate the Devspace

  Scenario: User is creating a devspace and choose a non-existing name for the user account
    Given user is creating a Devspace from a docker image
    When the user enters the desired name
    Then the name of the devspace is validated in data-model (ws_instance) of devspaces
    And the user is allowed to proceed to the next step
