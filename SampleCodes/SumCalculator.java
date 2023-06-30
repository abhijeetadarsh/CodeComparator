import java.util.Scanner;

public class SumCalculator {
    public static void main(String[] args) {
        // Create a Scanner object to read user input
        Scanner scanner = new Scanner(System.in);
        int t = scanner.nextInt();
        while (t-- != 0) {

            // Prompt the user to enter the first number
            // System.out.print("Enter the first number: ");
            int num1 = scanner.nextInt();

            // Prompt the user to enter the second number
            // System.out.print("Enter the second number: ");
            int num2 = scanner.nextInt();

            // Calculate the sum of the two numbers
            int sum = num1 + num2;

            // Output the result
            System.out.println(sum);

        }

        // Close the Scanner
        scanner.close();
    }
}