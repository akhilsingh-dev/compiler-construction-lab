# infix_postfix

<add description here>

## RUN THE CODE via 
1.  Use lex to create C file via : 
    ```bash
    flex infix.l
    ```

2. Use bison to create y.tab.c:
    ```bash
    bison -dy infix.y
    ```

3.  Use GCC to compile C file/s via :

    ```bash
    gcc lex.yy.c infix.tab.c -lfl
    ```

4. Run file as command line argument :
    ```bash
    ./a.out
    ```

## Output

![infix_postfix output](../../images/lab-8/infix_postfix_output.jpg)

