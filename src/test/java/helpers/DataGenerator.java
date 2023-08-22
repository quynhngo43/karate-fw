package helpers;

import com.github.javafaker.Faker;

public class DataGenerator {

    public static String getRandomEmail(){
        Faker faker = new Faker();
        String email = faker.name().firstName().toLowerCase() + faker.random().nextInt(0, 100) + "@test.com";
        return email;
    }

    public static String getRandomUsername(){
        Faker faker = new Faker();
        String username = faker.name().username();
        return username;
    }

    public static String getRandomArticle() {
        Faker faker = new Faker();
        String article = "Article-" + faker.random().nextInt(10000,1000000);
        return article;
    }
}
