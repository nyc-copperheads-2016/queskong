$(document).ready(function() {

  $('.question-form').on('submit', function(event){
    }).done(function(result) {
      $('#content').append(result);
      $('#')
    }).fail(function(error) {
      console.log("Error: " + error);
    })
  });

});
