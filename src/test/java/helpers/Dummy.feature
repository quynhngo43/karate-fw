Feature: Dummy

#  Scenario: Dummy
#    * def dataGenerator = Java.type('helpers.DataGenerator')
#    * def username = dataGenerator.getRandomUsername()
#    * print username

  Scenario: Create article title
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def articleTitle = dataGenerator.getRandomArticle()
    * print articleTitle