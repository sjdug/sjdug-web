$ ->
  $('#subscribe-button').click (e) ->
    e.preventDefault()
    $.ajax {
      type: 'POST',
      url: '/api/subscribe',
      data:
        email: $('#subscribe-email').val()
      success: () ->
        $('form').hide()
        $('.subscription-success').show()
      error: () ->
    }