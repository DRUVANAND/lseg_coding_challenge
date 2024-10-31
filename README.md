# Stock Exchange Chatbot

## Project Overview:
This is a Flask-based chatbot application that allows users to select a stock exchange (LSEG, NASDAQ, or NYSE), view top 5 stocks from that exchange, and check their latest prices.

## Features:
- Home menu with 3 stock exchanges (LSEG, NASDAQ, NYSE).
- Stock menu displays 5 stocks for the selected exchange.
- Displays the current price of the selected stock.
- Option to navigate back to the home or stock menu.

## How to Run Locally:
1. Clone this repository:
    ```bash
    git clone https://github.com/your-repo/chatbot-app.git
    cd chatbot-app
    ```

2. Install the required dependencies:
    ```bash
    pip install -r requirements.txt
    ```

3. Run the Flask application:
    ```bash
    python app.py
    ```

4. Open `http://127.0.0.1:5000` in your browser to interact with the chatbot.

## Docker Instructions:
1. Build the Docker image:
    ```bash
    docker build -t chatbot-app .
    ```

2. Run the Docker container:
    ```bash
    docker run -d -p 5000:5000 chatbot-app
    ```

3. Open `http://127.0.0.1:5000` in your browser.

## Terraform Deployment to GCP:
1. Ensure you have Terraform installed and GCP credentials set up.

2. Run the Terraform commands:
    ```bash
    terraform init
    terraform apply -auto-approve
    ```

## GitLab CI Pipeline:
1. Set up the GitLab CI pipeline by adding `.gitlab-ci.yml` to your repo.
2. The pipeline will build the Docker image, push it to Google Container Registry (GCR), and deploy it using Terraform.

## Error Handling:
- The app handles missing or malformed JSON files gracefully and provides a "not found" message for invalid stock codes or exchanges.

## Optional Enhancements:
- Add real-time stock price updates using stock market APIs like Alpha Vantage or Yahoo Finance.
- Improve UI with CSS or integrate with a chatbot service like Dialogflow.
