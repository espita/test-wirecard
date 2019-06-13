# encoding: utf-8
@create_payment

Feature: Creating a payment

@order_paid
  Scenario: Creating order with valid payment credit card
    Given that I have a valid creation contract
    When I send the requisition
    Then I receive confirmation of the creation
    And I send the requisition to create a payment
    Then I receive confirmation of the creation of payment
    And I access my wirecard account
    And the payment status of order must be pago


@order_paid_bankslip
  Scenario: Creating order with valid payment bank slip
    Given that I have a valid creation contract
    When I send the requisition
    Then I receive confirmation of the creation
    And I send the requisition to create a payment to bank slip
    Then I receive confirmation of the creation of payment
    And I approve the payment using of API authorize
    And I access my wirecard account
    And the payment status of order must be pago