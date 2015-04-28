# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
templates =
        selectType: () ->
                """
                <select class=\"form-control\">
                  <option value=\"text\">Text</option>
                  <option value=\"email\">Email</option>
                  <option value=\"number\">Number</option>
                  <option value=\"phone\">Phone</option>
                </select>
                """
        inputType: (name) ->
                """
                <div class=\"row\">
                  <div class=\"col-md-6\">
                    <div class=\"form-group\">
                      <input class=\"form-control\" placeholder=\"#{name}\" type=\"text\">
                    </div>
                  </div>
                  <div class=\"col-md-6\">
                    <div class=\"form-group\">
                        #{templates.selectType()}
                    </div>
                  </div>
                </div>
                """

builder =
        buildText: (elem, name) ->
                console.log('buildText', elem, name)
                elem.append(templates.inputType(name))
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
