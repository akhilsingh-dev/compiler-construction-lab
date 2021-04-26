# for_loop

<add description here>

## RUN THE CODE via 
1.  Use lex to create C file via : 
    ```bash
    flex <FILENAME>.l
    ```

2. Use bison to create y.tab.c:
    ```bash
    bison -dy <FILENAME>.y
    ```


3.  Use GCC to compile C file/s via :

    ```bash
    gcc lex.yy.c <FILENAME>.tab.c -lfl
    ```
    
    OR

    ```bash
    gcc <FILENAME>.tab.c -lfl
    ```

depending on how you setup your code.


4. Run file as command line argument :
    ```bash
    ./a.out <add any args here if needed>
    ```

## Output

![for_loop output](../../images/lab-9/for_loop_output.jpg)

