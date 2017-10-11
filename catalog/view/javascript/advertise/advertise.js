$(document).ready(function() {

	var advertise_id = $('#advertise_id').val();
	var advertise_image = $('#offer_image_original').val();

	$('#input-descriptio').summernote({height: 300});

	if(advertise_id) {
		$('.img-containers').empty();
		
		$uploadCrop = $('.img-containers').croppie({
			url: advertise_image,
		    enableExif: false,
		    viewport: {
		        width: $('.img-containers').width() - 10,
		        height: 187
		    },
		    boundary: {
		        width: $('.img-containers').width(),
		        height: 200
		    },
		    enforceBoundary: true,
		    zoom: 0
		});
	}

	$('body').on('click', 'a.thumbnail', function(e) {
		$('.img-containers').empty();

		$uploadCrop = $('.img-containers').croppie({
			url: $(this).attr('href'),
		    enableExif: false,
		    viewport: {
		        width: $('.img-containers').width() - 10,
		        height: 187
		    },
		    boundary: {
		        width: $('.img-containers').width(),
		        height: 200
		    },
		    enforceBoundary: true,
		    zoom: 0
		});

		$('#cropping-panel').removeClass('hide');

		return false;
	});

	$('#getCropped').on('click', function (ev) {
	   	$uploadCrop.croppie('result', {
			type: 'canvas',
			size: {
				width: 993,
				height: 200
			},
			format: 'jpeg'
	  	}).then(function (resp) {

	  		$('#croppedImage img').attr('src', resp);
	  		var resut_str = resp.replace("data:image/jpeg;base64,", "");
	  		$("#image_crop").attr("value", resut_str);
	 	});

	 	return false;
	});

	$('#agree_tt').change(function() {
		var agree = $(this).is(":checked") ? 'agree' : 'not_agree';
		$('input#agree').val(agree);
		return false;
	});

	$(document).on('click', '#save', function(){
		if ($('input[name="agree_tt"]').is(':checked')) {
			if($('input#offer_title').val() != '') {
				$('input#status').val('draft');
				$("form").submit(function(){
				});
			} else {
				$('.alert').remove();
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> Title must be greater than 3 and less than 255 characters!</div>');	
				$('body, html').animate({scrollTop:$('#content').offset().top}, 'slow');
			}
		} else {
			$('.alert').remove();
			$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> Please agree to the terms and conditions mentioned and then save.</div>');	
			$('body, html').animate({scrollTop:$('#content').offset().top}, 'slow');
		}
   	});

   	$(document).on('click', '#submitt', function() {	
		if ($('input[name="agree_tt"]').is(':checked')) {
			if($('input#offer_title').val() != ''){
				$('input#status').val('submitted');
				$("form").submit(function(){
				});
			} else {
				$('.alert').remove();
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> Title must be greater than 3 and less than 255 characters!</div>');	
				$('body, html').animate({scrollTop:$('#content').offset().top}, 'slow');
			}
		} else {
			$('.alert').remove();
			$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>Please agree to the terms and conditions mentioned and then save.</div>');	
			$('body, html').animate({scrollTop:$('#content').offset().top}, 'slow');
		}
   	});

   	$('#button-image').on('click', function() {
   		$('#modal-image').remove();
   
   		$.ajax({
   			url: 'index.php?route=sellerproduct/filemanager&target=input-image&thumb=thumb-image',
   			dataType: 'html',
   			success: function(html) {
   				$('body').append('<div id="modal-image" class="modal">' + html + '</div>');
   
   				$('#modal-image').modal('show');
   			}
   		});
   	});

   	$('button[data-event=\'showImageDialog\']').attr('data-toggle', 'image').removeAttr('data-event');

   	$(document).delegate('button[data-toggle=\'image\']', 'click', function() {
	   	$('#modal-image').remove();
	   
	   	$.ajax({
	   		url: 'index.php?route=sellerproduct/filemanager&token=' + getURLVar('token'),
	   		dataType: 'html',
	   		beforeSend: function() {
	   			$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
	   			$('#button-image').prop('disabled', true);
	   		},
	   		complete: function() {
	   			$('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
	   			$('#button-image').prop('disabled', false);
	   		},
	   		success: function(html) {
	   			$('body').append('<div id="modal-image" class="modal">' + html + '</div>');
	   
	   			$('#modal-image').modal('show');
	   		}
	   	});
   });

   	// Image Manager
    $(document).delegate('a[data-toggle=\'image\']', 'click', function(e) {
	   	e.preventDefault();
	   
	   	var element = this;
	   
	   	$(element).popover({
	   		html: true,
	   		placement: 'right',
	   		trigger: 'manual',
	   		content: function() {
	   			return '<button type="button" id="button-image" class="btn btn-primary"><i class="fa fa-pencil"></i></button> <button type="button" id="button-clear" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>';
   			}
   		});
   
	   	$(element).popover('toggle');
	   
	   	$('#button-image').on('click', function() {
	   		$('#modal-image').remove();
	   
	   		$.ajax({
	   			url: 'index.php?route=sellerproduct/filemanager&token=' + getURLVar('token') + '&target=' + $(element).parent().find('input').attr('id') + '&thumb=' + $(element).attr('id'),
	   			dataType: 'html',
	   			beforeSend: function() {
	   				$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
	   				$('#button-image').prop('disabled', true);
	   			},
	   			complete: function() {
	   				$('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
	   				$('#button-image').prop('disabled', false);
	   			},
	   			success: function(html) {
	   				$('body').append('<div id="modal-image" class="modal">' + html + '</div>');
	   
	   				$('#modal-image').modal('show');
	   			}
	   		});
	   
	   		$(element).popover('hide');
	   	});
   	});

	$('select').on('change', function() {
       var top = this.value;
       if(top == 6){
   	      $('#adv-size').html('Please Uplaod image size 230*1320');
       } else {
          $('#adv-size').html('Please Uplaod image size 1320*230');
       }
   });
});
