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
