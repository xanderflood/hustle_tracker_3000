// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var TimeChart = (function() {

  var tc = function() {
    $('.chartbox select').change(self.updateChart);
  };

  tc.updateChart = function() {
    span = $('.chartbox select')[0].value
    data = JSON.parse($('.chartbox')[0].getAttribute('data'))[span]

    Chartkick.charts["chart-id"].updateData(data);
  };

  return tc;
})();
