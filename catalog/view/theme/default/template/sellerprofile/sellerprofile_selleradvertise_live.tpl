<div class="col-sm-12">
<p><i class="fa fa-trash-o"></i> - Move to trash</p>
<p><i class="fa fa-arrows-alt"></i> - Open</p>
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
                        <h2><?php echo utf8_substr($advetise['offer_title'],0,30); ?></h2>
                        <a class="info" data-toggle="modal" data-target="#myModalad_live_<?php echo $advetise['advertise_id']; ?>" ><i class="fa fa-arrows-alt"></i></a>
			<a class="info" id="ads_delete_live_<?php echo $advetise['advertise_id']; ?>"><i class="fa fa-trash-o"></i></a>
                     </div>
		     <div class="col-sm-12 filtered_ads">
			<?php if($advetise['position'] == 1) { ?>
				In Top Banner, Pos: <?php echo $advetise['advertise_position']; ?>, Price: <?php echo $advetise['price']; ?> Rs, Days left: <?php echo $advetise['days_left']; ?>
			<?php } elseif($advetise['position'] == 2) { ?>
				In Country tab, Pos:  <?php echo $advetise['advertise_position']; ?>, Price: <?php echo $advetise['advertise_amt_pos']; ?>, Days left: <?php echo $advetise['days_left']; ?>
			<?php } elseif($advetise['position'] == 3) { ?>
				In State tab, Pos:  <?php echo $advetise['advertise_position']; ?>, Price: <?php echo $advetise['advertise_amt_pos']; ?>, Days left: <?php echo $advetise['days_left']; ?>
			<?php } elseif($advetise['position'] == 4) { ?>
				In City tab, Pos:  <?php echo $advetise['advertise_position']; ?>, Price: <?php echo $advetise['advertise_amt_pos']; ?>, Days left: <?php echo $advetise['days_left']; ?>
			<?php } elseif($advetise['position'] == 5) { ?>
				In Nearby tab, Pos:  <?php echo $advetise['advertise_position']; ?>, Price: <?php echo $advetise['advertise_amt_pos']; ?>, Days left: <?php echo $advetise['days_left']; ?>, Area covered: <?php echo $advetise['km']; ?> kms
			<?php } elseif($advetise['position'] == 6) { ?>
				In Your Page
			<?php } ?>
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
<div class="modal fade" id="myModalad_live_<?php echo $advetise['advertise_id']; ?>" role="dialog">
 <div class="modal-dialog">
	<div class="modal-content loc-pop">
	   <div class="modal-header">
		  <button type="button" class="close" data-dismiss="modal">&times;</button>
		  <h4 class="modal-title loc-share-title">Advertise Details</h4>
	   </div>
	   <div class="modal-body loc-share-topps">
		   <h4><strong></strong><?php echo $advetise['offer_title']; ?></h4>
		   <img src="image/<?php echo $advetise['offer_image_original']; ?>" alt="<?php echo $advetise['offer_title']; ?>" class="img-thumbnail img-responsive" />
		   <p><strong></strong><?php echo $advetise['offer_desc']; ?></p>
		   <p><strong></strong><a href="<?php echo $advetise['offer_link']; ?>" target="_blank"><?php echo $advetise['offer_link']; ?></a></p>
	   </div>
	</div>
 </div>
</div>
<?php } ?>
<?php } ?>
<?php if (!empty($advetises)) { ?>
 <?php foreach ($advetises as $advetise) { ?>
<script>
$('#ads_delete_live_<?php echo $advetise['advertise_id']; ?>').on('click', function() {
var modal = $('<div id="myModal_<?php echo $advetise['advertise_id']; ?>" class="modal alert_prof_del_close_can fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h3 id="myModalLabel3">Confirmation</h3></div><div class="modal-body"><p>Are you sure you want to move this to trash ?</p><p>Please be aware amount will not be refunded on deleting paid advertisement. Would you like to proceed anyway?</p></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button><button class="btn-primary btn cancels">Yes</button></div></div></div></div>');			

$('body').append(modal);
	modal.modal({
	show: true
})

$('.cancels').on('click', function(e) {
var adss = <?php echo $advetise['advertise_id']; ?>;
if(adss)
	 {
	 $.ajax({
		url: 'index.php?route=sellerprofile/sellerprofile/trash&func=live&advertise_id='+adss,
		type: 'post',
		dataType: 'json',
		success: function(json) {
			if (json['success']) {
				
				//window.location="index.php?route=sellerprofile/sellerprofile&tab_section=store";

				$('.alert_prof_del_close_can').modal('hide');

				$('#sellerlive').load('index.php?route=sellerprofile/sellerprofile/selleradvertiselive&seller_id=<?php echo $seller_id; ?>');
				$('#sellerlivecount').html(json['count']);
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

