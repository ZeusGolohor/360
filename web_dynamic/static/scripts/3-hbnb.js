// check if the window is ready for JS.
$(document).ready(function () {
  $.get('http://localhost:5001/api/v1/status/')
    .done(function (data, status) {
      if (status === 'success' && data.status === 'OK') {
        $('#api_status').css('background-color', '#ff545f');
        $('#api_status').addClass('available');
      }
    })
    .fail(function (sTXT, status, error) {
      $('#api_status').removeClass('available');
    });
});
