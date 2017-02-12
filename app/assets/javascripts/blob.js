$(function() {
  //
  // Indicator chevron
  //
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

  //
  // Posting the action-buttons
  //
  var _action = function(context, url, method) {
    var chevron = context.find('.fa.chevron');
    var open = chevron.hasClass('fa-chevron-down');
    var chevClass = (open ? 'fa-chevron-down' : 'fa-chevron-right' )

    $.ajax({
      method: method,
      url: url,
      beforeSend: function() {
        chevron
          .removeClass(chevClass)
          .addClass('fa-spinner faa-spin animated');
      },
      error:  function( jqxhr, status, errorThrown ) {
        var _chevron = chevron;
        var _chevClass = chevClass;
        chevron
          .removeClass('fa-spinner faa-spin animated')
          .addClass('fa-close');
        chevron
          .fadeOut(200, function() {
            _chevron
              .removeClass('fa-close')
              .addClass(_chevClass)
              .fadeIn();
          });
      },
      success:  function( data, status, jqxhr ) {
        chevron
          .addClass('fa-close')
          .removeClass('fa-chevron-right')
          .css('color: #FF0000');
      }
    });
  };

  $('.action-btn').click(function (event) {
    // debugger;
    _action($(this).closest('.panel-heading'), $(this).data('url'), $(this).data('method'));
  });
});
