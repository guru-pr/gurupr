$('#edit_profile').remove();

$fields = "<%= j render 'fields' %>";

$('.centered-card-profile').append($fields);
