#!/usr/bin/python3
"""
A start to manage starting up the application.
"""

from web_dynamic.routes import index_views

@index_views.route('/', strict_slashes=False)
def status():
    """
    A method to check the application status.
    """
    return "working"