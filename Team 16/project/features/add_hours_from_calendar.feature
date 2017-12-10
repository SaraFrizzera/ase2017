Feature: add a new event to a calendar
    In order to keep track of my working hours in a day
    As a user
    I want to add a new event to a calendar 

    Scenario: create a new event 
        Given I am on my landing page
        When I fill in the form with valid data
        And I click on "Create"
        Then I should see the new event on the calendar

    Scenario Outline: create a new invalid event 
        Given I am on my landing page
        When I fill in the form with <time>
        And I fill in the form with <company>
        And I fill in the form with <username>
        And I click on "Create"
        Then I should see an error
    
   Examples: 
        | time                   | company  | username |
        | 13/12/2017 8:00-13:00  | A&B      | Antonio  |
        | 13/12/2017 23:00-27:00 | C&D      | Matteo   |
        | 32/12/2017 8:00-13:00  | E&F      | Sara     |
         



