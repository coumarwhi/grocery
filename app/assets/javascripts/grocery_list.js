$(document).on('turbolinks:load', function() {
  var checkbox = $(".mark_complete");
  var grocery_list_id = location.pathname.split("/").pop()
  checkbox.change(function() {
    var id = $(this).data("id")
    $.ajax({
      type: "PATCH",
      url: "/grocery_lists/" + grocery_list_id + "/grocery_items/" + id + "/complete"
    })
  });
})
