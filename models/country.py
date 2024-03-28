#!/usr/bin/python3
"""
A class to Countries associated with Places.
"""
import models
from models.base_model import BaseModel, Base
import sqlalchemy
from sqlalchemy import Column, String, ForeignKey

class Country(BaseModel, Base):
    """
    A method to Countries associated with Places.
    """
    if models.storage_t == 'db':
        __tablename__ = 'countries'
        name = Column(String(60), nullable=False)
        short_name = Column(String(60), nullable=False)
        code = Column(String(60), nullable=False)
    else:
        name = ""
        short_name = ""
        code = ""

    
    def __init__(self, *args, **kwargs):
        """initializes bookmarks"""
        super().__init__(*args, **kwargs)

    # use to set property when using file storage
    if models.storage_t != "db":
        @property
        def states(self):
            """getter for list of state instances related country"""
            from models import storage
            from models.state import State


            state_list = []
            all_states = storage.all(State)
            for state in all_states.values():
                if (state.country_id == self.id):
                    state_list.append(state)
            return (state_list)
