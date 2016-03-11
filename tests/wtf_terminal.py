#!/usr/bin/env python3

import json
import random

json_file = input('Enter JSON file: ')

with open(json_file, 'r') as file:
    base_lists = json.loads(file.read())
    #print(base_lists)

#active_lists = base_lists
active_lists = {}
config_active = {}
marker = '@'

# for main_key, main_value in base_lists.items():
#     if(isinstance(main_value, dict)):
#         config_active.update({main_key: list(main_value.keys())})
# print(config_active)

for main_key, main_value in base_lists.items():
    if(isinstance(main_value, dict)):
        temp_dict = {}
        for sub_key, sub_value in main_value.items():
            temp_dict.update({sub_key: True})
        config_active.update({main_key: temp_dict})
print(config_active)

config_active['Race']['ARG'] = False

for main_key, main_value in base_lists.items():
    if(isinstance(main_value, list)):
        active_lists.update({main_key: main_value})
    if(isinstance(main_value, dict)):
        temp_list = []
        for sub_key, sub_value in main_value.items():
            if(config_active[main_key][sub_key] == True):
                if(isinstance(sub_value, list)):
                    temp_list.extend(sub_value)
            active_lists.update({main_key: temp_list})
print(active_lists)

done = False;
while(done != True):
    key_words_list = []
    template_string = active_lists['template']
    #print(template_string)

    template_choice = random.choice(template_string)
    for word in template_choice.split(' '):
        if marker in word:
            key_words_list.append(word.strip('@'))

    for word in key_words_list:
        template_choice = template_choice.replace('@' + word, random.choice(active_lists[word]), 1)

    print(random.choice(active_lists['heading']).upper() + '\n')
    print(template_choice.upper() + '\n')
    print(random.choice(active_lists['response']).upper() + '\n')
    #print(key_words_list)

    control = input('Again? ')
    if(control == 'N'):
        done = True
    elif(control == 'C'):
        print(config_active['Class'].keys())
        change_key = input('Enter Key to Change: ')
        config_active['Class'][change_key] = not config_active['Class'][change_key]
        print(config_active)

        for main_key, main_value in base_lists.items():
            if(isinstance(main_value, list)):
                active_lists.update({main_key: main_value})
            if(isinstance(main_value, dict)):
                temp_list = []
                for sub_key, sub_value in main_value.items():
                    if(config_active[main_key][sub_key] == True):
                        if(isinstance(sub_value, list)):
                            temp_list.extend(sub_value)
                    active_lists.update({main_key: temp_list})

        print(active_lists['Class'])
