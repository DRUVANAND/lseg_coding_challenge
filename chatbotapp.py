import os
from flask import Flask, render_template, jsonify, abort
import json

app = Flask(__name__)

# Load stock data from JSON with error handling
stock_data = {}

try:
    if os.path.exists('stock_data.json'):
        with open('stock_data.json') as f:
            stock_data = json.load(f)
            if not stock_data:
                print("Warning: stock_data.json is empty")
    else:
        print("Error: stock_data.json not found")
except json.JSONDecodeError:
    print("Error: Failed to parse stock_data.json. The file may be corrupted or improperly formatted.")
except Exception as e:
    print(f"Unexpected error occurred while loading stock data: {e}")

@app.route('/')
def home_menu():
    return render_template('home.html')

@app.route('/stocks/<exchange>', methods=['GET'])
def stock_menu(exchange):
    print(f"Attempting to access stocks for exchange: {exchange}")
    if exchange in stock_data:
        stocks = stock_data[exchange].get('topStocks', [])
        if not stocks:
            return "No stocks found for this exchange", 404
        return render_template('stock_menu.html', stocks=stocks, exchange=exchange)
    return render_template('error.html', message=f"Exchange '{exchange}' not found."), 404

@app.route('/price/<exchange>/<stock_code>', methods=['GET'])
def stock_price(exchange, stock_code):
    print(f"Attempting to access stock: {stock_code} in {exchange}")
    if exchange in stock_data:
        stocks = stock_data[exchange].get('topStocks', [])
        stock = next((s for s in stocks if s['code'] == stock_code), None)
        if stock:
            return render_template('price.html', stock=stock, exchange=exchange)
        return render_template('error.html', message=f"Stock '{stock_code}' not found in '{exchange}'."), 404
    return render_template('error.html', message=f"Exchange '{exchange}' not found."), 404

@app.errorhandler(500)
def internal_error(error):
    return render_template('error.html', message="An unexpected error occurred. Please try again later."), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
