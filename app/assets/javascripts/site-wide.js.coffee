# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->

  $("#header-sign-in").hide()
  $("#sign-in-link").click ->
    $("#header-sign-in").show(1000)

  $("#property-pics .item").hide()
  $("#property-pics .item.active").show()

  $('#thumbnails a').click ->
    $('#property-pics .item').hide()
    $('#'+$(this).attr('img_target')).show()
    return false

  $(".gitb-tooltip").tooltip()

