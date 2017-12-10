
Feature: edit user hours
    In order to manage working hours of my emplyees
    As admin
    I want to edit user hours

    Background:
        Given there are working hour made in "13/12/2017 8:00-13-00"
        And these working hours were made by "Antonio"
        And these working hours were made for the company "A&B"
    
    Scenario: edit event day
        Given I am on the landing page
        When I change the day where working hours were made
        And I click on "Edit"
        Then I should see the changes

    Scenario: edit event hours
        Given I am on the landing page
        When I change the working hours made
        And I click on "Edit"
        Then I should see the changes
    
    Scenario Outline: edit event with invalid data
        Given I am on the landing page
        When I change the <element> with invalid <data>
        And I click on "Edit"
        Then I should see an error

    Examples: 
        | element       | data                   |
        | working hours | 13/12/2017 8:00-13:00  |
        | working hours | 13/12/2017 23:00-27:00 |
        | working hours | 32/12/2017 8:00-13:00  |
        | company       | notExistingCompany     |