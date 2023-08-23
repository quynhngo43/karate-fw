@debug1
Feature: Validate favorite and comment function

  Background: Preconditions
    Given url apiUrl
      # Step 1: Add new article (optimize here - Create a AddArticle.feature)
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def articleTitle = dataGenerator.getRandomArticle()
    Given def newArticle = call read('classpath:application/feature/AddArticle.feature') {"title": '#(articleTitle)'}
      # Step 2: Get the favorites count and slug ID for the the article, save it to variables
    * def resID = newArticle.response.article.slug
    * def favoriteCount = newArticle.response.article.favoritesCount

  Scenario: Favorite articles

        # Step 3: Make POST request to increase favorites count for the article
    * def isTimeValidator = read('classpath:helpers/TimeValidator.js')
    * def username = "diemquynh"
    Given path 'articles', resID, 'favorite'
    When method Post
        # Step 4: Verify response schema
    Then status 200
        # Step 5: Verify that favorites article incremented by 1
    * def newFavoriteCount = response.article.favoritesCount
    And match newFavoriteCount == favoriteCount + 1
        # Step 6: Get all favorite articles
    Given path 'articles'
    And params {"favorited":"#(username)"}
    When method Get
        # Step 7: Verify response schema
    Then match each response.articles ==
        """
        {
          "slug": "#string",
          "title": "#string",
          "description": "#string",
          "body": "#string",
          "tagList": "#array",
          "createdAt": "#? isTimeValidator(_)",
          "updatedAt": "#? isTimeValidator(_)",
          "favorited": "#boolean",
          "favoritesCount": "#number",
          "author": {
            "username": "#string",
            "bio": "##string",
            "image": "#string",
            "following": "#boolean"
          }
        }
        """
        # Step 8: Verify that slug ID from Step 2 exist in one of the favorite articles
    * print response.articles
    Then match response..slug contains resID
        # Step 9: Delete the article (optimize here with afterScenario - create a Hook.feature)
    * configure afterScenario = function (){karate.call('DeleteArticle.feature', {"articleId": resID});}

  Scenario: Comment articles
        # Step 3: Make a GET call to 'comments' end-point to get all comments
    Given path 'articles', resID, 'comments'
    When method Get
        # Step 4: Verify response schema
    Then status 200
        # Step 5: Get the count of the comments array length and save to variable
    * def numberOfComments = response.comments
        # Step 6: Make a POST request to publish a new comment
    * def body = "this is good"
    Given path 'articles', resID, 'comments'
    Given request {"comment": {"body": '#(body)'}}
    When method Post
        # Step 7: Verify response schema that should contain posted comment text
    Then match response.comment.body == body
        # Step 8: Get the list of all comments for this article one more time
    Given path 'articles', resID, 'comments'
    When method Get
        # Step 9: Verify number of comments increased by 1 (similar like we did with favorite counts)
    Then match Number(response.comments.length) == numberOfComments.length + 1
       # Step 10: Make a DELETE request to delete comment
    * def commentID = response.comments[0].id
    Given path 'articles', resID, 'comments', commentID
    When method Delete
       # Step 11: Get all comments again and verify number of comments decreased by 1
    Given path 'articles', resID, 'comments'
    When method Get
    Then match Number(response.comments.length) == numberOfComments.length
        # Step 12: Delete the article (optimize here with afterScenario - create a Hook.feature)
    * configure afterScenario = function (){karate.call('DeleteArticle.feature', {"articleId": resID});}