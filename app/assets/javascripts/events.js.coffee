# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
builder =
        buildField: (field) ->
                console.log(field)

( ($) ->

        $.fn.buildEventForm = (opts) ->
                opts.schema = $.parseJSON(opts.schema).fields if opts.schema
                console.log(opts.schema)
                (builder.buildField f for f in opts.schema)

) jQuery
