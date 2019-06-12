# encoding: utf-8
@create_payment

Feature: Creating a payment

  Scenario: Creating order with valid payment
    Given that I have a valid creation contract
    When I send the requisition
    Then I receive confirmation of the creation
    And I send the requisition to create a payment
    Then I receive confirmation of the creation
    And I access my wirecard account
    And the payment status of order must be pago