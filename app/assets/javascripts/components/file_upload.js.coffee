ready = ->
  $('#fileupload').fileupload
    replaceFileInput: false
  
  $('#post_post_images_file').change(
    validate = ->
      $("#images").css "display", "none" if $("#post_post_images_file").val().length > 10
    )

$(document).ready(ready)
$(document).on('page:load', ready)