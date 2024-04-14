$(document).ready(function () {
  console.log("Loading User");
  const show_place_id = document.getElementById("show_place_id").value;
  console.log(show_place_id);
  /* 
    Loading User who posted the place.
    */
  function loader() {
    console.log("loading show place");
    console.log(window.location.href);
    let requestData = {
      url: show_place_id,
    };
    $.ajax({
      url: `http://localhost:5001/api/v1/places/${show_place_id}`,
      type: "GET",
      contentType: "application/json",
      data: JSON.stringify(requestData),
      success: function (data, status) {
        // remove the loading page information and show the property.
        $("#loading").addClass("d-none");
        $("#show_place").removeClass("d-none");
        $("#not_found").addClass("d-none");
        console.log(data);
        // dynamically create the page.
        let newEl = `
        <div class="row">
            <div class="col-sm-0 col-lg-2"></div> <!-- col-sm-0 -->
                <div class="col-sm-12 col-lg-8">
                    <div class="card">
                        <div id="place_${
                          data[0].id
                        }" class="carousel slide" data-ride="false">
                            <ol class="carousel-indicators">
                                <li data-target="#place_${
                                  data[0].id
                                }" data-slide-to="0" class="active"></li>
                                <li data-target="#place_${
                                  data[0].id
                                }" data-slide-to="1"></li>
                                <li data-target="#place_${
                                  data[0].id
                                }" data-slide-to="2"></li>
                            </ol> <!-- carousel-indicators -->
                            <div class="carousel-inner place_list_img2">
                                <div class="carousel-item active">
                                    <img class="d-block w-100 show_place_img" src="../static/images/dark-color-interiors-1200x520.jpg?{{ cache_id}}" alt="First slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100 show_place_img" src="../static/images/spiderman-001.jpg?{{ cache_id}}" alt="Second slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100 show_place_img" src="../static/images/edyta-and-co-layout-1549663065.jpg?{{ cache_id}}" alt="Third slide">
                                </div>
                            </div> <!-- carousel-inner -->
                            <!-- left and right navigation button -->
                                <a class="carousel-control-prev" href="#place_${
                                  data[0].id
                                }" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#place_${
                                  data[0].id
                                }" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            <!-- left and right navigation button -->
                            </div>
                            <div class="card-body">
                                <h5 class="card-title ft-500">${
                                  data[0].name
                                }</h5>
                                <p class="card-text">${data[0].description}</p>
                                <div class="row">
                                    <!-- bedrooms -->
                                    <div class="col-6 text-center">
                                    <div class="col-12">
                                        <i class="fas fa-lg fa-solid fa-bed"></i>
                                    </div>
                                    <div class="col-12">
                                        <p>${data[0].number_rooms} Bedroom${
          data[0].number_rooms !== 1 ? `s` : ""
        }</p>
                                    </div>
                                    </div>
                                    <!-- bedrooms -->
                                    <!-- bathrooms -->
                                    <div class="col-6 text-center">
                                    <div class="col-12">
                                        <i class="fas fa-lg fa-solid fa-shower"></i>
                                    </div>
                                    <div class="col-12">
                                        <p>${
                                          data[0].number_bathrooms
                                        } Bathroom${
          data[0].number_bathrooms !== 1 ? `s` : ""
        }</p>
                                    </div>
                                    </div>
                                    <!-- bathrooms -->
                                </div>
                                <div class="row">
                                    <!-- amount -->
                                    <div class="col-6">
                                    <h3>₦ ${data[0].price_by_night}</h3>
                                    </div>
                                    <!-- amount -->
                                    <!-- poster -->
                                    <div class="col-6">
                                        <div class="row text-right">
                                        <div class="col-12">
                                                <p>Posted by</p>
                                            </div>
                                            <div id="add_user" class="col-12 text-right">
                                                <p>${data[1].first_name} ${
          data[1].last_name
        }</p>
                                                <p>${data[1].email}</p>
                                                <p>${data[1].created_at}</p>
                                            </div>
                                        </div>
                                    <!-- poster -->
                                    </div>
                                </div>
                            </div> <!-- card-body -->
                    </div> <!-- card -->
                </div> <!-- col-sm-12 -->
            <div class="col-sm-0 col-lg-2"></div> <!-- col-sm-0 -->
        </div> <!-- row -->
        `;
        $("#show_place").append(newEl);
      },
      error: function (xhr, status, error) {
        console.error(error);
        // show the error message
        $("#loading").addClass("d-none");
        $("#show_place").addClass("d-none");
        $("#not_found").removeClass("d-none");
      },
    });
  }
  /* functions to run once this script gets loaded */
  loader();
});
