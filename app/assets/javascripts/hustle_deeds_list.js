
window.hustle_deed_list = (function() {

  var filter_box;
  var deed_box;
  var data;

  var visible = {
    idea: true,
    active: true,
    done: true
  }

  var _toggle_type = function(type, value) {
    visible[type] = !visible[type];
    _reload();
  };

  var _reload = function() {
    _.each($('.hustle-deeds .deed-blob'), function(deed) {
      if (_filter(deed.data)) {

      }
    });
  };

  var _filter = function(data) {
    if ((data('state') == 'thought') && visible['idea']) return true;
    if ((data('state') == 'started') && visible['started']) return true;
    if ((data('state') == 'done') && visible['done']) return true;
    return false;
  }

  return {
    filter_box: filter_box,
    deed_box: deed_box,
    data: data,
    toggle_type: _toggle_type,
    reload: _reload,
    filter: _filter
  };
})();
