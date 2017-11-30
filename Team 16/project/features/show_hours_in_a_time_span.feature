Feature: show hours in a time span
    In order to keep track of the hours worked for me
    As a company
    I want to get hours worked for me

    Background:
        Given I am the company "A&B"
        And there are working hours made for me

    Scenario: report working hours in a time span
        Given I am on my landing page
        When I select a time span
        Then I should see the working hours spent for me
        And I should see the users who worked for me