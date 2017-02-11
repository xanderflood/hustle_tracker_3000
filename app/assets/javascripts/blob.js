$(function() {
  var _toggleChevron = function(event) {
    if (this == event.target)
      $(this).parent()
        .find('.panel-heading')
        .find('.btn.open .fa')
        .toggleClass('fa-chevron-down')
        .toggleClass('fa-chevron-right');
  };
  $('.collapse').on('show.bs.collapse', _toggleChevron);
  $('.collapse').on('hide.bs.collapse', _toggleChevron);
});