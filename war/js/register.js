$(function(){
	
	$("#registerform").validate({
		rules: {
			name: {
				required: true,
				lettersonly: true,
				minlength: 5
			},
			username: {
				required: true
			},
			password: {
				required: true,
				minlength: 6
			},
			
			gender: {
                selectcheck: true
			},
			designation: {
				rolecheck: true
			},
			branch: {
				branchcheck: true
			},

			semester: {
				semcheck: true
			},

			year: {
				yearcheck: true
			},

			email: {
				required: true,
				email: true
			},
			
		},
		messages: {
			name: {
				required: 'This field is required',
				minlength: 'Minimum length: 5'
			},
			username: {
				required: 'This field is required'
			},
			password: {
				required: 'This field is required',
				minlength: 'Minimum length: 6'
			},
			
				gender: {
					required: 'This field is required',
			},

			designation: {
				required: 'This field is required',
		},
		branch: {
			required: 'This field is required',
	},
	semester: {
		required: 'This field is required',
},
year: {
	required: 'This field is required',
},
			email: 'Invalid e-mail address',
			
		},
		success: function(label) {
			label.html('OK').removeClass('error').addClass('ok');
			setTimeout(function(){
				label.fadeOut(500);
			}, 2000)
		}
	});
});

    jQuery.validator.addMethod('selectcheck', function (value) {
        return (value != '0');
    }, "This field is required");
	
    jQuery.validator.addMethod('rolecheck', function (value) {
        return (value != '0');
    }, "This field is required");
    jQuery.validator.addMethod('branchcheck', function (value) {
        return (value != '0');
    }, "This field is required");
    jQuery.validator.addMethod('semcheck', function (value) {
        return (value != '0');
    }, "This field is required");
    jQuery.validator.addMethod('yearcheck', function (value) {
        return (value != '0');
    }, "This field is required");
    jQuery.validator.addMethod('lettersonly', function(value) {
        return value.match(/^[- a-zA-Z]+$/);
    },"Letters only allowed");
   
