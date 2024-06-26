#!/usr/bin/python3
""" Flask Application """
from models import storage
from api.v1.views import app_views
from os import environ
from flask import Flask, render_template, make_response, jsonify
from flask_cors import CORS
from flasgger import Swagger
from flasgger.utils import swag_from

app = Flask(__name__)
app.config['JSONIFY_PRETTYPRINT_REGULAR'] = True
app.register_blueprint(app_views)
# cors = CORS(app, resources={r"/*": {"origins": "0.0.0.0"}})
CORS(app, resources={r"/api/v1/*": {"origins": "*"}})


@app.teardown_appcontext
def close_db(error):
    """ Close Storage """
    storage.close()


# @app.route('/3-hbnb/', strict_slashes=False)
# def get_places():
#     """
#     A method to check app status.
#     """
#     return (jsonify({"status": "OK"}), 200)


@app.errorhandler(404)
def not_found(error):
    """ 404 Error
    ---
    responses:
      404:
        description: a resource was not found
    """
    return make_response(jsonify({'error': "Not found"}), 404)


app.config['SWAGGER'] = {
    'title': 'RentHubMedia',
    'uiversion': 3
}

Swagger(app)


if __name__ == "__main__":
    """ Main Function """
    host = environ.get('API_HOST')
    port = environ.get('API_PORT')
    if not host:
        host = '0.0.0.0'
    if not port:
        port = '5001'
    app.run(host=host, port=port, threaded=True, debug=True)
