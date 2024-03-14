$(document).ready(function () {
  /*
   Load all amenities.
   */
  function checkAppStatus() {
    $.get("http://localhost:5001/api/v1/status/")
      .done(function (data, status) {
        if (status === "success" && data.status === "OK") {
          $("#api_status").css("background-color", "#ff545f");
          $("#api_status").addClass("available");
        }
      })
      .fail(function (sTXT, status, error) {
        $("#api_status").removeClass("available");
      });
  }
  /*
   filter amenities by clicks.
  */
  function filterAmenityByClicks() {
    // used to store amenities clicked on
    window.arr = {};
    // add events for when the check box is clicked
    $(".checkbox").click(function () {
      const el = $(this);
      // store clicked values
      const name = el[0].dataset.name.replace(/:/g, "");
      const id = el[0].dataset.id.replace(/:/g, "");
      // check if the amen was already added
      // if so add it else remove it.
      // if (window.arr.hasOwnProperty(id)) {
      console.log(Object.prototype.hasOwnProperty.call(window, "arr"));
      // check if window has property arr
      if (Object.prototype.hasOwnProperty.call(window, "arr")) {
        // ceheck if window.arr has property of id
        if (Object.prototype.hasOwnProperty.call(window.arr, id)) {
          delete window.arr[id];
        } else {
          window.arr[id] = name;
        }
      }
      // store objects to determine
      // if a comma should be added.
      const arrLen = Object.keys(window.arr).length;
      let i = 0;
      let str = "";
      // create the string to be added to the h4
      for (const value in window.arr) {
        if (i < 3) {
          str = str + window.arr[value];
        } else if (i === 3) {
          str = str + window.arr[value][0] + "...";
          break;
        }
        if (i + 1 < arrLen) {
          str = str + ", ";
        }
        i = i + 1;
      }
      // if no string add this.
      if (arrLen === 0) {
        $(".amenities h4").html("&nbsp;");
      } else {
        $(".amenities h4").text(str);
      }
      // Update UI based on amenities clicked
      amenityIDs = [];
      for (key in window.arr) {
        amenityIDs.push(key);
      }
      // console.log(amenityIDs);
      loadAllPlaces([], [], amenityIDs);
    });
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
    console.log("Loading amenities");
    console.log(JSON.stringify(requestData));
    // Making the AJAX POST request
    $.ajax({
      url: "http://localhost:5001/api/v1/places_search",
      type: "POST",
      contentType: "application/json",
      data: JSON.stringify(requestData),
      success: function (data, status) {
        console.log("Response:", data);
        // Handle the response data here
        if (data.length !== 0) {
          for (let key in data) {
            console.log(data[key]);
            place = data[key];
            let newEl = `
          <article class="left">
          <div class="title_box">
          <h2>${place.name}</h2>
          <div class="price_by_night">$${place.price_by_night}</div>
          </div>
          <div class="information">
          <div class="max_guest">${place.max_guest} Guest${
              place.max_guest != 1 ? `s` : ""
            }</div>
          <div class="number_rooms">${place.number_rooms} Bedroom${
              place.number_rooms != 1 ? `s` : ""
            }</div>
          <div class="number_bathrooms">${place.number_bathrooms} Bathroom${
              place.number_bathrooms != 1 ? `s` : ""
            }</div>
          </div>
          <div class="description">
          ${place.description}
          </div>
          </article>
          `;
            $(".places").append(newEl);
          }
        } else {
          // let newEl = `
          // <article class="left">
          // fake
          // </article>
          // `;
          // $(".places").append(newEl);
          console.log("runnig");
          $("section .places").css("display", "none");
        }
      },
      error: function (xhr, status, error) {
        console.error("Error:", error);
        // Handle errors here
      },
    });
  }
  /* 
    apply filters
  */
  // functions to call on load
  checkAppStatus();
  filterAmenityByClicks();
  loadAllPlaces();
});
