data = {

    "template": [
        "@Adj @Adj @Race is @Class"
        "@Adj @Race is @Class"
    ]

    "Adj": [
        "Angry",
        "Crazy",
        "Depressed",
        "Frightened",
        "Happy",
        "Joyful",
        "Mad",
        "Sad"
    ]

    "Class": [
        "Cleric",
        "Druid",
        "Fighter",
        "Ranger",
        "Wizard"
    ]

    "Race": [
        "Elf",
        "Dwarf",
        "Gnome",
        "Halfling",
        "Human"
    ]
}

###
for key, value of data
    if value instanceof Object is true
        for subkey, subvalue of value
            alert subvalue
    else
        alert value
###

#temp_list = data['Adj']
#alert 'Random: ' + temp_list[Math.floor(Math.random() * temp_list.length)]

key_words_list = []
template_list = data['template'][Math.floor(Math.random() * data['template'].length)]

for word in template_list.split " "
    #if @ in word
    if word.indexOf('@') >= 0
        key_words_list.push word.split('@').join('')
#alert data['template'][0].split " "

#for word in key_words_list
#    alert word

###
for word in key_words_list
    template_list = template_list.split('@' + word).join(data[word][Math.floor(Math.random() * data[word].length)])
###

for word in key_words_list
    template_list = template_list.replace('@'+word,data[word][Math.floor(Math.random() * data[word].length)])
alert template_list.toUpperCase()
