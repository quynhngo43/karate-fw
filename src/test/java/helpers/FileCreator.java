package helpers;

import java.io.File;
import java.io.FileWriter;

public class FileCreator {
    public static void CreateTxtFile(String targetPath, String text) {
        try {
            File file = new File(targetPath);
            FileWriter txtFile = new FileWriter(targetPath);
            txtFile.write(text);
            txtFile.close();
        }
        catch (Exception e){
            System.out.println(e);
        }
    }
}
