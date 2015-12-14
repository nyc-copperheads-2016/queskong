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

  $('#login').on('click', function(event){
    event.preventDefault();
    $.ajax({
      url: '/sessions/new',
      method: 'GET',
    }).done(function(result){
      $('#content').html(result);
    }).fail(function(error){
      console.log("Error: " + error);
    })
  });


  $('.front-page-container').on('click','.make-survey', function(event){
    event.preventDefault();
    $.ajax({
      url: '/surveys/new',
      method: 'GET'
    }).done(function(response){
      $('.front-page-container').toggle();
      $('.append-div').append(response);
    }).fail(function(error){
      console.log("Error: " + error);
    })
  });


  $('#content').on('submit', ".make-title", function(event){
    event.preventDefault();
    $.ajax({
      method: 'POST',
      url: '/surveys',
      data: $(event.target).serialize()
    }).done(function(response){
      $('.append-div').html(response)
    }).fail(function(error){
      console.log("Error: " + error);
    })
  });

  $('#content').on('submit', ".make-question", function(event){
    event.preventDefault();
    $.ajax({
      method: 'POST',
      url: event.target.action,
      data: $(event.target).serialize()
    }).done(function(response){
      $('.append-div').html(response)
    }).fail(function(error){
      console.log("Error: " + error);
    })
  });


});
