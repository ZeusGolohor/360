#!/usr/bin/python3
"""
Script to manage places.
"""

from web_dynamic.routes import place_views
from flask import render_template
import uuid
from models import storage
from models.place import Place
from os import getenv


@place_views.route('/', strict_slashes=False)
@place_views.route('/', strict_slashes=False)
def status():
    """
    A method to check the application status.
    """
    # # To avoid flask caching
    cache_id = uuid.uuid4()

    return render_template("/places/all_places.html", cache_id=cache_id)


@place_views.route('/places', strict_slashes=False)
def all_place():
    """
    A method all available places.
    """
    # # To avoid flask caching
    cache_id = uuid.uuid4()


    return render_template("/places/show_place.html", cache_id=cache_id)


@place_views.route('/places/<place_id>', strict_slashes=False)
def show_place(place_id=None):
    """
    A method all available places.
    """
    # # To avoid flask caching
    cache_id = uuid.uuid4()
    if (place_id is not None):
        place = storage.get(Place, place_id)
        if (place):
            return render_template("/places/show_place.html", cache_id=cache_id, place=place)
        
    return render_template("404.html", cache_id=cache_id)


@place_views.route('/places/create', strict_slashes=False)
def create_place():
    """
    A method all available places.
    """
    # # To avoid flask caching
    cache_id = uuid.uuid4()


    return render_template("/places/create_place.html", cache_id=cache_id)