class @AddToCalendar
  @load: ->
    script = document.createElement('script')
    script.type = 'text/javascript'
    script.charset = 'UTF-8'
    script.async = true
    script.src = (if 'https:' == window.location.protocol then 'https' else 'http') + '://addtocalendar.com/atc/1.5/atc.min.js'
    firstScript = document.getElementsByTagName("script")[0]
    firstScript.parentNode.insertBefore script, firstScript

if typeof Turbolinks isnt 'undefined' and Turbolinks.supported
  document.addEventListener "page:change", (->
    AddToCalendar.load()
  ), true
else
  AddToCalendar.load()
