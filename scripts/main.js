// Generated by CoffeeScript 1.10.0
var build_checkbox, build_config, build_list, config_list, data_list, generate, hideOutput, showOutput;

build_config = function(base_list) {
  var base_key, base_value, config_obj, sub_key, sub_value, temp_obj;
  config_obj = {};
  for (base_key in base_list) {
    base_value = base_list[base_key];
    if (base_value.constructor === Object) {
      temp_obj = {};
      for (sub_key in base_value) {
        sub_value = base_value[sub_key];
        temp_obj[sub_key] = true;
      }
      config_obj[base_key] = temp_obj;
    }
  }
  return config_obj;
};

build_checkbox = function(config_list) {
  var base_key, base_value, html_string, sub_key, sub_value;
  html_string = '<dl><dt>Settings</dt></dl>';
  for (base_key in config_list) {
    base_value = config_list[base_key];
    html_string = html_string + '<dl id="entry"><dt>entry</dt>'.replace(/entry/g, base_key);
    for (sub_key in base_value) {
      sub_value = base_value[sub_key];
      html_string = html_string + '<dd><input id="entry" class="box" type="checkbox" checked="checked"><label class="checkbox" for="entry"> entry </label></dd>'.replace(/entry/g, sub_key);
    }
    html_string = html_string + '</dl>';
  }
  return $('#settings').html(html_string);
};

build_list = function(base_list, config_list) {
  var active_list, base_key, base_value, sub_key, sub_value, temp_list;
  active_list = {};
  for (base_key in base_list) {
    base_value = base_list[base_key];
    if (base_value.constructor === Object) {
      temp_list = [];
      for (sub_key in base_value) {
        sub_value = base_value[sub_key];
        if (config_list[base_key][sub_key] === true) {
          temp_list = temp_list.concat(sub_value);
        }
      }
      active_list[base_key] = temp_list;
    } else if (base_value.constructor === Array) {
      active_list[base_key] = base_value;
    } else {
      console.log("Invalid structure. Needs to be an Array or Object (Dictionary)");
    }
  }
  console.log(config_list);
  return active_list;
};

showOutput = function() {
  return $('#output').addClass('animate').css('opacity', 1.0);
};

hideOutput = function() {
  return $('#output').removeClass('animate').css('opacity', 0.0);
};

generate = function(active_list) {
  var generate_string, heading_string, i, j, key_words_list, len, len1, ref, template_list, word;
  heading_string = active_list['heading'][Math.floor(Math.random() * active_list['heading'].length)];
  generate_string = active_list['response'][Math.floor(Math.random() * active_list['response'].length)];
  key_words_list = [];
  template_list = active_list['template'][Math.floor(Math.random() * active_list['template'].length)];
  ref = template_list.split(" ");
  for (i = 0, len = ref.length; i < len; i++) {
    word = ref[i];
    if (word.indexOf('@') >= 0) {
      key_words_list.push(word.split('@').join(''));
    }
  }
  for (j = 0, len1 = key_words_list.length; j < len1; j++) {
    word = key_words_list[j];
    template_list = template_list.replace('@' + word, active_list[word][Math.floor(Math.random() * active_list[word].length)]);
  }
  setTimeout(showOutput, 50);
  $('#output').html('<p>' + heading_string + '</p>' + '<p>' + template_list + '</p>');
  $('#generate').text(generate_string);
  hideOutput();
  return false;
};

config_list = build_config(data);

data_list = build_list(data, config_list);

build_checkbox(config_list);

generate(data_list);

window.data_list = data_list;

$('#generate').on("click", function() {
  return generate(window.data_list);
});
