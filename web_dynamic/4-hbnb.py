#!/usr/bin/python3
""" Starts a Flash Web Application """
from models import storage
from models.state import State
from models.city import City
from models.amenity import Amenity
from models.place import Place
from os import environ
from flask import Flask, render_template, jsonify
import uuid
app = Flask(__name__)
# app.jinja_env.trim_blocks = True
# app.jinja_env.lstrip_blocks = True


@app.teardown_appcontext
def close_db(error):
    """ Remove the current SQLAlchemy Session """
    storage.close()


@app.route('/4-hbnb', strict_slashes=False)
def hbnb():
    """ HBNB is alive! """
    # states = storage.all(State).values()
    # states = sorted(states, key=lambda k: k.name)
    # st_ct = []
    # # To avoid flask caching
    cache_id = uuid.uuid4()

    # for state in states:
    #     st_ct.append([state, sorted(state.cities, key=lambda k: k.name)])

    amenities = storage.all(Amenity).values()
    amenities = sorted(amenities, key=lambda k: k.name)

    # places = storage.all(Place).values()
    # places = sorted(places, key=lambda k: k.name)

    return render_template('4-hbnb.html',
                           amenities=amenities,
                           cache_id=cache_id)

    # return render_template('3-hbnb.html', cache_id=cache_id)




if __name__ == "__main__":
    """ Main Function """
    app.run(host='0.0.0.0', debug=True, port=5000)



def top_ten(subreddit):
  """
  Queries the Reddit API and prints titles of the top 10 hot posts of a subreddit.

  Args:
      subreddit: The name of the subreddit.
  """

  # Define the Reddit API endpoint and headers
  url = f"https://www.reddit.com/r/{subreddit}/hot/.json?limit=10"
  headers = {"User-Agent": "My Reddit Top Post Printer"}

  try:
    # Make the request without following redirects
    while True:
      response = requests.get(url, allow_redirects=False, headers=headers)

      # Check for successful response
      if response.status_code == 200:
        break  # Exit loop on success

      # Handle rate limiting
      elif response.status_code == 429:  # Too Many Requests
        wait_time = int(response.headers.get('Retry-After', 10))
        print(f"Rate limit reached, waiting {wait_time} seconds...")
        time.sleep(wait_time)

      # Handle other errors (consider logging details for debugging)
      else:
        raise Exception(f"Error: {response.status_code}")

    # Check for valid data before parsing
    data = response.json()
    if data.get("data", None) is None:
      print(f"Subreddit '{subreddit}' is invalid or not found.")
      return

    # Extract and print titles
    for post in data.get("data", {}).get("children", []):
      title = post.get("data", {}).get("title", None)
      if title:
        print(title)
      if len(data.get("data", {}).get("children", [])) == 10:
    
