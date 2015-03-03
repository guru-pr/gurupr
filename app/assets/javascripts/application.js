//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap/collapse
//= require bootstrap/tab
//= require_tree .

$(document).on('page:change', function() {
  $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    var el   = $(e.target);
    var from = $(el.data('element-from'));
    var to   = $(el.data('element-to'));

    if (to) {
      $.ajax({
        type: "POST",
        dataType: "html",
        processData: false,
        url: "https://api.github.com/markdown/raw",
        data: from.val(),
        contentType: "text/plain",
        success: function(data){
          to.html(data);
        }
      });
    }
  });
});
