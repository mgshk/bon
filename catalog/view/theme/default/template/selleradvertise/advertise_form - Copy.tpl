
<?php echo $header; ?>

<link rel="stylesheet" href="crop/cropper.css">
  <link rel="stylesheet" href="crop/main.css">
  
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>



<link href="admin/view/javascript/summernote/summernote.css" rel="stylesheet">
<script type="text/javascript" src="admin/view/javascript/summernote/summernote.js"></script>

<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
  <div class="page-header">
    <div class="container-fluid">
      <!--<div class="pull-right">
        <button type="submit" form="form-advertise" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>-->
      <h1><?php echo $heading_title; ?></h1>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-advertise" class="form-horizontal"> 
	<input type="hidden" name="status" value="" id="status" />
		  <div class="form-group">
			<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
			<div class="col-sm-10">
			  <input type="text" name="offer_title" value="<?php echo $offer_title; ?>" placeholder="<?php echo $entry_name; ?>" id="offer_title" class="form-control" />
			  <?php if (isset($error_offer_title)) { ?>
			  <div class="text-danger"><?php echo $error_offer_title; ?></div>
			  <?php } ?>
			</div>
		  </div>
		  <div class="form-group ">
			<label class="col-sm-2 control-label" for="position"><?php echo $entry_position; ?></label>
			<div class="col-sm-10">
			<?php 
			$options = array("Home - Top banner", "Home - National", "Home - State", "Home - Distict", "Home - Area", "Home - Right", "Store Ads free");						
			?>
			<select class="form-control" name="position" id="position">
				<option value="">Select your Advertise Postion</option>
				<?php 
				foreach ($options as $key => $option) {
					 $selected = (($key+1) == $position) ? "selected = selected" : "";
					echo "<option value=\"" . ($key+1) . "\"".$selected.">" . $option . "</option>";
				}
				?>
			</select>			
			  <?php if (isset($error_position)) { ?>
			  <div class="text-danger"><?php echo $error_position; ?></div>
			  <?php } ?>
			</div>
		  </div>
		  <div class="form-group">
			<label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label><span id="adv-size"></span>
			<div class="col-sm-10">
			  
			  <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
			  <input type="hidden" name="offer_image" value="<?php echo $offer_image; ?>" id="input-image" />
			</div>
		  </div>
		  <div class="col-md-12">
			  <div class="img-container">
				<img src="image/logo.jpg" alt="Picture">
			  </div>
		  </div>

		      <div class="row" id="actions">
			<div class="col-md-9 docs-buttons">
				<div class="btn-group">
					  <button type="button" class="btn btn-primary" data-method="reset" title="Reset">
					    <span class="docs-tooltip" data-toggle="tooltip" title="cropper.reset()">
					      <span class="fa fa-refresh"></span>
					    </span>
					  </button>
					  <label class="btn btn-primary btn-upload" for="inputImage" title="Upload image file">
					    <input type="file" class="sr-only" id="inputImage" name="file" accept=".jpg,.jpeg,.png,.gif,.bmp,.tiff">
					    <span class="docs-tooltip" data-toggle="tooltip" title="Import image with Blob URLs">
					      <span class="fa fa-upload"></span>
					    </span>
					  </label>
					  <!--<button type="button" class="btn btn-primary" data-method="destroy" title="Destroy">
					    <span class="docs-tooltip" data-toggle="tooltip" title="cropper.destroy()">
					      <span class="fa fa-power-off"></span>
					    </span>
					  </button>-->
					</div>

					<div class="btn-group btn-group-crop">
					  <!--<button type="button" class="btn btn-primary" data-method="getCroppedCanvas">
					    <span class="docs-tooltip" data-toggle="tooltip" title="cropper.getCroppedCanvas()">
					      Get Cropped Canvas
					    </span>
					  </button>-->
					  
						  <button type="button" class="btn btn-primary" data-method="getCroppedCanvas" data-option="{ &quot;width&quot;: 920, &quot;height&quot;: 230 }">
					    <span class="docs-tooltip" data-toggle="tooltip" title="cropper.getCroppedCanvas({ width: 920, height: 230 })">
					      Get Image
					    </span>
					  </button>
					</div>
			</div>
		     </div>
		  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-description"><?php echo $entry_description; ?></label>
                    <div class="col-sm-10">
                      <textarea rows="6" style="width:100%;" name="offer_desc" placeholder="<?php echo $entry_description; ?>" id="input-description"><?php echo isset($offer_desc) ? $offer_desc : ''; ?></textarea>
                    </div>
                  </div>
		  <div class="form-group">
			<label class="col-sm-2 control-label" for="offer_url"><?php echo $entry_link; ?></label>
			<div class="col-sm-10">
			  <input type="text" name="offer_url" value="<?php echo $offer_url; ?>" placeholder="<?php echo $entry_link; ?>" id="offer_url" class="form-control" />
			  <p>(Ex: http://connectivelinkstechnology.com/demo/bon1/)</p>
			</div>
		  </div>
		  <div class="form-group" style="display: none;">
			<label class="col-sm-2 control-label" for="sort_order"><?php echo $entry_sort_order; ?></label>
			<div class="col-sm-10">
			  <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" id="sort_order" class="form-control" />
			</div>
		  </div>
		  <div class="pull-right">
			  <button id="save" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary">Save</i></button>
			  <button id="submitt" data-toggle="tooltip" title="<?php echo $button_submit; ?>" class="btn btn-primary">Submit</button>
			  <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default">Cancel</a></div>
		</div>
        </form>
      </div>
    </div>
  </div>
</div>
</div>
</div></div>

<!-- Show the cropped image in modal -->
        <div class="modal fade docs-cropped" id="getCroppedCanvasModal" role="dialog" aria-hidden="true" aria-labelledby="getCroppedCanvasTitle" tabindex="-1">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="getCroppedCanvasTitle">Cropped</h4>
              </div>
              <div class="modal-body"></div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <a class="btn btn-primary" id="download" href="javascript:void(0);" download="cropped.jpg">Download</a>
              </div>
			  <span id="ttt"></span>
            </div>
          </div>
        </div><!-- /.modal -->
     <?php echo $footer; ?>

 
  <script src="crop/cropper.js"></script>
  <script src="crop/main.js"></script> 
  <script type="text/javascript">	
	$(document).ready(function(){
		$('#save').click(function(){
		$('input#status').val('draft');
		    $("form").submit(function(){
		    });
		});
	});
	$(document).ready(function(){
		$('#submitt').click(function(){
		$('input#status').val('submitted');
		    $("form").submit(function(){
		    });
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

		$('#button-clear').on('click', function() {
			$(element).find('img').attr('src', $(element).find('img').attr('data-placeholder'));

			$(element).parent().find('input').attr('value', '');

			$(element).popover('hide');
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
</script>
