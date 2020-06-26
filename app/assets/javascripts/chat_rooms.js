$(document).on('turbolinks:load', function() {

  var ids = [];

  $("#add_users").on('click', function(){
  	$(':checkbox:checked').map(function(key, value) { ids.push(value.id.split("_")[2]) })
  	$.ajax({
  	  url: "/users_chats/bulk_create",
  	  type: 'POST',
  	  data: {
  	  	      'user_ids': ids,
  	          'chat_id': $('#chat_id')[0].value,
  	        },
  	  success: function(){
  	  	alert('Users successfully added!');
  	  }
  	});
  });
});
