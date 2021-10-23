## Create Azure resources

1. In the Azure Cloud Shell, enter the following command to download the files you'll need for this exercise.

    ```
    git clone https://github.com/graememMalcolm/data-stuff dp-900
    ```

2. Wait for the command to complete, and then enter the following command to change the current directory to the folder containing the files for this exercise.

    ```
    cd dp-900/streaming
    ```

3. Enter the following command to run a script that creates the Azure resources you will need in this exercise.

    ```
    bash setup.sh
    ```

    Wait as the script runs and performs the following actions:

    1. Installs the Azure CLI extensions needed to create resources (*you can ignore any warninmgs about experimental extensions*)
    2. Identifies the Azure resource group provided for this exercise, which will have a name similar to **learn-12345-abcde-67890-fghij-123...**.
    3. 
