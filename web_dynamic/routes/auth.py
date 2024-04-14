#!/usr/bin/python3
"""
Script to manage auth.
"""

from web_dynamic.routes import auth_views
from flask import render_template
import uuid
from models import storage
from models.user import User
from os import getenv


@auth_views.route('/login', strict_slashes=False)
def login():
    """
    A method to handle user login.
    """
    # # To avoid flask caching
    cache_id = uuid.uuid4()

    return render_template("/auths/login.html", cache_id=cache_id)


@auth_views.route('/register', strict_slashes=False)
def register():
    """
    A method to handle user registration.
    """
    # # To avoid flask caching
    cache_id = uuid.uuid4()

    return render_template("/auths/register.html", cache_id=cache_id)


@auth_views.route('/forgot-password', strict_slashes=False)
def forgot_passsword():
    """
    A method to handle user registration.
    """
    # # To avoid flask caching
    cache_id = uuid.uuid4()

    return render_template("/auths/forgot-password.html", cache_id=cache_id)



@auth_views.route('/recover-password', strict_slashes=False)
def recover_passsword():
    """
    A method to handle user registration.
    """
    # # To avoid flask caching
    cache_id = uuid.uuid4()

    return render_template("/auths/recover-password.html", cache_id=cache_id)