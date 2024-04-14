#!/usr/bin/python3
""" objects that handle all default RestFul API actions for Login """
from models.user import User
from models import storage
from api.v1.views import app_views
from flask import abort, jsonify, make_response, request


@app_views.route('/auths/login', methods=['POST'], strict_slashes=False)
def login():
    """
    Used to log a user into the app.
    """
    # checking if user exit in the database.
    users = storage.all(User);
    for key, value in users.items():
        print(value)
    
    return jsonify(["login working"])


@app_views.route('/auths/register', methods=['GET'], strict_slashes=False)
def register():
    """
    Used to register a new user into the app.
    """
    
    return jsonify(["registration working"])