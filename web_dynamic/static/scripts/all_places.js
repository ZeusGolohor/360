$(document).ready(function () {
  console.log("about to load places");
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
      url: "http://localhost:5001/api/v1/places_search",
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
                    <img class="d-block w-100" src="../static/images/dark-color-interiors-1200x520.jpg?{{ cache_id}}" alt="First slide">
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100" src="../static/images/spiderman-001.jpg?{{ cache_id}}" alt="Second slide">
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100" src="../static/images/edyta-and-co-layout-1549663065.jpg?{{ cache_id}}" alt="Third slide">
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
                <!-- <i class="nav-icon fas fa-star text-danger"></i> -->
                </div>
                <div class="col-12">
                    <p>${place.number_rooms} bedroom${
              place.number_rooms != 1 ? `s` : ""
            } </p>
                </div>
            </div>
            <div class="col-6 text-center">
                <div class="col-12">
                <!-- <i class="nav-icon fas fa-star text-danger"></i> -->
                </div>
                <div class="col-12">
                <p>${place.number_bathrooms} bathroom${
              place.number_bathrooms != 1 ? `s` : ""
            } </p>
                </div>
            </div>
          <!--  <div class="col-6 text-center">
                <div class="col-12">
                <i class="nav-icon fas fa-star text-danger"></i>
                </div>
                <div class="col-12">
                    <p>text</p>
                </div>
            </div>
            <div class="col-6 text-center">
                <div class="col-12">
                <i class="nav-icon fas fa-star text-danger"></i>
                </div>
                <div class="col-12">
                    <p>text</p>
                </div>
            </div> -->
            </div>
            <div class="row">
            <div class="col-6">
            <!-- <i class="nav-icon fas fa-star text-danger"></i> -->
            <h3>$ 250,000.00</h3>
            </div>
            <div class="col-6">
            <a href="#" class="btn btn-info float-right">View Property</a>
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
});
