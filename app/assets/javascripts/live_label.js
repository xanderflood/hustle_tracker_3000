$(document).ready(function() {
  $('a.live-label').click(LiveLabel.startEditing);
  $('label.live-label').click(LiveLabel.startEditing);

  $('.live-label-input').focusout(LiveLabel.submitUpdate);
  $('.live-label-input[data-enter-trigger=true]').keyup(function (event) {
    if (event.keyCode == 13)
      LiveLabel.submitUpdate.call(event.target);
  });
});

window.LiveLabel = (function() {
  //
  // setup the pencil glyphicon link
  //
  var _startEditing = function() {
    var dad = $(this).parent().parent();
    dad.find('label').hide();

    var input = dad.find('.live-label-input');
    input.show().focus().val(input.val()); // set focus to end
    AutoResize.refresh.call(input[0]);
  };

  //
  // unfocusing the livelabel
  //
  var _submitUpdate = function() { 
    context = $(this).closest('.live-label-group');

    var data = { id: context.data('id') };
    data[context.data('fieldName')] = $(this).val();

    $.ajax({
      method: context.data('httpMethod'),
      url: context.data('target'),
      data: data,
      beforeSend: function() {
        context.find('.fa')
            .removeClass('fa-pencil')
            .addClass('fa-spinner faa-spin animated');
      }
    })

    .always(function() {
      context.find('.fa')
       .removeClass('fa-spinner faa-spin animated')
       .addClass('fa-pencil');
    })

    .done(function(data, textStatus, jqXHR) {
      var input = context.find('.live-label-input')
      context.find('label.live-label').text(input.val()).show();
      input.hide();
    })

    .fail(function(jqxhr, status, errorThrown) {
      context.find('live-label-input').focus();

      //trigger some kind of error
    });
  };

  return {
    startEditing: _startEditing,
    submitUpdate: _submitUpdate
  }
})();