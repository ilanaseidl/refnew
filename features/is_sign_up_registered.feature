Feature: Is sign up registered?
  We want every user in the db.
  
  Scenario: User signs up
    Given current user's email
    When user successfully sign up
    Then user appears in the db