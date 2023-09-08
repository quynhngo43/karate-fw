package helpers;

public class TextProcessing {
    public static String addSpace(String s, int expectedLength) {
        String newStr = s;
        int addedSpace = expectedLength - s.length();
        if (addedSpace > 0) {
            for (int i = 0; i < addedSpace; i++) {
                newStr += " ";
//                System.out.println(newStr);
            }
        }
        return newStr;
    }
}
