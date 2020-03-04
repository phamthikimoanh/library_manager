// $(document).ready(function() {
//   $("#new_user").on("submit", function(e) {
//     var name = $("#user_name").val();
//     e.preventDefault();
//     if (name) {
//       $.ajax({
//         url: "/users",
//         type: "post",
//         dataType: "json",
//         data: { user: { name: name } }
//       })
//         .done(function(data) {
//           $("tbody").append(data.user_data);
//           $(".users-size").text(parseInt($(".users-size").text()) + 1);
//         })
//         .fail(function() {
//           alert("Can create new user! We got some errors");
//         });
//     } else {
//       alert("Name can be blank");
//     }
//     return false;
//   });
// });
