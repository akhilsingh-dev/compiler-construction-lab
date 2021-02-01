# compiler-construction-lab

<a href="https://github.com/theDrake1010"><img src="https://img.shields.io/badge/Made%20by-theDrake1010-orange.svg"/></a>

This repository holds the code and instructions for the compiler construction lab (Spring 2021).


## Resources
Please refer the resources directory


## How to install Flex and Bison?

Windows users need to install Ubuntu on (Windows Subsystem for Linux) WSL. 
If you have Ubuntu on your machine, you can skip the first step...


1. **Only for Windows 10 Users** : Installing [WSL](https://docs.microsoft.com/en-us/windows/wsl/about) and [Ubuntu](https://ubuntu.com/):
    
    This video demonstrates how to do this:
    
    [How to Install Ubuntu on Windows 10 (WSL)](https://www.youtube.com/watch?v=X-DHaQLrBi8) 

    You should be able to access an Ubuntu terminal after successfully completing this step.
    Watch the complete video to understand WSL Ubuntu's File Structure.

    PS: Please choose Ubuntu 20 for following the rest of instructions. Other distributions' steps may vary.

2. Open the Ubuntu terminal and type the following:

    a. Update/Upgrade your ubuntu packages:
    ```bash
    sudo apt update
    sudo apt upgrade
    ```
    Give it the password when prompted and type in "y" when asked to install.

    b. Installing Flex:
    ```bash
    sudo apt install flex
    ```
    ![Installing Lex](./images/installing_lex.jpg)

    c. Installing Bison:
    ```bash
    sudo apt install bison
    ```
    ![Installing Bison](./images/installing_bison.jpg)

3. Do a sanity check and test run of the software:

    a. First run a sanity check:
    ```bash
    which flex bison
    ```
    This should show you the location of installed packages usually:
    ```bash
    /usr/bin/flex
    /usr/bin/bison
    ```

    b. [TODO] : Add further checks
