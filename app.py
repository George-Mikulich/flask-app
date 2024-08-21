import os
import psycopg2
from flask import Flask, render_template, request, url_for, redirect

app = Flask(__name__)

@app.route('/')
def index():
    return "<h1 style='color:red'>HELL WORLD!</h1>"

@app.route('/secret')
def secret():
    return "<h1 style='color:green'>You found something</h1>"

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))
