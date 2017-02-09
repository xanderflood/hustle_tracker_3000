$(document).ready(function() {
  //
  // resize on every keypress
  //
  $('input.autoresize').keydown(function() {
    LiveLabel.autoResize($(this));
  });
});

//
// utility functions
//
window.LiveLabel = window.LiveLabel || (function() {

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

  var _autoResize = function (box) {
    var width = _getTextWidth(box.val(), 'bold 11pt arial');
    box.css('width', _clamp(width, 40, 500) + 5);
  };

  return {
    autoResize: _autoResize
  }
})();