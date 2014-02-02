jQuery ->
  $(".available-date").on("ajax:success", (e, data, status, xhr) ->
    res = JSON.parse(xhr.responseText)
    if res.result == 'new'
      $(this).attr('action', "/available_dates/#{res.date_id}")
      $(this).attr('class', res.level + ' available-date')
      $('<input>').attr('type','hidden').attr('name', '_method').attr('value', 'patch').appendTo($(this));
    else if res.result == 'updated'
      $(this).attr('action', "/available_dates/#{res.date_id}")
      $(this).attr('class', res.level + ' available-date')
      $("input[name='_method']", this).attr('value', 'delete')
    else if res.result == 'deleted'
      $(this).attr('action', "/properties/#{res.property_id}/available_dates")
      $(this).attr('class', 'available available-date')
      $("input[name='_method']", this).remove()
  ).bind "ajax:error", (e, xhr, status, error) ->
    alert("There seems to be an error")
