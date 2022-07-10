# k8s-cicd-python-flask

## clone the project
```bash
git clone https://github.com/toggit/k8s-cicd-python-flask.git
```

## setup python flask project

```bash
## Create a new virtualenv named "venv"

## Python 3.3+
python -m venv venv

# Python pre 3.3
virtualenv venv
#New python executable in myproject/bin/python
#Installing setuptools, pip, wheel...done.

## Activate the virtualenv (OS X & Linux)
source venv/bin/activate

# Activate the virtualenv (Windows)
venv\Scripts\activate

python -m pip install --upgrade pip
# Install python Flask
pip install flask pytest
# create `requirement.txt` file
pip freeze > requirements.txt
# install dependencies from requirement.txt file
pip install -r requirements.txt

mkdir app
mkdir test

echo "" > app/app.py
echo "" > test/pytest.py

echo "FLASK_APP=src/app" > .env
echo "FLASK_ENV=development" > .env

```

## python flask hello world example
```python

#  python flask hello world
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
  return "Hello World!"

if __name__ == "__main__":
  app.run()
```

