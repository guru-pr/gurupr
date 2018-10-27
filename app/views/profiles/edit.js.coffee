$('#profile_fields').remove();

$form = "<%= j render 'form' %>";

$('.centered-card-profile').append($form);
