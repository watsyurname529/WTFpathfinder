build_config = (base_list) ->
    config_obj = {}

    for base_key, base_value of base_list
        if base_value.constructor is Object
            temp_obj = {}
            for sub_key, sub_value of base_value
                temp_obj[sub_key] = true
            config_obj[base_key] = temp_obj
    # console.log(config_obj)
    return config_obj

build_checkbox = (config_list) ->
    html_string = '<dl><dt>Settings</dt></dl>'
    for base_key, base_value of config_list
        html_string = html_string + '<dl id="entry"><dt>entry</dt>'.replace /entry/g, base_key
        for sub_key, sub_value of base_value
            html_string = html_string + '<dd><input id="entry" class="box" type="checkbox" checked="checked"><label class="checkbox" for="entry"> entry </label></dd>'.replace /entry/g, sub_key
        html_string = html_string + '</dl>'
    # console.log(html_string)
    $('#settings').html(html_string)

build_list = (base_list, config_list) ->
    active_list = {}

    for base_key, base_value of base_list
        if base_value.constructor is Object
            temp_list = []
            for sub_key, sub_value of base_value
                if config_list[base_key][sub_key] is true
                    temp_list = temp_list.concat sub_value
            active_list[base_key] = temp_list
        else if base_value.constructor is Array
            active_list[base_key] = base_value
        else
            console.log("Invalid structure. Needs to be an Array or Object (Dictionary)")
    console.log(config_list)
    return active_list

showOutput = ->
    $('#output').addClass('animate').css('opacity', 1.0)

hideOutput = ->
    $('#output').removeClass('animate').css('opacity', 0.0)

generate = (active_list) ->
    heading_string = active_list['heading'][Math.floor(Math.random() * active_list['heading'].length)]
    generate_string = active_list['response'][Math.floor(Math.random() * active_list['response'].length)]

    key_words_list = []
    template_list = active_list['template'][Math.floor(Math.random() * active_list['template'].length)]

    for word in template_list.split " "
        if word.indexOf('@') >= 0
            key_words_list.push word.split('@').join('')

    for word in key_words_list
        template_list = template_list.replace('@'+word, active_list[word][Math.floor(Math.random() * active_list[word].length)])

    setTimeout(showOutput, 50)

    $('#output').html(
        '<p>' + heading_string + '</p>' +
        '<p>' + template_list + '</p>'
    )
    $('#generate').text(generate_string)

    hideOutput()
    return false

config_list = build_config(data)
data_list = build_list(data, config_list)

build_checkbox(config_list)
generate(data_list)

window.data_list = data_list
$('#generate').on "click", ->
    generate(window.data_list)
