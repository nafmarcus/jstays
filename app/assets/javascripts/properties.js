
function duration_click(term) {
    if (term == 'short_term') {
      $('#long_term_rate_fields').css('display','none');
      $('#short_term_rate_fields').css('display','block');
    }
    if (term == 'long_term') {
      $('#long_term_rate_fields').css('display','block');
      $('#short_term_rate_fields').css('display','none');
    }
}

$( document ).ready(function() {
  if ($('#property_duration_short_term').prop('checked')) {
    duration_click('short_term');
  }
  if ($('#property_duration_long_term').prop('checked')) {
    duration_click('long_term');
  }

//    Sign in field stuff on property page
  $(".property-signin", "#new_property").css('display', 'none');
  $(".open-signin").bind('click', function () {
    $(".property-signin").css('display', 'table-row');
    $("#signup-line").css('display', 'none');
  })
  $(".force-login", "#new_property").bind('click', function () {
    alert('Please sign in using the link on the top right of the screen.')
  })

  $("input, textarea, select", "#new_property").bind('focus', function(e) {
    if ($("#signup-line").is(":visible")) {
      alert('Please begin by indicating whether or not you have a Jstays login.')
      $(this).blur();
    }
  })

});
