$(document).ready(function() {

  $('#content').on('submit', '.question-form', function(event){
    event.preventDefault();
    $.ajax({
      url: event.target.action,
      method: 'post',
      data: $(event.target).serialize()
    }).done(function(result) {
      $('.question-form-container').hide();
      $('#content').append(result);
    }).fail(function(error) {
      console.log("Error: " + error);
    })
  });

});
