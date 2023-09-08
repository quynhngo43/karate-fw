package helpers;

import java.io.File;
import java.io.FileWriter;

public class FileCreator {
    public static void CreateTxtFile(String targetPath, String text) {
        System.out.println("abcde");
        try {
            File file = new File(targetPath);
            FileWriter txtFile = new FileWriter(targetPath);
            txtFile.write(text);
            System.out.println("abcd");
            txtFile.close();
        }
        catch (Exception e){
            System.out.println(e);
        }
    }
}
