
App.groceryChannel = App.cable.subscriptions.create({ channel: "GroceryListsChannel", grocery_list_id: location.pathname.split("/").pop() }, {
  received(data) {
    if (data["type"] == "create") {
      return this.appendItem(data);
    } else if (data["type"] == "destroy") {
      return this.deleteItem(data);
    } else if (data["type"] == "complete" || data["type"] == "incomplete") {
      return this.checkItem(data);
    }
  },

  appendItem(data) {
    const html = this.createItem(data);
    var wrapper = $("#grocery_items_wrapper").append(html);
    $(wrapper).children().last().change(function() {
      $.ajax({
        type: "PATCH",
        url: "/grocery_lists/" + location.pathname.split("/").pop() + "/grocery_items/" + data["id"] + "/complete"
      })
    });
    return wrapper;
  },

  createItem(data) {
    return `
    <div class="row clearfix">
      <div class="form-check">
        <input type="checkbox" data-id="${data["id"]}" class="mark_complete form-check-input">
        <label class="form-check-label">
          ${data["content"]}
        </label>
        <a rel="nofollow" data-method="delete" href="/grocery_lists/${location.pathname.split("/").pop()}/grocery_items/${data["id"]}">Delete</a>
      </div>
    </div>
`
  },

  checkItem(data) {
    if (data["type"] == "incomplete") {
      $('input[type="checkbox"][data-id="' + data["id"] + '"]').prop('checked', false)
    } else {
      $('input[type="checkbox"][data-id="' + data["id"] + '"]').prop('checked', true)
    }
    
  },

  deleteItem(data) {
    $('input[type="checkbox"][data-id="' + data["id"] + '"]').parent().remove()
  },


  connected() {
    console.log("I am connected")
  }
}
);

