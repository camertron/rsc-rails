//= require 'rsc/rsc.min.js'

function init() {
  $('.rsc-container').each(function() {
    new Rsc($(this));
  });
};

$(document).ready(init);
$(document).on('turbolinks:load', init);
