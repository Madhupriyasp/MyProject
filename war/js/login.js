$(function(){

                $("#loginform").validate({
                    rules: {
                        username: {
                            required: true,
                        },  
                        password: {
                            required: true,
                            minlength: 5
                        },
                    },
            	messages: {
        		
        			username: {
        				required: 'This field is required'
        			},
        			password: {
        				required: 'This field is required',
        				minlength: 'Minimum length: 6'
        			},
        		},
        		success: function(label) {
        			label.html('OK').removeClass('error').addClass('ok');
        			setTimeout(function(){
        				label.fadeOut(500);
        			}, 2000)
        		}
                   
                });
            });
