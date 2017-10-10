<?php echo $header; ?>

<link  href="catalog/view/javascript/croppie/croppie.css" rel="stylesheet">
<script src="catalog/view/javascript/croppie/croppie.min.js"></script>
<script src="catalog/view/javascript/advertise/advertise.js"></script>

<link href="admin/view/javascript/summernote/summernote.css" rel="stylesheet">
<script type="text/javascript" src="admin/view/javascript/summernote/summernote.js"></script>

<div class="container-fluid">
   <div class="row">
      <?php echo $column_left; ?>
      <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-sm-6'; ?>
      <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-sm-9'; ?>
      <?php } else { ?>
      <?php $class = 'col-sm-12'; ?>
      <?php } ?>
      
      <div id="content" class="<?php echo $class; ?>">
         <?php echo $content_top; ?>
         <div class="page-header">
            <div class="container-fluid">
                <?php
                  $advertise_id_edit = (isset($_GET['advertise_id']) && $_GET['advertise_id'] !='') ? 
                      $_GET['advertise_id'] : '';

                  if($advertise_id_edit) {
      	             echo '<h3>Edit advertisment</h3>';
      	         } else {
      	             echo '<h3>New advertisement</h3>';
      	         } 
                ?>
            </div>
         </div>
         <div class="container-fluid">
            <?php
          	    if($image_empty_error) {?>
                      <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $image_empty_error; ?>
                         <button type="button" class="close" data-dismiss="alert">&times;</button>
                      </div>
                <?php } elseif($error_offer_title) { ?>
          	    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_offer_title; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
          	    <?php } elseif($error_agree) { ?>
          	    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_agree; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
      	    <?php } ?>
            <div class="panel panel-default">
               <div class="panel-body">
                  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-advertise" class="form-horizontal">
                     <input type="hidden" name="status" value="" id="status" />
                     <input type="hidden" name="advertise_id" id="advertise_id" value="<?php echo $advertise_id_edit; ?>" />
                     <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?>: </label>
                        <div class="col-sm-10">
                           <input type="text" name="offer_title" value="<?php echo $offer_title; ?>" placeholder="<?php echo $entry_name; ?>" id="offer_title" class="form-control" />
                        </div>
                     </div>
                     <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-image">Upload advertisement image: </label>
                        <span id="adv-size"></span>
                        <div class="col-sm-10">
                          <a href=""  style="display:none;" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>"/></a>
                          <button type="button" id="button-image" class="btn btn-primary"><i class="fa fa-pencil"></i></button>
                          <input type="hidden" name="offer_image" value="<?php echo $offer_image_original; ?>" id="input-image" />
                          <input type="hidden" name="offer_image_original" value="image/<?php echo $offer_image_original; ?>" id="offer_image_original" />
                        </div>
                     </div>

                     <div class="form-group">
                        <label class="col-sm-2 control-label"> </label>
                        <div class="col-sm-10 rel">
                          <div id="img-containers" class="img-containers"></div>

                          <div class="crr-img-bttt"><button class="crr-img-bt" type="button" id="getCropped"><i class="fa fa-crop"></i> Crop</button></div>

                          <div class="btn-group btn-group-crop cropedimg">                                 
                             <span style="margin-bottom:10px;">Please ensure cropped image is of better quality before submitting.</span>
                              <div id="croppedImage">
                                <img class="img-responsive" src="image/bg-empty1.png" alt="Temp">
                             </div>
                              <div class="extra-preview extra-preview-sm"></div>
                             <input type="hidden" name="image_crop" value="" id="image_crop" class="form-control" />
                          </div>

                        </div>
                     </div>
		                
                     <!-- <div style="width: 50%;">
                        <div style="width: 300px;">
                           <div id="img-containers" class="img-containers"></div>
                        </div>
                     </div> -->
                     
                     <div class="col-md-12">
                        <!-- <div class="form-group row <?php if(empty($advertise_id_edit)) { echo 'hide'; } ?>" id="cropping-panel">
                      			<div class="col-sm-2"></div>
                      			<div class="col-sm-10">
                      			   <div class="crr-img-bttt"><button class="crr-img-bt" type="button" id="getCropped"><i class="fa fa-crop"></i> Crop</button></div>
                      			</div>
                           <label class="col-sm-2 control-label" for="input-image">Cropped image: </label><span id="adv-size"></span>
                           <div class="col-md-10 docs-buttons">                              
                              <div class="btn-group btn-group-crop">                                 
                          				 <span style="margin-bottom:10px;">Please ensure cropped image is of better quality before submitting.</span>
                                    <div id="croppedImage">
                            					<img class="img-responsive" src="image/bg-empty1.png" alt="Temp">
                          				 </div>
                                    <div class="extra-preview extra-preview-sm"></div>
                          				 <input type="hidden" name="image_crop" value="" id="image_crop" class="form-control" />
                              </div>
                           </div>
                        </div> -->
                        <div class="form-group">
                           <label class="col-sm-2 control-label" for="input-description"><?php echo $entry_description; ?>: </label>
                           <div class="col-sm-10">
                              <textarea style="height: 100px;" name="offer_desc" placeholder="<?php echo $entry_description; ?>" id="input-description"><?php echo isset($offer_desc) ? $offer_desc : ''; ?></textarea>
                           </div>
                        </div>
                        <div class="form-group">
                           <label class="col-sm-2 control-label" for="offer_url">Url<?php //echo $entry_link; ?>: </label>
                           <div class="col-sm-10">
                              <input type="text" name="offer_url" value="<?php echo $offer_url; ?>" placeholder="http://domain.com" id="offer_url" class="form-control" />
                           </div>
                        </div>
                        <div class="form-group" style="display: none;">
                           <label class="col-sm-2 control-label" for="sort_order"><?php echo $entry_sort_order; ?></label>
                           <div class="col-sm-10">
                              <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" id="sort_order" class="form-control" />
                           </div>
                        </div>
                  			<div class="form-group">
                                             <label class="col-sm-12" for="agree_tt" style="font-weight: bold;"><input type="hidden" name="agree" value="not_agree" id="agree">
                  			   <input type="checkbox" name="agree_tt" value="agree" id="agree_tt"> I hereby declare that the advertisement detail furnished above are true and permissible to publish in public. I take the sole responsibility of the advertisement image quality rendered in any customer device.</label></div>
                        <div class="pull-right">
			                   <?php if(!$submitted) { ?>
                           <button id="save" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary">Save</button>
			                     <?php } ?>
                           <button id="submitt" data-toggle="tooltip" title="<?php echo $button_submit; ?>" class="btn btn-primary">Submit</button>
                           <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default">Cancel</a>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>

<?php echo $footer; ?>