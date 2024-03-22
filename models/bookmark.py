#!/usr/bin/python3
"""
A class to save a place for a particular User.
"""
import models
from models.base_model import BaseModel, Base
import sqlalchemy
from sqlalchemy import Column, String, ForeignKey

class BookMark(BaseModel, Base):
    """
    A class to make a saved place(s)
    for a particular user.
    """
    if models.storage_t == 'db':
        __tablename__ = 'bookmarks'
        place_id = Column(String(60), ForeignKey('places.id'), nullable=False)
        user_id = Column(String(60), ForeignKey('users.id'), nullable=False)
    else:
        place_id = ""
        user_id = ""

    
    def __init__(self, *args, **kwargs):
        """initializes bookmarks"""
        super().__init__(*args, **kwargs)
