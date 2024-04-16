$(document).ready(function () {
  console.log("Loading property page");
  const show_place_id = document.getElementById("show_place_id").value;
  // console.log(show_place_id);
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
    Loading User who posted the place.
    and the property.
    */
  function index() {
    let requestData = {
      url: show_place_id,
    };
    $.ajax({
      url: `http://localhost:5001/api/v1/places/${show_place_id}`,
      type: "GET",
      contentType: "application/json",
      data: JSON.stringify(requestData),
      success: function (data, status) {
        // console.log(data);
        // remove the loading page information and show the property.
        $("#loading").addClass("d-none");
        $("#loading_error").addClass("d-none");
        $("#loaded").removeClass("d-none");
        // dynamically create the page.
        let newEl = `
        <div class="card-body">
          <div class="row">
            <div class="col-12 col-sm-6">
              <h3 class="d-inline-block d-sm-none">${data[0].name} Review</h3>
              <div class="col-12">
                <img src="../static/images/black-and-white-living-room.jpg" class="product-image" alt="Product Image">
              </div> <!-- <div class="col-12"> -->
              <div class="col-12 product-image-thumbs">
                <div class="product-image-thumb active"><img src="../static/images/black-and-white-living-room.jpg" alt="Product Image"></div>
                <div class="product-image-thumb" ><img src="../static/images/dark-color-interiors-1200x520.jpg" alt="Product Image"></div>
                <div class="product-image-thumb" ><img src="../static/images/edyta-and-co-layout-1549663065.jpg" alt="Product Image"></div>
                
              </div> <!-- <div class="col-12 product-image-thumbs"> -->
            </div> <!-- <div class="col-12 col-sm-6"> -->
            <div class="col-12 col-sm-6">
              <h3 class="my-3">${data[0].name}</h3>
              <p>${data[0].description}</p>
              <hr>
              <h4>Available Amenities</h4>
              <div class="btn-group btn-group-toggle" data-toggle="buttons">
                <label class="btn btn-default text-center active">
                  <input type="radio" name="color_option" id="color_option_a1" autocomplete="off" checked>
                  Wifi
                  <br>
                  <i class="fas fa-lg fa-solid fa-wifi"></i>
                </label>
                <label class="btn btn-default text-center">
                  <input type="radio" name="color_option" id="color_option_a2" autocomplete="off">
                  Air Condition
                  <br>
                  <i class="fas fa-lg fa-solid fa-box"></i>
                </label>
                <label class="btn btn-default text-center">
                  <input type="radio" name="color_option" id="color_option_a3" autocomplete="off">
                  Garage
                  <br>
                  <i class="fas fa-lg fa-solid fa-car"></i>
                </label>
              </div> <!-- <div class="btn-group btn-group-toggle" data-toggle="buttons"> -->
              <h4 class="mt-3">Structure</h4>
              <div class="btn-group btn-group-toggle" data-toggle="buttons">
                  <label class="btn btn-default text-center">
                    <input type="radio" name="color_option" id="color_option_b1" autocomplete="off">
                    <span class="text-xl"><i class="fas fa-lg fa-solid fa-bed"></i></span>
                    <br>
                    ${data[0].number_rooms} Bedroom${
          data[0].number_rooms !== 1 ? `s` : ""
        }
                  </label>
                  <label class="btn btn-default text-center">
                    <input type="radio" name="color_option" id="color_option_b2" autocomplete="off">
                    <span class="text-xl"><i class="fas fa-lg fa-solid fa-shower"></i></span>
                    <br>
                    ${data[0].number_bathrooms} Bathroom${
          data[0].number_bathrooms !== 1 ? `s` : ""
        }
                  </label>
              </div> <!-- <div class="btn-group btn-group-toggle" data-toggle="buttons"> -->
              <div class="bg-gray py-2 px-3 mt-4">
                  <h2 class="mb-0">
                      ₦${data[0].price_by_night}
                  </h2>
                  <h4 class="mt-0">
                    <small>Ex Tax: ₦0.00 </small>
                  </h4>
              </div> <!-- <div class="bg-gray py-2 px-3 mt-4"> -->
              <div class="mt-4">
                <div class="btn btn-success btn-lg btn-flat">
                  <i class="fas fa-money-bill fa-lg mr-2"></i>
                  Rent
                </div>

                <div class="btn btn-default btn-lg btn-flat">
                  <i class="fas fa-heart fa-lg mr-2"></i>
                  Add to Wishlist
                </div>
              </div> <!-- <div class="mt-4"> -->
              <!-- User who posted the property -->
              <h4 class="mt-3">Posted by</h4>
              <div class="btn-group btn-group-toggle">
                <div class="row">
                    <div class="col-3">
                        <img src="../static/dist/img/user2-160x160.jpg?{{ cache_id}}" class="img-circle elevation-2 post_user_img" alt="User Image">
                    </div>
                    <div class="col-1"></div>
                    <div class="col-8 post_user_details">
                        <p>${data[1].first_name} ${data[1].last_name}</p>
                        <p>${data[1].email}</p>
                    </div>
                </div>
              </div> <!-- <div class="btn-group btn-group-toggle"> -->
              <!-- User who posted the property -->
            </div> <!-- <div class="col-12 col-sm-6"> -->
          </div> <!-- <div class="row"> -->
          <div class="row mt-4">
            <nav class="w-100">
              <div class="nav nav-tabs" id="product-tab" role="tablist">
                <a class="nav-item nav-link active" id="product-desc-tab" data-toggle="tab" href="#product-desc" role="tab" aria-controls="product-desc" aria-selected="true">Description</a>
                <a class="nav-item nav-link" id="product-reviews-tab" data-toggle="tab" href="#product-reviews" role="tab" aria-controls="product-reviews" aria-selected="false">Reviews</a>
                <a class="nav-item nav-link" id="product-video-tab" data-toggle="tab" href="#product-video" role="tab" aria-controls="product-video" aria-selected="false">Video</a>
              </div>
            </nav>
            <div class="tab-content p-3" id="nav-tabContent">
              <div class="tab-pane fade show active" id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab">
                ${data[0].description}
              </div>
              <div class="tab-pane fade" id="product-reviews" role="tabpanel" aria-labelledby="product-reviews-tab">
                <p>No reviews yet.</p>
              </div>
              <div class="tab-pane fade" id="product-video" role="tabpanel" aria-labelledby="product-video-tab">
                <p>No video yet.</p>
              </div>
            </div>
          </div> <!-- <div class="row mt-4"> -->

        </div> <!-- <div class="card-body"> -->
        `;
        $("#loaded").append(newEl);
        // for selecting the product image to display
        $(".product-image-thumb").on("click", function () {
          var $image_element = $(this).find("img");
          $(".product-image").prop("src", $image_element.attr("src"));
          $(".product-image-thumb.active").removeClass("active");
          $(this).addClass("active");
        });
      },
      error: function (xhr, status, error) {
        // show error message
        $("#loading").addClass("d-none");
        $("#loading_error").removeClass("d-none");
        $("#loaded").addClass("d-none");
      },
    });
  }
  /* functions to run once this script gets loaded */
  index();
  // localStorage.clear();
  loadUser(JSON.parse(localStorage.getItem("user")));
});
