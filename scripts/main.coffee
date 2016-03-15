generate = () ->
    heading_string = data['heading'][Math.floor(Math.random() * data['heading'].length)]
    generate_string = data['response'][Math.floor(Math.random() * data['response'].length)]

    key_words_list = []
    template_list = data['template'][Math.floor(Math.random() * data['template'].length)]

    for word in template_list.split " "
        if word.indexOf('@') >= 0
            key_words_list.push word.split('@').join('')

    for word in key_words_list
        template_list = template_list.replace('@'+word, data[word][Math.floor(Math.random() * data[word].length)])

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

generate()
$('#generate').click ->
    generate()
