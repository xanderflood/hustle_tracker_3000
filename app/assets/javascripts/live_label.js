$(document).ready(function() {
  //
  // setup the pencil glyphicon link
  //
  var _startEditing = function() {
    var dad = $(this).parent().parent();
    dad.find('label').hide();

    var input = dad.find('input.live-label');
    input.show().focus().val(input.val()); //set focus to end
    LiveLabel.autoResize(input);
  };
  $('a.live-label').click(_startEditing);
  $('label.live-label').click(_startEditing);

  //
  // unfocusing the livelabel
  //
  var _submitUpdate = function(_this) { 
    context = $(_this).closest('.live-label-group');

    var data = {
      id: context.data('id'),
      name: $(_this).val()
    }

    $.post({
      url: context.data('target'),
      data: data,
      beforeSend: function() {
        context.find('.fa')
            .removeClass('fa-pencil')
            .addClass('fa-spinner faa-spin animated');
      }
    })

    .done(function() {
      context.find('.fa')
       .removeClass('fa-spinner faa-spin animated')
       .addClass('fa-pencil');
    })

    .success(function(jqxhr, status, errorThrown) {
      context.find('label.live-label').text(jqxhr.name).show();
      context.find('input.live-label').hide();
    })

    .error(function(jqxhr, status, errorThrown) {
      context.find('label.live-label').text(jqxhr.name);

      //trigger some kind of error
    });
  };
  $('input.live-label').focusout(function() { _submitUpdate(this) });
  $('input.live-label').keyup(function (event) {
    if (event.keyCode == 13)
      _submitUpdate(event.target);
  });

  //
  // hoverstuff
  //
  // $('label.live-label').mousover(function(event) {
  //   $(this).
  // });

  $('a.live-label').mousover(function(event) {
    $(this).closest('.live-label-group').find('label').mouseover();
  });
});