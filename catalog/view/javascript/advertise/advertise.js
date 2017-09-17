$(document).ready(function() {

	var advertise_id = $('#advertise_id').val();
	var advertise_image = $('#offer_image_original').val();

	if(advertise_id) {
		$uploadCrop = $('.img-containers').croppie({
			url: advertise_image,
		    enableExif: false,
		    viewport: {
		        width: 993,
		        height: 182
		    },
		    boundary: {
		        width: 1000,
		        height: 200
		    },
		    enforceBoundary: true,
		    zoom: 0
		});
	}

	$('body').on('click', 'a.thumbnail', function(e) {
		$uploadCrop = $('.img-containers').croppie({
			url: $(this).attr('href'),
		    enableExif: false,
		    viewport: {
		        width: 993,
		        height: 182
		    },
		    boundary: {
		        width: 1000,
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
			size: 'viewport',
			format: 'jpeg'
	  	}).then(function (resp) {

	  		$('#croppedImage img').attr('src', resp);
	  		var resut_str = resp.replace("data:image/jpeg;base64,", "");
	  		$("#image_crop").attr("value", resut_str);
	 	});

	 	return false;
	}); 
});
