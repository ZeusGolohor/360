#!/usr/bin/python3
"""
A script used to create blueprints
"""
from flask import Blueprint

# List of routes
index_views = Blueprint("index_views", __name__, url_prefix="/")
country_view = Blueprint("country_view", __name__, url_prefix="/")

from web_dynamic.routes.index import *
from web_dynamic.routes.country import *
