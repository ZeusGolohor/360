#!/usr/bin/python3
"""
Script to manage property.
"""

from web_dynamic.routes import admin_views
from flask import render_template
import uuid
from models import storage
from models.user import User
from os import getenv

@admin_views.route('/admin/properties/new', strict_slashes=False)
def add_property():
    """
    A method to handle user login.
    """
    # # To avoid flask caching
    cache_id = uuid.uuid4()

    return render_template("/admin/add_property.html", cache_id=cache_id)
