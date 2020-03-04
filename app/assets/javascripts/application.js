// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require activestorage
//= require_tree .
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require cocoon
//= require chartkick
//= require Chart.bundle

function addNew() {
  var x = document.getElementById("form-add-new");
  if (x.style.display === "block") {
    x.style.display = "none";
  } else {
    x.style.display = "block";
  }
}

function addFill() {
  var x = document.getElementById("form-fill");
  if (x.style.display === "block") {
    x.style.display = "none";
  } else {
    x.style.display = "block";
  }
}
function addNewBookOrder() {
  var x = document.getElementById("form-add");
  if (x.style.display === "block") {
    x.style.display = "none";
  } else {
    x.style.display = "block";
  }
}

window.addEventListener("load", () => {
  const element = document.querySelector(
    "#new_book_order, #new_book, #edit_user_1, #new_category"
  );
  element.addEventListener("ajax:success", event => {
    const [_data, _status, xhr] = event.detail;
    element.insertAdjacentHTML("beforeend", xhr.responseText);
  });

  // element.addEventListener("ajax:error", function(event, xhr, status, error) {
  //   // insert the failure message inside the "#account_settings" element
  //   $("#form-add").append(xhr.responseText);
  // });

  element.addEventListener("ajax:error", () => {
    element.insertAdjacentHTML(
      "beforeend",
      alert("Error creating form, please fill it correctly and completely")
    );
  });
});
