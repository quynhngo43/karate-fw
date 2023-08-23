Feature: Add Article

  Background:
    Given url apiUrl

  Scenario: Add a valid article
    Given path 'articles'
    And  request {"article": {"tagList": [],"title": "#(title)","description": "des","body": "body"}}
    When method Post
    Then status 201
    And match response.article.title == title