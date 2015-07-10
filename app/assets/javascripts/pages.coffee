# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  url = "/uploads"
  uploadForm = $("#fileupload")
  uploadForm.fileupload
    url: url
    dataType: "json"

  console.log uploadForm.fileupload("option", "url")
  uploadForm.on "fileuploaddone", (e, data) ->
    console.log data
  $.ajax
    url: "#{uploadForm.fileupload("option", "url")}.json"
    datatype: "json"
    context: $("#fileupload")[0]
  .always ->
    $(this).removeClass("fileupload-processing")
    return
  .done (result) ->
    console.log result
    $(this).fileupload("option", "done")
      .call this, $.Event("done"),
        result: result
    return
  return
