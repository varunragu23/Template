import java.io.*;
import java.util.*;

public class Task {
    public static String NAME = "task";
    public static void main(String[] args) throws IOException {

        BufferedInputStream input = new BufferedInputStream(new FileInputStream(NAME+".in"));
        PrintStream output = new PrintStream(new FileOutputStream(NAME+".out"));
        System.setIn(input);
        System.setOut(output);

        Scanner sc = new Scanner(System.in);

        int dog[] = new int[3];
        dog[0] = sc.nextInt();
        dog[1] = sc.nextInt();
        dog[2] = sc.nextInt();
        Arrays.sort(dog);

        int min = 0;
        int max = 0;

        int first = dog[1] - dog[0];
        int second = dog[2] - dog[1];

        if (!isSeq(dog)) {
            if (first < second) {
                max = second - 1;
            } else {
                max = first - 1;
            }
        }

        if (isSeq(dog)) {
            min = 0;
        } else if (first == 2 || second == 2) {
            min = 1;
        } else {
            min = 2;
        }

        System.out.println(min);
        System.out.println(max);
        System.out.flush();
        sc.close();
    }

    static boolean isSeq(int cow[]) {
        return cow[0]+1 == cow[1] && cow[1] + 1 == cow [2];
    }
}