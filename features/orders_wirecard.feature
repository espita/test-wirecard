# encoding: utf-8
@create_order

Feature: Creating a order
  
  @one_item
  Scenario: Creating a valid order one item
    Given that I have a valid creation contract
    When I send the requisition
    Then I receive confirmation of the creation

  @two_item
  Scenario: Creating a valid order two item
    Given that I have a valid creation contract whit two item
    When I send the requisition
    Then I receive confirmation of the creation

  @existing_customer
  Scenario: Creating a valid order existing customer
    Given that I have a valid creation contract whit existing customer
    When I send the requisition
    Then I receive confirmation of the creation

  @ownId
  Scenario: Validate field ownId more then 45 characters
    Given that I have a invalid creation contract whit fields maximum character limit "ownId"
    When I send the requisition
    Then I receive message of error bad request

  @currency
  Scenario: Validate field currency with american currency code
    Given that I have a invalid creation contract whit field different currency "idCurrency"
    When I send the requisition
    Then I receive message of error bad request

  @currency
  Scenario: Validate field currency more then 3 characters
    Given that I have a invalid creation contract whit fields maximum character limit "currency"
    When I send the requisition
    Then I receive message of error bad request

  @product
  Scenario: Validate field product more then 250 characters
    Given that I have a invalid creation contract whit fields maximum character limit "product"
    When I send the requisition
    Then I receive message of error bad request

@customer
  Scenario: Validate field customer unwritten
    Given that I have a invalid creation contract whit fields maximum character limit "customer"
    When I send the requisition
    Then I receive message of error bad request

@customer
  Scenario: Validate customer id field not existing 
    Given that I have a invalid creation contract whit fields maximum character limit "customerId"
    When I send the requisition
    Then I receive message of error bad request
