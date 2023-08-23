# ThreeWayCode Generator

This project is a simple utility that generates three-address code from arithmetic operations specified in a given input. It utilizes the Picocli library to provide a user-friendly command-line interface.

## Table of Contents

- [ThreeWayCode Generator](#threewaycode-generator)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Examples](#examples)

## Introduction

The ThreeWayCode Generator processes arithmetic expressions and produces corresponding three-address code. It supports both interactive input and input from files.

## Installation

Before you start, make sure you have Java 8 or later installed on your system.

1. Clone or download this repository.

2. Open a terminal and navigate to the project directory.

## Usage

To use the ThreeWayCode Generator, follow the steps below:

1. Open a terminal.

2. Navigate to the project directory.

3. Run the following command to execute the program:

    ```bash
    java -jar ThreeWayCode.jar
    ```

    This will show the help message and command options.

4. To process an arithmetic expression from the command line, simply enter it when prompted. The generated three-address code will be displayed.

5. To process an arithmetic expression from a file, use the `-f` or `--file` option followed by the file path:

    ```bash
    java -jar ThreeWayCode.jar -f input.txt
    ```

    Replace `input.txt` with the path to your input file.

6. Type `exit` when prompted for input to exit the program.

## Examples

Here are some basic examples to demonstrate the usage of the ThreeWayCode Generator:

1. Interactive Mode:

   ```bash
   java -jar ThreeWayCode.jar

Enter an arithmetic expression (e.g., x = 10 + 5;), and the generated three-address code will be displayed.

## Generated Three-Address Code

The ThreeWayCode Generator can produce three-address code from expressions like:

**Input:**
```bash
    x = 12 * (id1 * 12) + 10;
```

**Output:**
```bash
    t1 = id1 * 12
    t2 = 12 * t1
    t3 = t2 + 10
    x = t3    
```

