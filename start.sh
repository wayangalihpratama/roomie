#!/bin/sh

pip install -r requirements.txt

python -m nltk.downloader punkt punkt_tab

# Start the Flask application
python app.py
