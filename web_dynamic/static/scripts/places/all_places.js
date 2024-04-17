$(document).ready(function () {
  // setting the url for api calls
  const url = "http://localhost:5001";
  const url2 = "http://localhost:5000";
  console.log("about to load places");
  // used to load the user
  function loadUser(user) {
    if (user) {
      // console.log(user);
      $("#user_info").empty();
      let newEl = `
      <a href="#" class="d-block">${user.first_name} ${user.last_name}</a>
      `;
      $("#user_info").append(newEl);
    }
  }
  /*
   load all places
   Data to be sent in the request body.
   */
  function loadAllPlaces(data1 = [], data2 = [], data3 = []) {
    let requestData = {
      states: data1,
      cities: data2,
      // Add amenities if needed
      amenities: data3,
    };
    console.log("Loading Places");
    $.ajax({
      url: `${url}/api/v1/places_search`,
      type: "POST",
      contentType: "application/json",
      data: JSON.stringify(requestData),
      success: function (data, status) {
        $("#no_places").addClass("d-none");
        $("#show_places").removeClass("d-none");
        // console.log(data);
        // Handle the response
        if (data.length !== 0) {
          for (let key in data) {
            // console.log(data[key]);
            let place = data[key];
            let newEl = `
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 col-xl-4">
            <div class="card">
            <div id="place_${
              place.id
            }" class="carousel slide" data-ride="false">
            <ol class="carousel-indicators">
            <li data-target="#place_${
              place.id
            }" data-slide-to="0" class="active"></li>
            <li data-target="#place_${place.id}" data-slide-to="1"></li>
            <li data-target="#place_${place.id}" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner place_list_img">
                  <div class="carousel-item active">
                    <img class="d-block w-100 all_place_img" src="../static/images/black-and-white-living-room.jpg?{{ cache_id}}" alt="First slide">
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100 all_place_img" src="../static/images/dark-color-interiors-1200x520.jpg?{{ cache_id}}" alt="Second slide">
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100 all_place_img" src="../static/images/edyta-and-co-layout-1549663065.jpg?{{ cache_id}}" alt="Third slide">
                  </div>
                </div>
                <a class="carousel-control-prev" href="#place_${
                  place.id
                }" role="button" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#place_${
                  place.id
                }" role="button" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="card-body">
            <h5 class="card-title ft-500">${place.name}</h5>
            <p class="card-text">${place.description}</p>
            <div class="row">
            <div class="col-6 text-center">
                <div class="col-12">
                <i class="fas fa-lg fa-solid fa-bed"></i>
                </div>
                <div class="col-12">
                    <p>${place.number_rooms} bedroom${
              place.number_rooms != 1 ? `s` : ""
            } </p>
                </div>
            </div>
            <div class="col-6 text-center">
                <div class="col-12">
                <i class="fas fa-lg fa-solid fa-shower"></i>
                </div>
                <div class="col-12">
                <p>${place.number_bathrooms} bathroom${
              place.number_bathrooms != 1 ? `s` : ""
            } </p>
                </div>
            </div>
            </div>
            <div class="row">
            <div class="col-6">
            <!-- <i class="nav-icon fas fa-star text-danger"></i> -->
            <h5>₦${place.price_by_night}</h5>
            </div>
            <div class="col-6">
            <a href="${url2}/places/${
              place.id
            }" class="btn btn-info float-right">View Property</a>
            </div>
            </div>
            <div class="row">
            <div class="col-4">
            <i class="nav-icon fas fa-star text-danger"></i>
            </div>
            <div class="col-8 text-right">
            <p>Posted at: ${place.created_at}</p>
            </div>
            </div>
            </div>
            </div>
            </div>
            `;
            $("#show_places").append(newEl);
          }
        }
      },
    });
  }
  loadAllPlaces();
  // localStorage.clear();
  loadUser(JSON.parse(localStorage.getItem("user")));
});
