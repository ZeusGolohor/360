#!/usr/bin/python3
"""
A script to handle RestFul API actions to countries
"""
from models.country import Country
from models import storage
from api.v1.views import app_views
from flask import abort, jsonify, make_response, request


@app_views.route('/countries', methods=["GET"], strict_slashes=False)
def get_countries():
    """
    A method to retrieve country objects
    """
    all_coutries = storage.all(Country)
    list_countries = []
    for country in list_countries.values():
        list_countries.append(country)
    return jsonify(list_countries)


@app_views.route('/countries/<country_id', methods=['GET'], strict_slashes=False)
def get_country_by_id(country_id=None):
    """
    A method to retrieve a specific country.
    """
    if (country_id == None):
        return (jsonify({"message": "Country not found!"}), 404)
    country = storage.get(Country, country_id)
    if not country:
        return (jsonify({"message": "Country not found!"}), 404)
    
    return (jsonify(country.to_dict()))


@app_views.route('/country', methods=['POST'], strict_slases=False)
def create_country():
    """
    A method use to create a new country.
    """
    if not request.get_json():
        abort(400, description="Not a JSON")

    if 'name' not in request.get_json():
        abort(400, description="Missing name")
    if 'code' not in request.get_json():
        abort(400, description="Missing country code")
    if 'short_name' not in request.get_json():
        abort(400, description="Missing country short name")
    
    data = request.get_json()
    instance = Country(**data)
    instance.save()
    return make_response(jsonify(instance.to_dict()), 201)