# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
builder =
        buildText: (elem, name) ->
                console.log('buildText', elem, name)
                template = """
                <div class=\"form-group\">
                        <input class=\"form-control\" placeholder=\"#{name}\" type=\"text\">
                </div>
                """
                elem.append(template)
        buildInput: (elem, name, type) ->
                console.log('buildInput', elem, name, type)
                builder.buildText(elem, name)
        buildField: (elem, field) ->
                console.log('buildField', elem, field)
                builder.buildInput(elem, field.name, field.type)

( ($) ->

        $.fn.buildEventForm = (opts) ->
                opts.schema = $.parseJSON(opts.schema).fields if opts.schema
                console.log(opts.schema)
                (builder.buildField(this, f) for f in opts.schema)

) jQuery
