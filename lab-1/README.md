# Lab 1

Take input from console and print hello world everytime "HI" is input on the console.

## Contents:
- [How to make a Lex file](https://github.com/theDrake1010/compiler-construction-lab/tree/main/lab-1#how-to-make-a-lex-file)

- [How to run the lex file](https://github.com/theDrake1010/compiler-construction-lab/tree/main/lab-1#how-to-run)

- [Output](https://github.com/theDrake1010/compiler-construction-lab/tree/main/lab-1#output)


## How to make a Lex file?

1. Create the lex file through your terminal:
```bash
touch hello-world.l
```

2. There are no global variables/definitions. 

3. Two rules:
    - Print "Hello World" everytime the literal "HI" is seen.
    - Do nothing for anything else.

4. Finally, create a main function that calls `yylex()` and returns 0.

You can see the rules inside the file [hello-world.l](https://github.com/theDrake1010/compiler-construction-lab/blob/main/lab-1/hello-world.l)


## How to run the lex file?

1. Ensure you are in the directory with lex file:

```bash
cd <directory path>
```

2. Use flex to create the C file:

```bash
flex hello-world.l
```

3. Use GCC or CC to compile the C file "lex.yy.c":

```bash
cc lex.yy.c -ll
```

*Note: If "-ll" flag isnt used, you will receive an error since `yywrap()` is not defined in the current lex file.*


4. Run the output file "a.out":
```bash
./a.out
```

5. Type "HI" and press Enter :)

## Output:

The result should look something like this:

![hello world output](../images/lab-1/hello_word_output.jpg)
