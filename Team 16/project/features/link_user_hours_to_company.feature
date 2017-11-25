Feature: link an event to a company
    In order to keep track of the working hours spent for a company I create an event 
    As a user
    I want to link my hours to a company through an event

    Background:
        Given a list of companies
        And hours spent for a company
    
    Scenario: link an event to a company
        Given the following list of companies:
            | Company |
            | A&B     |
            | C&D     | 
            | E&F     |
            | G&H     |
        When I create an event
        And I select a company from the list of companies 
        And I fill in the form with valid data
        Then I should see the event on my calendar
