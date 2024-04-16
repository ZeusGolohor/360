$(document).ready(function () {
  // Used to clear old form errors.
  function clear_previous_errors(formData) {
    for (let key in formData) {
      $(`#${key}_error`).empty();
    }
  }
  // check if two fields match
  function check_2_fields_match(formData, fields) {
    if (formData[fields[0]] !== formData[fields[1]]) {
      formData["errors"] = true;
      $(`#${fields[0]}_error`).empty();
      $(`#${fields[1]}_error`).empty();
      $(`#${fields[0]}_error`).append(`Must match field ${fields[1]}`);
      $(`#${fields[1]}_error`).append(`Must match field ${fields[0]}`);
    }
  }
  // check if field(s) is/are atleast 8 chars long
  function check__len_8(formData) {
    const fields = ["password", "confirm_password"];
    let i = 0;
    for (let key in formData) {
      if (key == fields[i]) {
        if (formData[key].length < 8) {
          formData["errors"] = true;
          $(`#${key}_error`).empty();
          $(`#${key}_error`).append("Must be atleast 8 characters");
        }
      }
    }
    return;
  }
  // checking for empty form
  function check_len_0(formData) {
    for (let key in formData) {
      if (formData[key].length == 0) {
        formData["errors"] = true;
        $(`#${key}_error`).empty();
        $(`#${key}_error`).append("Can not be empty");
      }
    }
  }
  // Adding event listener to form
  $("#registrationForm").submit(function (event) {
    // Prevent page reload when form is submitted
    event.preventDefault();
    // get form data
    const formData = {};
    formData["errors"] = false;
    formData["first_name"] = $("#first_name").val();
    formData["last_name"] = $("#last_name").val();
    formData["email"] = $("#email").val();
    formData["password"] = $("#password").val();
    formData["confirm_password"] = $("#confirm_password").val();
    // form validation
    clear_previous_errors(formData);
    check_len_0(formData);
    check__len_8(formData);
    check_2_fields_match(formData, ["password", "confirm_password"]);
    if (formData["errors"] == false) {
      console.log("sending form");
      //creating the new user
      $.ajax({
        url: `http://localhost:5001/api/v1/users`,
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(formData),
        success: function (data, status) {
          console.log(data);
          user = data;
          localStorage.setItem("user", JSON.stringify(user));

          window.location = "http://localhost:5000/places";
        },
        error: function (xhr, status, error) {
          console.log("Error creating new User");
          console.error(xhr);
          console.error(error);
        },
      });
    }
  });
});
