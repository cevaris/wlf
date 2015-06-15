# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('input:checkbox').on 'change', ->
    payload = $('input:checkbox:checked').serialize()
    console.log payload
    $.ajax
      type: 'POST'
      url: '/event_rewards_calculate'
      data: payload
      dataType: 'html'
      success: (data) ->
        console.log data
        $('#rewards_total').html data
        return
      error: ->
        alert 'error handing here'
        return
    return
