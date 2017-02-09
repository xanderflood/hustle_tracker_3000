$(document).ready(function() {
  $('input[type="text"]').hide();

  $('a.edit').click(function () {
    var dad = $(this).parent().parent();
    dad.find('label').hide();
    dad.find('input[type="text"]').show().focus();
  });

  $('input[type="text"]').focusout(function() {

    //
    // (first, set up the route)
    //
    // send off an AJAX request which:
    //
    //  (1) reloads the flash messages on error
    //
    //  (2) does the same on successs
    //
    //  (3) also does the below on success:
    //

    var dad = $(this).parent();
    $(this).hide();
    dad.find('label').show();
  });
});