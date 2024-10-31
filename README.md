# Chatbot Stock Exchange Project

## Objective
Create a chatbot that enables users to select any of 3 Stock Exchanges (LSEG, NASDAQ, NYSE) and for the selected exchange, provides 5 stocks that are traded in that exchange. Users can then select any one of those stocks to view the latest stock price.

## Directory Structure
```
/chatbot-app
├── chatbotapp.py
├── templates
│   ├── home.html
│   ├── stock_menu.html
│   ├── price.html
│   └── error.html
├── stock_data.json
├── Dockerfile
├── requirements.txt
├── terraform
│   ├── main.tf
│   ├── provider.tf
│   └── startup-script.sh
├── .github
│   └── workflows
│       └── terraform.yml
└── README.md
```

## Setup and Run
1. **Clone the repository:**
   ```sh
   git clone <repository-url>
   cd chatbot-app
   ```

2. **Install dependencies:**
   ```sh
   pip install -r requirements.txt
   ```

3. **Run the application:**
   ```sh
   python3 chatbotapp.py
   ```

4. **Access the application:** Open your browser and go to `http://localhost:5000`.

## As an additional step, this application has been containerized, pushed to my Docker Hub, and deployed on a GCP Compute Engine instance using Terraform and GitHub Actions CI.

## Docker Deployment
This application has been containerized using Docker. To build and run the Docker container locally:

1. **Build the Docker image:**
   ```sh
   docker build -t chatbot-app .
   ```

2. **Run the Docker container:**
   ```sh
   docker run -p 5000:5000 chatbot-app
   ```

3. **Access the application:** Open your browser and go to `http://localhost:5000`.


## Hosting on GCP
The application has been hosted on a Google Cloud Platform (GCP) Compute Engine instance. Infrastructure as Code (IaC) has been implemented using Terraform for deployment automation, with GitHub Actions managing continuous integration and deployment.

### Setup Instructions

1. **Clone the repository:**
   ```sh
   git clone <repository-url>
   cd chatbot-app
   ```
2. **Add Secret Variables on GitHub:**
   ```1. Go to Settings > Secrets and variables > Actions in your GitHub repository.
      2. Add a secret named GOOGLE_CREDENTIALS containing your GCP service account credentials in JSON format.
   ```
3. **Run the GitHub Actions Pipeline:**
   ```1. Push your changes to the main branch or manually trigger the GitHub Actions workflow.
      2. The pipeline will automatically initialize Terraform, provision the Compute Engine instance, and deploy the application.
   ```
2. **Access the Application:**
   ```1. Once the GitHub Actions workflow completes, note the external IP of the Compute Engine instance.
      2. Open your browser and go to http://<external-ip>:5000 to access the chatbot application.
   ```

## Application Navigation and Features

Once the application is up and running, follow these steps to navigate and check key features:

1. **Access the Home Menu:**
   - Open your browser and navigate to `http://<external-ip>:5000`.
   - The home page will display options for three stock exchanges: **LSEG**, **NASDAQ**, and **NYSE**.

2. **Stock Exchange Selection:**
   - Choose a stock exchange to view a list of five stocks associated with that exchange.
   - Each exchange displays unique stocks, enabling users to explore different market options.

3. **Viewing Stock Prices:**
   - Select any of the listed stocks to view its latest price.
   - Once a stock price is displayed, you have the option to navigate back to the Stock Menu to select another stock, or return to the Home Menu to choose a different exchange.
