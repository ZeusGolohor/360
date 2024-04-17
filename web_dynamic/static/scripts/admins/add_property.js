#!/usr/bin/javascript
$(document).ready(function () {
  // setting the url for api calls
  const url = "http://localhost:5001";
  let formData = {};
  formData["errors"] = false;
  formData["loaded"] = false;
  formData["name"] = $("#name").val();
  formData["description"] = $("#description").val();
  formData["state"] = $("#state").val();
  formData["city"] = $("#city").val();
  formData["number_rooms"] = $("#number_rooms").val();
  formData["number_bathrooms"] = $("#number_bathrooms").val();
  formData["price_by_night"] = $("#price_by_night").val();
  formData["user_id"] = "1234";

  //  fuctions
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
  // Used to clear old form errors.
  function clear_previous_errors(formData) {
    for (let key in formData) {
      $(`#${key}_error`).empty();
    }
  }
  //   used to add new data to the database
  function create_property() {
    formData["errors"] = "false";
    clear_previous_errors(formData);
    check_len_0(formData);
    console.log(formData["errors"]);
    if (formData["errors"] === "false") {
      let requestData = {
        states: "State",
        cities: "city",
        // Add amenities if needed
        amenities: "amenity",
      };
      console.log(JSON.parse(localStorage.getItem("formData")));
      //creating the new property
      $.ajax({
        url: `${url}/api/v1/cities/${formData["city"]}/places`,
        type: "POST",
        contentType: "application/json",
        // "Access-Control-Allow-Origin": "*",
        data: JSON.stringify({
          user_id: "1aeb6fe0-4b11-48df-aff6-3dc83a6fece3",
          city_id: "5ff38ea0-20d9-4947-9031-c1f3ad16892c",
          name: formData["name"],
          description: formData["description"],
          state: formData["state"],
          city: formData["city"],
          number_rooms: formData["number_rooms"],
          number_bathrooms: formData["number_bathrooms"],
          // price_by_night: formData["price_by_night"],
          price_by_night: Number(formData["price_by_night"]),
          max_guest: 0,
          latitude: 0,
          longitude: 0,
        }),
        success: function (data, status) {
          console.log(data);
        },
        error: function (xhr, status, error) {
          console.error(error);
        },
      });
    }
  }
  //   used to update fields
  function updateFormData(key, value) {
    formData[key] = value;
    storeFormData();
  }
  //   binding all form input to the store
  function bind(formData) {
    for (key in formData) {
      //   getting all form fields
      $(".form-control").on("focus", function () {
        // switching off all fields
        $(".form-control").off("input");
        // focusing on currently filled field
        $(this).on("input", function () {
          const name = $(this).attr("name");
          const value = $(this).val();
          updateFormData(name, value);
        });
      });
    }
  }
  //   used for loading cites based on a selected state
  function loadCities(state_id = null) {
    if (state_id === null) {
      return;
    }
    $.ajax({
      url: `${url}/api/v1/states/${state_id}/cities`,
      type: "GET",
      contentType: "application/json",
      data: "",
      success: function (data, status) {
        if (data.length === 0) {
          $("#city").empty();
          let newEl = `
          <option selected disabled>Select a city</option>
          <option disabled class="bg-danger">No cities in selected state</option>
        `;
          $("#city").append(newEl);
        } else {
          $("#city").empty();
          let newEl = `
          <option selected disabled>Select a city</option>
        `;
          $("#city").append(newEl);
          for (let key in data) {
            state = data[key];
            let newEl = `
              <option name="${state.name}" value="${state.id}">${state.name}</option>
          `;
            $("#city").append(newEl);
          }
        }
      },
      error: function (xhr, status, error) {
        console.error(error);
      },
    });
  }
  // used for loading state options
  function loadStates(data = null) {
    if (data === null) {
      return;
    }
    if (data["loaded"] === "false") {
      // loading all states
      $.ajax({
        url: "${url}/api/v1/states",
        type: "GET",
        contentType: "application/json",
        data: "",
        success: function (data, status) {
          // Handle the response data here
          if (data.length !== 0) {
            $("#state").empty();
            let newEl = `
                <option selected disabled>Select a state</option>
            `;
            $("#state").append(newEl);
            for (let key in data) {
              state = data[key];
              let newEl = `
                <option name="${state.name}" value="${state.id}">${state.name}</option>
            `;
              $("#state").append(newEl);
            }
          }
        },
        error: function (xhr, status, error) {
          console.log(error);
        },
      });
      //   updating state field to loaded
      data["loaded"] = "true";
    }
  }
  //   Setting up all events
  function load_events() {
    $("#submitForm").click(function (event) {
      create_property();
    });
    $("#state").click(function (event) {
      const el = $(this);
      loadStates(el[0].dataset);
    });
    // used to clear form
    $("#clearForm").click(function (event) {
      localStorage.removeItem("formData");
      location.reload();
    });
    // $("#city").click(function (event) {
    //   console.log("city button click");
    // });
    // listener for changes to the state form field
    const selectElement = $("#state");
    // Add change event listener to select element
    selectElement.change(function () {
      // Get the selected option
      const selectedOption = $(this).children("option:selected").val();
      loadCities(selectedOption);
    });
  }

  //   storing formData
  function storeFormData() {
    const jsonData = JSON.stringify(formData);
    localStorage.setItem("formData", jsonData);
  }
  //   form checks
  // checking for empty form
  function check_len_0(formData) {
    for (let key in formData) {
      if (formData[key] === null) continue;
      if (formData[key].length == 0) {
        formData["errors"] = true;
        $(`#${key}_error`).empty();
        $(`#${key}_error`).append("Can not be empty");
      }
    }
  }
  function binder() {
    const storedData = localStorage.getItem("formData");
    if (storedData) {
      formData = JSON.parse(storedData);
      //   console.log(formData);
      // loop through formData and populatine form elements.
      for (let item in formData) {
        // console.log(item);
        // $(`#${item}`).val(formData["name"]);
        let ignore = ["errors", "loaded", "state", "city"];
        if (!ignore.includes(item)) {
          //   console.log(item);
          if (document.getElementById(item) !== null)
            document.getElementById(item).value = formData[item];
        }
        // console.log(item.key);
        // document.getElementById(item.key).value = item.value;
        // if (item) {
        // }
      }
    }
  }
  load_events();
  //   binding all form fields to store
  bind(formData);
  binder();
  // localStorage.clear();
  loadUser(JSON.parse(localStorage.getItem("user")));
});
