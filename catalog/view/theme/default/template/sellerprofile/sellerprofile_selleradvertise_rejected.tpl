
<div class="col-sm-12">
<p><i class="fa fa-trash-o"></i> - Move to trash</p>
<p><i class="fa fa-pencil"></i> - Edit</p>
<p><i class="fa fa-reply"></i> - Rejected reason</p>
<br>
</div>
<div class="col-sm-12">
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
                        <h2><?php echo $advetise['offer_title']; ?></h2>
                        <a class="info" data-toggle="modal" data-target="#myModalad_rejected_<?php echo $advetise['advertise_id']; ?>" ><i class="fa fa-reply"></i></a>
			<a class="info" href="<?php echo $advetise['edit']; ?>"><i class="fa fa-pencil"></i></a>
			<a class="info" id="ads_delete_rejected<?php echo $advetise['advertise_id']; ?>"><i class="fa fa-trash-o"></a>
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
<div class="modal fade" id="myModalad_rejected_<?php echo $advetise['advertise_id']; ?>" role="dialog">
 <div class="modal-dialog">
	<div class="modal-content loc-pop">
	   <div class="modal-header">
		  <button type="button" class="close" data-dismiss="modal">&times;</button>
		  <!-- <h4 class="modal-title loc-share-title">Advertise Details</h4> -->
	   </div>
	   <div class="modal-body loc-share-top">
	   <h3><?php echo $advetise['offer_title']; ?></h3>
		  <?php if ($advetise['image_tumb']) { ?>
		       <img src="<?php echo $advetise['image_tumb']; ?>" alt="<?php echo $advetise['offer_title']; ?>" class="img-thumbnail img-responsive" />
		       <?php } else { ?>
		       <span class="img-thumbnail list"><i class="fa fa-camera fa-2x"></i></span>
		       <?php } ?>
		      <p><?php echo $advetise['offer_desc']; ?></p>
		      <p><?php echo $advetise['offer_link']; ?></p>
		      <p><strong>Reason:</strong><span style="color:red"><?php echo $advetise['remarks']; ?></span></p>
		      <p>Please make corrections and re-submit again...</p>
	   </div>
	</div>
 </div>
</div>
<?php } ?>
<?php } ?>

<?php if (!empty($advetises)) { ?>
 <?php foreach ($advetises as $advetise) { ?>
<script>
$('#ads_delete_rejected<?php echo $advetise['advertise_id']; ?>').on('click', function() {
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
		url: 'index.php?route=sellerprofile/sellerprofile/trash&func=rejected&advertise_id='+adss,
		type: 'post',
		dataType: 'json',
		success: function(json) {
			if (json['success']) {
				
				//window.location="index.php?route=sellerprofile/sellerprofile&tab_section=store";

				$('.alert_prof_del_close_can').modal('hide');


				$('#sellerrejected').load('index.php?route=sellerprofile/sellerprofile/selleradvertiserejected&seller_id=<?php echo $seller_id; ?>');
				$('#sellerrejectedcount').html(json['count']);
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

