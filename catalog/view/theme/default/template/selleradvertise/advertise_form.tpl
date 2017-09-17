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
                          <input type="hidden" name="offer_image_original" value="<?php echo $offer_image_original; ?>" id="offer_image_original" />
                        </div>
                     </div>
		                
                     <div style="width: 50%;">
                        <div style="width: 300px;">
                           <div id="img-containers" class="img-containers"></div>
                        </div>
                     </div>
                     
                     <div class="col-md-12">
                        <div class="form-group row <?php if(!isset($_GET['advertise_id'])) { echo 'hide'; } ?>" id="cropping-panel">
                      			<div class="col-sm-2"></div>
                      			<div class="col-sm-10">
                      			   <div class="crr-img-bttt"><button class="crr-img-bt" type="button" id="getCropped"><i class="fa fa-crop"></i> Crop</button></div>
                      			</div>
                           <label class="col-sm-2 control-label" for="input-image">Cropped image: </label><span id="adv-size"></span>
                           <div class="col-md-10 docs-buttons">                              
                              <div class="btn-group btn-group-crop">                                 
                          				 <span style="margin-bottom:10px;">Please ensure cropped image is of better quality before submitting.</span>
                                    <div id="croppedImage">
                            				 <?php //if(!isset($_GET['advertise_id'])) { ?>
                            					<img class="img-responsive" src="image/bg-empty1.png" alt="Temp">
                            				 <?php //} else { ?>
                            					<!-- <img src="image/<?php echo $offer_image; ?>" alt="<?php echo $offer_title; ?>"> -->
                            				 <?php //} ?>
                          				 </div>
                                    <div class="extra-preview extra-preview-sm"></div>
                          				 <input type="hidden" name="image_crop" value="" id="image_crop" class="form-control" />
                              </div>
                           </div>
                        </div>
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

<script type="text/javascript">	
   $(document).ready(function(){
	$('#agree_tt').change(function() {
	if($(this).is(":checked")) {
		$('input#agree').val('agree');
	} else {
		$('input#agree').val('not_agree');
	}
	});


   	$('#save').click(function(){
		if ($('input[name="agree_tt"]').is(':checked')) {
			if($('input#offer_title').val() != ''){
				$('input#status').val('draft');
				$("form").submit(function(){
				});
			} else {
				$('.alert').remove();
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> Title must be greater than 3 and less than 255 characters!</div>');	
				$('body, html').animate({scrollTop:$('#content').offset().top}, 'slow');
				return false;
			}
		} else {
			$('.alert').remove();
			$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> Please agree to the terms and conditions mentioned and then save.</div>');	
			$('body, html').animate({scrollTop:$('#content').offset().top}, 'slow');
			return false;
		}
   	});
	
	
   	$('#submitt').click(function(){	
		if ($('input[name="agree_tt"]').is(':checked')) {
			if($('input#offer_title').val() != ''){
				$('input#status').val('submitted');
				$("form").submit(function(){
				});
			} else {
				$('.alert').remove();
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> Title must be greater than 3 and less than 255 characters!</div>');	
				$('body, html').animate({scrollTop:$('#content').offset().top}, 'slow');
				return false;
			}
		} else {
			$('.alert').remove();
			$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>Please agree to the terms and conditions mentioned and then save.</div>');	
			$('body, html').animate({scrollTop:$('#content').offset().top}, 'slow');
			return false;
		}
   	});
	
   });
     
</script>
<script type="text/javascript">
   $('#input-descriptio').summernote({height: 300});
