Feature: Delete an article

  Background:
    Given url apiUrl

  Scenario: Delete a valid article
    Given path 'articles', articleId
    * print articleId
    When method Delete
    Then status 204