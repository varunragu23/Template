import java.io.*;
import java.util.*;

public class a {
    public static String NAME = "task";
    public static void main(String[] args) throws IOException {

        BufferedInputStream input = new BufferedInputStream(new FileInputStream(NAME+".in"));
        PrintStream output = new PrintStream(new FileOutputStream(NAME+".out"));
        System.setIn(input);
        System.setOut(output);

        Scanner sc = new Scanner(System.in);

	int max = 0;

        System.out.println(max);
        System.out.flush();
        sc.close();
    }
}
