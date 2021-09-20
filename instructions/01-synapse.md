# Get Started with Synapse Analytics

In this exercise, you'll create a Synapse Analytics workspace and use it to ingest and analyze some data.

The exercise is designed to familiarize you with some key capabilities of Synapse Analytics, not as a comprehensive guide to performing advanced data analysis. The exercise should take around 30 minutes to complete.

> **Note**: To complete this exercise, you will need a Microsoft Azure subscription. If you don't already have one, you can sign up for a free trial at [https://azure.microsoft.com/free](https://azure.microsoft.com/free?portal=true).

## Provision a Synapse Analytics workspace

To use Synapse Analytics, you must provision a Synapse Analytics Workspace resource in your Azure subscription.

1. Open the Azure portal at [https://portal.azure/com](https://portal.azure/com?portal=true), and sign in using the credentials associated with your Azure subscription.
2. In the Azure portal, on the **Home** page, use the **&#65291; Create a resource** icon to create a new resource.
3. Search for *Azure Synapse Analytics*, and create a new **Azure Synapse Analytics** resource with the following settings:
    - **Subscription**: *Your Azure subscription*
        - **Resource group**: *Create a new resource group with a suitable name, like "synapse-rg"*
        - **Managed resource group**: *Enter an appropriate name, for example "synapse-managed-rg"*.
    - **Workspace name**: *Enter a unique workspace name, for example "synapse-ws-<your_name>*.
    - **Region**: *Select any available region*.
    - **Select Data Lake Storage Gen 2**: From subscription
        - **Account name**: *Create a new account with a unique name, for example "datalake<your_name>"*.
        - **File system name**: *Create a new file system with a unique name, for example "fs<your_name>"*.

    > **Note**: A Synapse Analytics workspace requires two resource groups in your Azure subscription; one for resources you explicitly create, and another for managed resources used by the service. It also requires a Data Lake storage account in which to store data, scripts, and other artifacts.

4. When you've entered these details, select **Review + create**, and then select **Create** to create the workspace.
5. Wait for the workspace to be created - this may take five minutes or so.
6. When deployment is complete, go to the resource group that was created and notice that it contains your Synapse Analytics workspace and a Data Lake storage account.
7. Select your Synapse workspace, and in its **Overview** page, in **Open Synapse Studio** card, select **Open** to open Synapse Studio in a new browser tab. Synapse Studio is a web-based interface that you can use to work with your Synapse Analytics workspace.
8. On the left side of Synapse Studio, use the **&rsaquo;&rsaquo;** icon to expand the menu - this reveals the different pages within Synapse Studio that you will use to manage resources and perform data analytics tasks, as shown here:

    ![Synapse Studio](./images/synapse-studio.png)

## Ingest data

One of the key tasks you can perform with Azure Synapse Analytics is to define *pipelines* that transfer (and if necessary, transform) data from a wide range of sources into your workspace for analysis.

1. In Synapse Studio, on the **Home** page, select **Ingest** top one the **Copy Data** tool
2. In the Copy Data tool, on the **Properties** page, ensure that **Built-in copy task** and **Run once now** are selected, and click **Next >**.
3. On the **Source** page, in the **Dataset** step, select the following settings:
    - **Source type**: HTTP
    - **Connection**:  *Create a new connection with the following properties:*
        - **Name**: AdventureWorks Products
        - **Description**: Product list via HTTP
        - **Connect via integration runtime**: AutoResolveIntegrationRuntime
        - **Base URL**: 
