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
//= require rails-ujs
//= require activestorage
//= require_tree .
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require cocoon

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
// $(document).ready(function() {

//   $("#btn_submit").bind("ajax:complete", function(event, xhr, status) {
//     $("#new_category").reset();
//   });

// });
// function submitForm() {
//   // Get the first form with the name
//   // Usually the form name is not repeated
//   // but duplicate names are possible in HTML
//   // Therefore to work around the issue, enforce the correct index
//   var frm = document.getElementById("new_category")[0];
//   frm.submit(); // Submit the form
//   frm.reset(); // Reset all form data
//   return false; // Prevent page refresh
// }