<div class="col-sm-12">
	<p><i class="fa fa-trash-o"></i> - Move to trash</p>
	<p><i class="fa fa-files-o"></i> - Renew. (Moves a copy to 'Approved' tab)</p>
	<p><i class="fa fa-arrows-alt"></i> - Open</p>
	<br>
</div>
<div class="col-sm-12">
	<p id="archiveErrorMsg" style="display:none;"></p>
	<?php if (!empty($advetises)) { ?>
	<?php foreach ($advetises as $advetise) { ?>
	<div class="col-sm-9">
		<div class="row">
			<div class="hovereffect">
				<?php if ($advetise['image']) { ?>
				<img src="<?php echo $advetise['image']; ?>" alt="<?php echo $advetise['offer_title']; ?>" class="img-thumbnail img-responsive" />
				<?php } else { ?>
				<span class="img-thumbnail list"><i class="fa fa-camera fa-2x"></i></span>
				<?php } ?>
				<div class="overlay adv--ress">
					<input id="ads_id" type="hidden" value="<?php echo $advetise['advertise_id']; ?>">
					<input id="seller_id" type="hidden" value="<?php echo $advetise['seller_id']; ?>">
					<h2><?php echo utf8_substr($advetise['offer_title'],0,30); ?></h2>
					<a class="info" data-toggle="modal" data-target="#myModalad_archive_<?php echo $advetise['advertise_id']; ?>" ><i class="fa fa-arrows-alt"></i></a>
					<a class="info" id="copy_adv"><i class="fa fa-files-o"></i></a>
					<a class="info" id="ads_delete_archive<?php echo $advetise['advertise_id']; ?>"><i class="fa fa-trash-o"></i></a>
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-3"></div>
	<?php } ?>
	<?php } else { ?><?php echo $text_no_results; ?>
	<?php } ?>
</div>
<div class="row">
	<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
	<div class="col-sm-6 text-right"><?php echo $results; ?></div>
</div>
<?php if (!empty($advetises)) { ?>
<?php foreach ($advetises as $advetise) { ?>
<div class="modal fade" id="myModalad_archive_<?php echo $advetise['advertise_id']; ?>" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content loc-pop">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<!-- <h4 class="modal-title loc-share-title">Advertise Details</h4> -->
			</div>
			<div class="modal-body loc-share-topps">
				   <h4><strong></strong><?php echo $advetise['offer_title']; ?></h4>
				   <img src="image/<?php echo $advetise['offer_image_original']; ?>" alt="<?php echo $advetise['offer_title']; ?>" class="img-thumbnail img-responsive" />
				   <p><strong></strong><?php echo $advetise['offer_desc']; ?></p>
				   <p><strong></strong><a href="<?php echo $advetise['offer_link']; ?>"><?php echo $advetise['offer_link']; ?></a></p>
			   </div>
		</div>
	</div>
</div>
<?php } ?>
<?php } ?>


<div id="confirm_dialog" tabindex="-1" role="dialog" class="modal fade" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
				<h3 id="myModalLabel3">Confirmation</h3>
			</div>
			<div class="modal-body">
				<p id="result"></p>
			</div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Ok</button>
			</div>
		</div>
	</div>
</div>


<?php if (!empty($advetises)) { ?>
<?php foreach ($advetises as $advetise) { ?>
<script>
	$('#ads_delete_archive<?php echo $advetise['advertise_id']; ?>').on('click', function() {
	var modal = $('<div id="myModal_<?php echo $advetise['advertise_id']; ?>" class="modal alert_prof_del_close_can fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h3 id="myModalLabel3">Confirmation</h3></div><div class="modal-body"><p>Are you sure you want to move this to trash..</p></p></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button><button class="btn-primary btn cancels">Yes</button></div></div></div></div>');			

		$('body').append(modal);
			modal.modal({
			show: true
		})

		$('.cancels').on('click', function(e) {
		var adss = <?php echo $advetise['advertise_id']; ?>;
		if(adss)
		 {
		 $.ajax({
			url: 'index.php?route=sellerprofile/sellerprofile/trash&func=archive&advertise_id='+adss,
			type: 'post',
			dataType: 'json',
			success: function(json) {
				if (json['success']) {
					
					//window.location="index.php?route=sellerprofile/sellerprofile&tab_section=store";
					$('.alert_prof_del_close_can').modal('hide');
	
					$('#sellerarchive').load('index.php?route=sellerprofile/sellerprofile/selleradvertisearchive&seller_id=<?php echo $seller_id; ?>');
					$('#sellerarchivecount').html(json['count']);
					$('#sellertrashcount').html(json['trash_count']);
				}
				if(json['error_warning']) {
					$('#top-line-star').html('<i class="fa fa-times" aria-hidden="true"></i> ' + json['error_warning']);
				}
			}
		 });
		 }
	 });
	 });
</script>
<?php } ?>
<?php } ?>