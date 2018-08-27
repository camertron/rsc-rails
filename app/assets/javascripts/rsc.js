//= require 'rsc/rsc.min.js'

function init() {
  $('.rsc-rails').each(function() {
    var program = $('.rsc-program', $(this));
    var interpreter = $('.rsc-interpreter', $(this));

    if (program.length == 0) {
      program = $("<input class='rsc-program' type='hidden' />");
      $(this).append(program);
    }

    if (interpreter.length == 0) {
      interpreter = $("<div class='rsc-interpreter'></div>");
      $(this).append(interpreter);
    }

    var options = {
      loadProgram: function() {
        try {
          return JSON.parse(atob(program.val()));
        } catch(e) {
          return {};
        }
      },

      saveProgram: function(commandList) {
        program.val(commandList.toBase64());
      }
    }

    new Rsc(interpreter, options);
  });
};

$(document).ready(init);
$(document).on('turbolinks:load', init);
