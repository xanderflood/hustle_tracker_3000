$(document).ready(function() {
  $('input[type="text"]').hide();

  $('a.edit').click(function () {
    var dad = $(this).parent().parent();
    // debugger;
    dad.find('label').hide();
    dad.find('input[type="text"]').show().focus();
  });

  $('input[type="text"]').focusout(function() {
    // debugger;
    var dad = $(this).parent();
    $(this).hide();
    dad.find('label').show();
  });
});