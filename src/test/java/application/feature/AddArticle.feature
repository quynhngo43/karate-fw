Feature: Add Article

  Background:
    Given url apiUrl

  Scenario: Add a valid article
    Given path 'articles'
#    And def newArticle = call read('classpath:helpers/Dummy.feature')
#    * print newArticle.response.
    And  request {"article": {"tagList": [],"title": "#(title)","description": "des","body": "body"}}
#      """
#        "article" : {
#          "tagList": [],
#           "title": "Articles-12343",
#           "description": "des",
#           "body": "body"
#        }
#      """
    When method Post
    Then status 201

