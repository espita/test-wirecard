Feature: Creating a order

  Scenario: Creating a valid order one item
    Given that I have a valid creation contract
    When I send the requisition
    Then I receive confirmation of the creation

  Scenario: Creating a valid order two item
    Given
    When
    And
    Then

  Scenario: Validate field ownId more then 45 characters
    Given
    When
    And
    Then

  Scenario: Validate field amount.currency with american currency code
    Given
    When
    And
    Then

  Scenario: Validate field amount.currency with american currency codemore then 3 characters
    Given
    When
    And
    Then
