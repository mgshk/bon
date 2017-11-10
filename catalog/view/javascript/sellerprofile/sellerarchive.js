$(document).ready(function() {

	$(document).on('click', '#copy_adv', function() {

		var advertise_id = $(this).data('advertiseId');
		var seller_id = $(this).data('sellerId');

	    $.ajax({
	    	cache: false,
	       	url: 'index.php?route=sellerprofile/sellerprofile/copy&advertise_id='+advertise_id,
	       	dataType: 'json',
	       	success: function(data) {

	       		if (data['error'] === 0) {
	       			$('#sellerapprovedcount').html(data['approved_count']);
					$('#sellerarchivecount').html(data['archive_count']);

					$('#sellerapproved').load('index.php?route=sellerprofile/sellerprofile/selleradvertiseapproved&seller_id='+seller_id);
	       		}	

	       		$('#result').html(data['msg']);
	       		$('#confirm_dialog').modal('show');
	       	}
	    });

		return false;
	});
});