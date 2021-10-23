## Create Azure resources

1. In the Azure Cloud Shell, enter the following command to download the files you'll need for this exercise.

    ```
    git clone https://github.com/graememalcolm/data-stuff dp-900
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
    2. Identifies the Azure resource group provided for this exercise, which will have a name similar to **learn-*xxxxx-xxxxxx-xxxxxx...***.
    3. Creates an *Azure IoT Hub* resource, which will be used to receive a stream of data from a simulated device.
    4. Creates a *Azure Storage Account*, which will be used to store processed data.
    5. Creates a *Azure Stream Analytics* job, which will process the incoming device data in real-time, and write the results to the storage account.

## Explore the Azure resources

1. Open the [Azure portal](https://portal.azure.com?azure-portal=true), signing in if prompted.
2. On the home page, select **Resource groups** to see the resource groups in your subscription. This should include the **learn-*xxxxx-xxxxxx-xxxxxx...*** resource group identified by the setup script.
3. Select the **learn-*xxxxx-xxxxxx-xxxxxx...*** resource group, and review the resources it contains, which should include:
    - A *Stream Analytics job* named **analyzedevicedata**, which will be used to process streaming data.
    - A *Storage account* named **cloudshell*xxxxxxxx***, which is used to store data for the Azure Cloud Shell you used to run the setup script.
    - An *IoT Hub* named **iothub*xxxxxxxxxxxxx***, which is used to receive incoming device data.
    - A *Storage account* named **store*xxxxxxxxxxxx***, to which the data processing results will be written.
4. Select the **analyzedevicedata** Stream Analytics job and view the information on its **Overview** page, noting the following details:
    - The job has one *input* named **iotinput**, and one *output* named **bloboutput**. These reference the IoT Hub and Storage account created by the setup script.
    - The job has a *query*, which reads data from the **iotinput** input, and aggregates it by counting the number of messages processed every 10 seconds; writing the results to the **bloboutput** output.

## Use the resources to analyze streaming data

1. At the top of the **Overview** page for the Stream Analytics job, select the **&#9655; Start** button, and then in the **Start job** pane, select **Start** to start the job.
2. Wait for a notification that the streaming job started successfully.
3. Switch back to the Azure Cloud Shell, and enter the following command to simulate a device that sends data to the IoT Hub.

    ```
    bash iotdevice.sh
    ```

4. Wait for the simulation to start, which will be indicated by output like this:

    ```
    Device simulation in progress: 6%|#    | 7/120 [00:08<02:21, 1.26s/it]
    ```

5. While the simulation is running, back in the Azure portal, return to the page for the **learn-*xxxxx-xxxxxx-xxxxxx...*** resource group, and select the **store*xxxxxxxxxxxx*** storage account.
6. In the pane on the left of the storage account blade, select the **Storage browser** tab.
7. In the storage browser, select **Blob containers** and then open the **data** container.
8. In the **data** container, navigate through the folder hierarchy, which includes a folder for the current year, with subfolders for the month, day, and hour.
9. In the folder for the hour, select the file that has been created, which should have a name similar to **0_xxxxxxxxxxxxxxxx.json**.
10. On the page for the file, select **Edit**, and review the contents of the file; which should consist of a JSON record for each 10 second period, showing the number of messages received from IOT devices, like this:

    ```
    {"starttime":"2021-10-23T01:02:13.2221657Z","endtime":"2021-10-23T01:02:23.2221657Z","device":"iotdevice","messages":2}
    {"starttime":"2021-10-23T01:02:14.5366678Z","endtime":"2021-10-23T01:02:24.5366678Z","device":"iotdevice","messages":3}
    {"starttime":"2021-10-23T01:02:15.7413754Z","endtime":"2021-10-23T01:02:25.7413754Z","device":"iotdevice","messages":4}
    ...
    ```

11. Use the **&#8635; Refresh** button to refresh the file, noting that additional results are written to the file as Stream Analytics job processes the device data in realtime as it is streamed from the device to the IoT Hub.
12. Return to the Azure Cloud Shell and wait for the device simulation to finish (it should run for around 3 minutes).
13. Back in the Azure portal, refresh the file one more time to see the full set of results that were produced during the simulation.
14. Return to the **learn-*xxxxx-xxxxxx-xxxxxx...*** resource group, and re-open the **analyzedevicedata** Stream Analytics job.
15. At the top of the Stream Analytics job page, use the **&#11036; Stop** button to stop the job, confirming when prompted.
