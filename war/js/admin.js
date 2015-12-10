$(function(){
	
	$("#registerform").validate({
		rules: {
			name: {
				required: true,
				minlength: 5
			},
		
		},
		messages: {
			name: {
				required: 'This field is required',
				minlength: 'Minimum length: 5'
			
			
		},
		success: function(label) {
			label.html('OK').removeClass('error').addClass('ok');
			setTimeout(function(){
				label.fadeOut(500);
			}, 2000)
		}
	});
});

 
