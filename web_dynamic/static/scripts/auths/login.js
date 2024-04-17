$(document).ready(function () {
  // setting the url for api calls
  const url = "http://localhost:5001";
  // Used to clear old form errors.
  function clear_previous_errors(formData) {
    for (let key in formData) {
      $(`#${key}_error`).empty();
    }
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
  // check if field(s) is/are atleast 8 chars long
  function check__len_8(formData) {
    const fields = ["password"];
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
  // Adding event listener to form
  $("#loginForm").submit(function (event) {
    // Prevent page reload when form is submitted
    event.preventDefault();
    // get form data
    const formData = {};
    formData["errors"] = false;
    formData["email"] = $("#email").val();
    formData["password"] = $("#password").val();
    // form validation
    clear_previous_errors(formData);
    check__len_8(formData);
    check_len_0(formData);
    if (formData["errors"] == false) {
      $.ajax({
        url: `${url}/api/v1/auths/login`,
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(formData),
        success: function (data, status) {
          console.log("loging in");
        },
        error: function (data, status) {},
      });
    }
  });
});
