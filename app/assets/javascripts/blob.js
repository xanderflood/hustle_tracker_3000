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
  var _action = function(context, url, method, success, obj) {
    if (success == 'delete' && !confirm("are you sure?")) {
      event.stopPropagation();
      return;
    }

    var chevron = context.find('.fa.chevron');
    var isOpen = chevron.hasClass('fa-chevron-down');
    var chevClass = (isOpen ? 'fa-chevron-down' : 'fa-chevron-right' );

    $.ajax({
      method: method,
      url: url,
      data: [],
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
              .removeClass('fa-spinner faa-spin animated')
              .addClass(_chevClass)
              .fadeIn();
          });
      },
      success:  function( data, status, jqxhr ) {
        chevron
          .removeClass('fa-spinner faa-spin animated')
          .addClass(chevClass)
          .css('color: #FF0000');

        globActionCallbacks[success](context);
      }
    });
  };

  //
  // respond to pause/play/ff buttons
  //
  $('.action-btn').click(function (event) {
    _action(
      $(this).closest('.panel-heading'),
      $(this).data('url'),
      $(this).data('method'),
      $(this).data('success')
    );
    event.stopPropagation();
  });
});
