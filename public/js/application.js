$(document).ready(function() {

  $('#create_post').submit(function(event){

    event.preventDefault();

    $.ajax({
      type: "POST",
      url: "/",
      data: $(this).serialize(),
      dataType: 'text' 
    }).done(function(response) {
      $('#editmessage').text("Go here to edit your post:");
      $('#editlink').text("Edit your post");
      $('#editlink').attr('href',response);
      // console.log(edit_message)
    });
  });

$('#edit_post').submit(function(event){

    event.preventDefault();
    // debugger;

    $.ajax({
      type: "POST",
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: 'text' 
    }).done(function(response) {
      $('#updated_post_message').text("Your post has been updated!");
      
    });
  });


});

