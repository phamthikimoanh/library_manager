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
//= require bootstrap-datepicker
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

$(document).ready(function() {
  var date = new Date();
  var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
  var end = new Date(date.getFullYear(), date.getMonth(), date.getDate());

  $("#datepicker1").datepicker({
    format: "yyyy-dd-mm",
    date,
    endDate: end,
    todayHighlight: true,
    autoclose: true
  });
  $("#datepicker2").datepicker({
    format: "yyyy-dd-mm",
    todayHighlight: true,
    date,
    endDate: end,
    autoclose: true
  });

  $("#datepicker1,#datepicker2").datepicker("setDate", today);
});
function get_datetime() {
  var startDay = $("#datepicker1").val();
  console.log(startDay);
  var endDay = $("#datepicker2").val();
  console.log(endDay);
  data = { start: startDay, end: endDay };
  $.ajax({
    url: "/get_ajax",
    method: "GET",
    data: { data: JSON.stringify(data) },
    contentType: "text/javascript",
    success(data) {
      // alert(data);
      return false;
    },
    error(data) {
      // alert("ERROR: " + data);
      return false;
    }
  });
}
// ?get_ajax=abc