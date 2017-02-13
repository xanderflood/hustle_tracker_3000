//
// The _action function in blob.js should accept data-callback, and
//   _deed_header.html.haml should provide these
//
var globActionCallbacks = (function() {
  var _start = function (deedHeading) {
    $(deedHeading)
      .removeClass('idea done')
      .addClass('active');
    $(deedHeading)
      .closest('.panel-group')
      .prependTo('#actives-list');
  }

  var _pause = function (deedHeading) {
    $(deedHeading)
      .removeClass('active done')
      .addClass('idea');
    $('#ideas-list')
      .collapse('show');
    $(deedHeading)
      .closest('.panel-group')
      .prependTo('#ideas-list');
  };

  var _finish = function (deedHeading) {
    $(deedHeading)
      .removeClass('active idea')
      .addClass('done');
    $(deedHeading)
      .closest('.panel-group')
      .prependTo('#dones-list');
  };

  var _delete = function (deedHeading) {
    $(deedHeading)
      .closest('.panel-group')
      .remove();
  };

  return {
    start: _start,
    pause: _pause,
    finish: _finish,
    delete: _delete
  };
})();
