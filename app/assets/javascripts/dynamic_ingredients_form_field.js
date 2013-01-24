$(document).ready(function() {
  $('a#add-another').click(function() {
    $('#ingredients-list li:first').clone().find('input').val('')
    .end().appendTo('#ingredients-list');
  });

  $('.delete-ingredient').live('click', function() {
    if ($('#ingredients-list li').length > 1)
  $(this).parent().remove();
    else
  alert('You need at least one ingredient.')
  });
});