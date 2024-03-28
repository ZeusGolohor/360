#!/usr/bin/python3
"""
A start to manage starting up the application.
"""

from web_dynamic.routes import index_views
from flask import render_template
import uuid
from models import storage
from models.place import Place


@index_views.route('/', strict_slashes=False)
def status():
    """
    A method to check the application status.
    """
    # # To avoid flask caching
    cache_id = uuid.uuid4()

    return render_template("index.html", cache_id=cache_id)


@index_views.route('/places/', strict_slashes=False)
def show_place(place_id=None):
    """
    A method to check the application status.
    """
    # # To avoid flask caching
    cache_id = uuid.uuid4()
    place = storage.get(Place, 'acccaba0-b063-4956-9c6a-2791c20d4af1')


    return render_template("show_place.html", cache_id=cache_id, place=place)