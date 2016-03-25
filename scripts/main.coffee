build_list = (base_list) ->
    active_list = {}

    for base_key, base_value of base_list
        if base_value instanceof Object is true
            temp_list = []
            for subkey, subvalue of base_value
                temp_list = temp_list.concat subvalue
            active_list[base_key] = temp_list
        else if base_value instanceof Array is true
            active_list[base_key] = base_value
        else
            console.log("Invalid structure. Needs to be an Array or Object (Dictionary)")
    return active_list

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

    # $('#output').text(template_list)
    # $('#output').html(
    #     '<dl>' +
    #         '<dt>' + header_string + '</dt>' +
    #         '<dd>' + template_list + '</dd>' +
    #     '</dl>'
    # )

    $('#output').html(
        '<p>' + heading_string + '</p>' +
        '<p>' + template_list + '</p>'
    )
    $('#generate').text(generate_string)
    # return false

data_list = build_list(data)
generate(data_list)
$('#generate').click ->
    generate(data_list)
