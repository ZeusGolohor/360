from flask import Flask
from flask_adminlte3 import AdminLTE, themes


app = Flask(__name__)
app.config['SECRET_KEY'] = 'your_secret_key'

admin = AdminLTE(app, themes.AdminLTE3Theme())

# ... your Flask app routes and logic here ...

if __name__ == '__main__':
    app.run(debug=True)
