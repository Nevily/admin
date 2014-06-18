ready = ->
  $('#fileupload').fileupload
    replaceFileInput: false

$(document).ready(ready)
$(document).on('page:load', ready)