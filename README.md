# Code Comparator

Code Comparator is a script that allows you to compare the outputs of two code files written in different programming languages. It supports C++, C, and Java files. The script generates random inputs, executes the code files with those inputs, and compares the output generated by each code file.

## Requirements

To use the Code Comparator script, you need to have the following software installed on your system:

- Bash (version 4 or later)
- C++ compiler (g++)
- C compiler (gcc)
- Java Development Kit (JDK)

## Instructions

Follow these steps to use the Code Comparator script:

1. Clone the repository or download the script file (`code_comparator.sh`) to your local machine.

2. Open a terminal and navigate to the directory where the script file is located.

3. Make the script file executable by running the following command:

   ```bash
   chmod +x code_comparator.sh
4. Run the script with the following command:
   
   ```bash
   ./code_comparator.sh <num_tests> <file1> <file2> <file3>
   ```
   `<file1>`: The first code file to compare. It can be written in C++, C, or Java.

   `<file2>`: The second code file to compare. It can be written in C++, C, or Java.

   `<file3>`: The third code file which is responsible to generate random test cases. It can be written in C++ only.

   `<num_tests>`: The number of tests to perform. This determines the number of times `file3` will generate testcases and compared outputs of `file1` and `file2`. It should be a positive integer.

   Note: The file extensions should match the programming language used (e.g., .cpp for C++, .c for C, .java for Java).
5. The script will compile the code files and generate random inputs for each test. It will then execute the code files with the inputs, compare the outputs, and display a progress bar indicating the completion of each test.

6. Once all tests are completed, the script will display the final result: whether the outputs of the code files matched for all tests or not.

7. If the outputs did not match for any test, the script will stop and left the input and output files in ccmp directory.

8. The generated input and output files (`input.txt`, `a_output.txt`, `b_output.txt`) will be cleaned up after the tests are completed if **no mismatch** ocurred.

## Example Usage
Here's an example command to run the Code Comparator script:
```
./code_comparator.sh 10 file1.cpp file2.java file3.cpp
```

This command compares the outputs of file1.cpp (C++) and file2.java (Java) using 10 random tests input generated by file3.cpp (C++).


With the Code Comparator script, you can easily compare the outputs of code files written in different programming languages and verify their correctness. Enjoy coding and comparing!