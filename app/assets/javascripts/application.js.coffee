#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap/collapse
#= require bootstrap/tab
#= require_tree .

$(document).on 'page:change', ->
  $('a[data-toggle="tab"]').on 'shown.bs.tab', (e) ->
    el = $(e.target)
    from = $(el.data('element-from'))
    to = $(el.data('element-to'))
    if to
      $.ajax
        type: 'POST'
        dataType: 'html'
        processData: false
        url: 'https://api.github.com/markdown/raw'
        data: from.val()
        contentType: 'text/plain'
        success: (data) ->
          to.html data
