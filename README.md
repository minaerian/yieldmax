# YieldMax ETF Dividend Analyzer

This repository contains a web application for analyzing YieldMax ETFs (e.g., \$MSTY, \$TSLY, \$PLTY). The primary goal is to estimate dividends based on uploaded Excel data detailing covered calls, synthetic positions, and intraday trades.

## Tech Stack

* **Frontend**: React with Tailwind CSS
* **Backend**: FastAPI (Python)
* **Database**: SQLite (for minimal hosting cost)
* **Hosting**: Azure App Service or Azure Container Apps
* **Deployment**: Azure Bicep scripts
* **CI/CD**: GitHub Actions

## Application Features

* **Excel Upload UI**:

  * Users upload Excel files detailing ETF positions and intraday trades.

* **Dividend Calculation**:

  * Extract premium and other relevant data from uploaded Excel sheets.

  * Calculate profit from covered calls, including intraday adjustments.

  * Estimate dividends per share, allowing for a reasonable range rather than a fixed value, using the formula:

    ```
    Dividend per Share ≈ (Total Premium Collected - Fees + Realized Gains/Losses) / Number of Outstanding Shares
    ```

  * Use provided data to create a predictive model for estimating dividends, adjusting based on observed historical patterns.

* **Multiple Ticker Support**:

  * System supports creation and tracking of multiple ETF tickers. Initially, start with the tickers: \$MSTY, \$TSLY, and \$PLTY.

* **Historical Data Management**:

  * Store trade data in SQLite database for historical analyses and comparisons.
  * Structure database to clearly manage holdings and intraday trade data for realized gains and losses calculation.

* **User Interface**:

  * Simple dashboard showing calculated dividends.
  * Charts visualizing historical dividend data (using Recharts).
  * Option to download analyzed data as CSV.

## Sample Excel Files

Sample Excel files for holdings and intraday trades will be provided. The application must support parsing these files to accurately compute realized gains and losses, as these significantly impact dividend distributions.

## Azure Infrastructure (via Bicep)

Create Azure resources via Bicep scripts, ensuring cost-efficiency:

* App Service or Azure Container Apps (serverless hosting)
* Storage Account (optional)
* Azure Key Vault for secure secret storage

**Note:** Use Azure Verified Bicep modules from [Azure's official registry](https://github.com/Azure/bicep-registry-modules/tree/main/modules) to ensure best practices and security.

## CI/CD with GitHub Actions

* Setup automated deployment pipeline:

  * Basic tests (ESLint, PyTest)
  * Azure deployment via service principals (Azure CLI integration)

## Security Considerations

* Store sensitive credentials and environment variables securely in Azure Key Vault.
* Implement basic token-based authentication or integrate with Azure Active Directory.

## Monitoring & Logging

* Basic logging via Azure Application Insights or default App Service logs.

## Initial Development Steps

1. Scaffold React frontend with Excel upload functionality.
2. Implement FastAPI backend for Excel parsing and dividend calculation.
3. Setup SQLite integration.
4. Develop Bicep scripts for Azure deployment.
5. Configure GitHub Actions for CI/CD.

---

Follow this README to initiate project development clearly and efficiently.