</script>
<script type="text/javascript">
   // Override summernotes image manager
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
   
   $('#button-image').on('click', function() {
   		$('#modal-image').remove();
   
   		$.ajax({
   			url: 'index.php?route=sellerproduct/filemanager&target=input-image&thumb=thumb-image',
   			//url: 'index.php?route=sellerproduct/filemanager&token=' + getURLVar('token') + '&target=' + $(element).parent().find('input').attr('id') + '&thumb=' + $(element).attr('id'),
   			dataType: 'html',
   			beforeSend: function() {
   				//$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
   				//$('#button-image').prop('disabled', true);
   			},
   			complete: function() {
   				//$('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
   				//$('#button-image').prop('disabled', false);
   			},
   			success: function(html) {
   				$('body').append('<div id="modal-image" class="modal">' + html + '</div>');
   
   				$('#modal-image').modal('show');
   			}
   		});
   
   		//$(element).popover('hide');
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
   
   	$('#button-image').on('click', function() {//alert(24234);
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
   
   	$('#button-clear').on('click', function() {
   		//$(element).find('img').attr('src', $(element).find('img').attr('data-placeholder'));
   
   		//$(element).parent().find('input').attr('value', '');
   
   		//$(element).popover('hide');
   	});
   });
   
</script>
<script>
   $('select').on('change', function() {
       var top = this.value;
       if(top == 6){
   	$('#adv-size').html('Please Uplaod image size 230*1320');
       } else {
           $('#adv-size').html('Please Uplaod image size 1320*230');
       }
     //alert( this.value );
   })
   
  //  $(function () {
   
  //      (function () {
  //          var canvas = 0;
  //          var $image = $('.img-containers > img'),
  //              options = {
  //  		viewMode: 0, 
  //  		//dragMode: 'move',
  //  		aspectRatio: 10/1.5,
  //  		data: null,
  //  		preview: '',
  //  		responsive: true,
  //  		restore: true,
  //  		checkCrossOrigin: true,
  //  		checkOrientation: true,
  //  		modal: true,
  //  		guides: true,
  //  		center: true,
  //  		highlight: true,
  //  		background: true,
  //  		autoCrop: true,
  //  		autoCropArea: 1,
  //  		movable: true,
  //  		rotatable: true,
  //  		scalable: true,
  //  		zoomable: false,
  //  		zoomOnTouch: true,
  //  		zoomOnWheel: true,
  //  		wheelZoomRatio: 0.1,
  //  		cropBoxMovable: true,
  //  		cropBoxResizable: false,
  //  		toggleDragModeOnDblclick: false,
   
  //  		  // Size limitation
  //  		  minCanvasWidth: 0,
  //  		  minCanvasHeight: 0,
  //  		  minCropBoxWidth: 0,
  //  		  minCropBoxHeight: 0,
  //  		  minContainerWidth: 100,
  //  		  minContainerHeight: 100,
   
  //  		  // Shortcuts of events
  //  		  ready: null,
  //  		  cropstart: null,
  //  		  cropmove: null,
  //  		  cropend: null,
  //  		  crop: null,
  //  		  zoom: null,
  //                  crop: function (data) {}
  //              };
   
  //          var $preview = $(".preview"),
  //              width = $preview.width();
   
  //          $image.on().cropper(options);
   
  //          var $inputImage = $('#inputImage'),
  //              URL = window.URL || window.webkitURL,
  //              blobURL;
   
  //          if (URL) {
  //              $inputImage.change(function () {
  //                  var files = this.files,
  //                      file;
  //                  if (files && files.length) {
  //                      file = files[0];
   
  //                      if (/^image\/\w+$/.test(file.type)) {
  //                          blobURL = URL.createObjectURL(file);
  //                          $image.one('built.cropper', function () {
  //                              URL.revokeObjectURL(blobURL);
  //                          }).cropper('reset', true).cropper('clear').cropper('replace', blobURL);
  //                          $("#main-container").show();
  //                          $inputImage.val('');
  //                      } else {
  //                          showMessage('Please choose an image file.');
  //                      }
  //                  }
  //              });
  //          } else {
  //              $inputImage.parent().remove();
  //          }
   
  //  	$(function() {
   
  //  	$(".cropper").cropper({
   
  //  	preview: ".extra-preview" // A jQuery selector string, add extra elements to show preview.
   
  //  	});
   
  //  	})
   
  //          $("#getCropped").click(function (e) {
		// $('#croppedImage').html('');
  //  		$('#croppedImage').html($image.cropper('getCroppedCanvas', {
  //                  width: 993,
  //                  height: 182
  //              }));
  //  		var canvas = $("canvas");
   
  //  		var dataURL = canvas.get(0).toDataURL();
  //  		//var img = $("<img id='image_can' width='993' height='182' style='border:1px solid #ccc'></img>");
		// var img = $("<img id='image_can' class='img-responsive' style='border:1px solid #ccc'></img>");
  //  		img.attr("src", dataURL);
   
  //  		canvas.replaceWith(img);
   
  //  		$("#string_imge").val(dataURL);
   		
  //       var resut_str = dataURL.replace("data:image/png;base64,", "");
  //  		$("#image_crop").attr("value",resut_str);
   	   
  //          });
   	
  //      }());
   
 //  });   
</script>
<?php echo $footer; ?>