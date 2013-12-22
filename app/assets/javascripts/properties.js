
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
});
