// check if the window is ready for JS.
$(document).ready(function () {
  // used to store amenities clicked on
  window.arr = {};
  // add events for when the check box is clicked
  $('.checkbox').click(function () {
    const el = $(this);
    // store clicked values
    const name = el[0].dataset.name.replace(/:/g, '');
    const id = el[0].dataset.id.replace(/:/g, '');
    // check if the amen was already added
    // if so add it else remove it.
    // if (window.arr.hasOwnProperty(id)) {
    console.log(Object.prototype.hasOwnProperty.call(window, 'arr'));
    // check if window has property arr
    if (Object.prototype.hasOwnProperty.call(window, 'arr')) {
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
    let str = '';
    // create the string to be added to the h4
    for (const value in window.arr) {
      if (i < 3) {
        str = str + window.arr[value];
      } else if (i === 3) {
        str = str + window.arr[value][0] + '...';
        break;
      }
      if (i + 1 < arrLen) {
        str = str + ', ';
      }
      i = i + 1;
    }
    // if no string add this.
    if (arrLen === 0) {
      $('.amenities h4').html('&nbsp;');
    } else {
      $('.amenities h4').text(str);
    }
  });
});
