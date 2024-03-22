#!/usr/bin/python3
""" objects that handle all default RestFul API actions for BookMarks """
from models.bookmark import BookMark
from models.user import User
from models import storage
from api.v1.views import app_views
from flask import abort, jsonify, request, make_response


@app_views.route('/users/<user_id>/bookmarks/', methods=['GET'], strict_slashes=False)
def get_bookmarks(user_id=None):
    """
    A method to get bookmarks for a particular user.
    """
    if (user_id is not None):
        user = storage.get(User, user_id)
        if not user:
            return jsonify({"message": "user not found!"}), 404
        result = []
        # all_bookmarks = storage.all(BookMark)
        # getting bookmarks associated with this user. 
        all_bookmarks = user.bookmarks
        for bookmark in all_bookmarks:
            if (bookmark.user_id == user.id):
                result.append(bookmark.to_dict())
        return jsonify(result)
    else:
        return jsonify({"message": "A user id is required!"}), 404
    

@app_views.route('/users/<user_id>/bookmarks/', methods=['POST'], strict_slashes=False)
def create_bookmark(user_id=None):
    """
    Used to create a place bookmark for a particular user.
    """
    if (user_id is not None):
        user = storage.get(User, user_id)
        if not user:
            return jsonify({"message": "user not found!"}), 404
        if not request.get_json():
            abort(400, description="Not a JSON")
        if 'user_id' not in request.get_json():
            abort(400, description="Missing user id")
        if 'place_id' not in request.get_json():
            abort(400, description="Missing user id")

        # get the data sent from the front end.
        data = request.get_json()
        # creating the keys and values
        instance = BookMark(**data)
        instance.save()
        return make_response(jsonify(instance.to_dict()), 201)
        
    else:
        return jsonify({"message": "A user id is required!"}), 404


@app_views.route('/users/<user_id>/bookmarks/<bookmark_id>', methods=['DELETE'], strict_slashes=False)
def delete_bookmark(user_id=None, bookmark_id=None):
    """
    A method used to delete a bookmark for a specific user.
    """
    if (user_id is not None):
        user = storage.get(User, user_id)
        if not user:
            return jsonify({"message": "user not found!"}), 404
        bookmark = storage.get(BookMark, bookmark_id)
        if not bookmark:
            return jsonify({"message": "bookmark not found!"}), 404

        if (bookmark.user_id == user.id):
            # delete the instance
            storage.delete(bookmark)
            # save the changes
            storage.save()
            # respond with a success message
            return make_response(jsonify({"message": "deleted"}), 200)
        else:
            # Error
            return jsonify({"message": "bookmark not found!"}), 404
    else:
        # Error
        return jsonify({"message": "A user id is required!"}), 404
