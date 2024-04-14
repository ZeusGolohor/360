#!/usr/bin/python3
"""
A script used to create blueprints
"""
from flask import Blueprint

# List of routes
place_views = Blueprint("place_views", __name__, url_prefix="/")
country_view = Blueprint("country_view", __name__, url_prefix="/")
auth_views = Blueprint("auth_views", __name__, url_prefix="/")
admin_views = Blueprint("admin_views", __name__, url_prefix="/")

from web_dynamic.routes.place import *
from web_dynamic.routes.country import *
from web_dynamic.routes.auth import *
from web_dynamic.routes.admin.property import *
