from dotenv import load_dotenv
from waitress import serve
import app
import os
import sys

load_dotenv()
PORT = os.environ.get("PORT")

print('APP RUNNING - PORT:',PORT, file=sys.stdout)
serve(app.app, host='0.0.0.0', port=PORT)