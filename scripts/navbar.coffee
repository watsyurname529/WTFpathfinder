# #Set the width of the side navigation to 250px
# openNav = ->
#     document.getElementById("mySidenav").style.width = "250px";
#
# #Set the width of the side navigation to 0
# closeNav = ->
#     document.getElementById("mySidenav").style.width = "0";

$('#navicon').on "click", ->
    $('#mySidenav').css('width', '250px')

$('#closebtn').on "click", ->
    $('#mySidenav').css('width', '0px')

$('#about-nav').on "click", ->
    setTimeout(showOutput, 50)
    $('#output').html(
        '<div class="about">' +
        '<p> About WTF Pathfinder</p>' +
        '<p> Inspired by <a href="http://whothefuckismydndcharacter.com/" target="_blank">WTFD&D</a> by <a href="https://twitter.com/ryanjgrant">Ryan</a>,
             I decided to create a spin-off specifically tailored to the Pathfinder RPG System, creatively titled "Who the Fuck is my Pathfinder Character?!"</p>' +
        '<p> The core functionality is the same, but with expanded race and class lists from the Pathfinder game setting. </p>' +
        '<p> I also tried my best to create generation lists that were as unique as possible from WTFD&D,
             but there are a few that I ended up copying and some that are very similar due to the nature of the ideas. </p>' +
        '<p> So please check out both generators for maximum combinations and ideas. </p>' +
        '</div>'
    )
    $('#generate').text("Hit Me to Generate Again!")
    hideOutput()

$('#suggestion-nav').on "click", ->
    setTimeout(showOutput, 50)
    $('#output').html(
        '<p> Content Under Development </p>'
    )
    $('#generate').text("Hit Me to Generate Again!")
    hideOutput()

$('#generate-nav').on "click", ->
    generate(data_list)

$('#box1').on "click", ->
    if $('#box1').is(':checked')
        config_list['Race']['Core'] = true
    else
        config_list['Race']['Core'] = false
    window.data_list = build_list(data, config_list)

$('#box2').on "click", ->
    if $('#box2').is(':checked')
        config_list['Race']['ARG'] = true
    else
        config_list['Race']['ARG'] = false
    window.data_list = build_list(data, config_list)
