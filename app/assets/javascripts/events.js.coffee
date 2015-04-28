# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
templates =
        selectType: (type) ->
                type = type.toLowerCase()
                emailSelected = if type == 'email' then 'selected' else ''
                textSelected = if type == 'text' then 'selected' else ''
                phoneSelected = if type == 'phone' then 'selected' else ''
                numberSelected = if type == 'number' then 'selected' else ''
                """
                <select class=\"form-control\">
                  <option #{textSelected}   value=\"text\"  >Text</option>
                  <option #{emailSelected}  value=\"email\" >Email</option>
                  <option #{numberSelected} value=\"number\">Number</option>
                  <option #{phoneSelected}  value=\"phone\" >Phone</option>
                </select>
                """
        inputType: (name, type) ->
                """
                <div class=\"row\">
                  <div class=\"col-md-6\">
                    <div class=\"form-group\">
                      <input class=\"form-control\" placeholder=\"#{name}\" type=\"text\">
                    </div>
                  </div>
                  <div class=\"col-md-6\">
                    <div class=\"form-group\">
                        #{templates.selectType(type)}
                    </div>
                  </div>
                </div>
                """

builder =
        buildInput: (elem, name, type) ->
                console.log('buildInput', elem, name, type)
                elem.append(templates.inputType(name, type))
        buildField: (elem, field) ->
                console.log('buildField', elem, field)
                builder.buildInput(elem, field.name, field.type)

( ($) ->

        $.fn.buildEventForm = (opts) ->
                opts.schema = $.parseJSON(opts.schema).fields if opts.schema
                console.log(opts.schema)
                (builder.buildField(this, f) for f in opts.schema)

) jQuery
