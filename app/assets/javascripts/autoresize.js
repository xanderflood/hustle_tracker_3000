$(document).ready(function() {
  //
  // resize on every keypress
  //
  $('input.autoresize').keydown(AutoResize.refresh);
});

//
// utility functions
//
window.AutoResize = window.LiveLabel || (function() {

  var _clamp = function(val, min, max) {
    if (val < min)
      return min;
    else if (val > max)
      return max;
    else
      return val;
  };

  var _getTextWidth = function(text, font) {
    // if given, use cached canvas for better performance
    // else, create new canvas
    var canvas = _getTextWidth.canvas || (_getTextWidth.canvas = document.createElement("canvas"));
    var context = canvas.getContext("2d");
    context.font = font;
    var metrics = context.measureText(text);
    return metrics.width;
  };

  var _refresh = function () {
    var text = $(this).val();
    var width = _getTextWidth(text, 'bold 11pt arial');
    $(this).css('width', _clamp(width, 40, 500) + 5);
  };

  return {
    refresh: _refresh
  }
})();