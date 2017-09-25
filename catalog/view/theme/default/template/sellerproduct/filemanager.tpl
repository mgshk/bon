<div class="modal-dialog modal-lg">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" id="image_pop_cls" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      <h4 class="modal-title"><?php echo $heading_title; ?></h4>
    </div>
    <div class="modal-body">
      <div class="row">
        <div class="col-sm-5"><a href="<?php echo $parent; ?>"  title="<?php echo $button_parent; ?>" id="button-parent" class="btn btn-default"><i class="fa fa-level-up"></i></a> <a href="<?php echo $refresh; ?>"  title="<?php echo $button_refresh; ?>" id="button-refresh" class="btn btn-default"><i class="fa fa-refresh"></i></a>
          <button type="button"  title="<?php echo $button_upload; ?>" id="button-upload" class="btn btn-primary"><i class="fa fa-upload"></i></button>
          <button type="button"  title="<?php echo $button_folder; ?>" id="button-folder" class="btn btn-default"><i class="fa fa-folder"></i></button>
          <button type="button"  title="<?php echo $button_delete; ?>" id="button-delete" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>
        </div>
        <div class="col-sm-7">
          <div class="input-group">
            <input type="text" name="search" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_search; ?>" class="form-control">
            <span class="input-group-btn">
            <button type="button"  title="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary"><i class="fa fa-search"></i></button>
            </span></div>
        </div>
      </div>
      <hr />
      <?php foreach (array_chunk($images, 4) as $image) { ?>
      <div class="row">
        <?php foreach ($image as $image) { ?>
        <div class="col-sm-3 text-center">
          <?php if ($image['type'] == 'directory') { ?>
          <div class="text-center"><a href="<?php echo $image['href']; ?>" class="directory" style="vertical-align: middle;"><i class="fa fa-folder fa-5x"></i></a></div>
          <label>
            <input type="checkbox" name="path[]" value="<?php echo $image['path']; ?>" />
            <?php echo $image['name']; ?></label>
          <?php } ?>
          <?php if ($image['type'] == 'image') { ?>
          <a href="<?php echo $image['href']; ?>" class="thumbnail"><img src="<?php echo $image['thumb']; ?>" alt="<?php echo $image['name']; ?>" title="<?php echo $image['name']; ?>" /></a>
          <label>
            <input type="checkbox" name="path[]" value="<?php echo $image['path']; ?>" />
            <?php echo $image['name']; ?></label>
          <?php } ?>
        </div>
        <?php } ?>
      </div>
      <br />
      <?php } ?>
    </div>
    <div class="modal-footer">
    <?php echo $pagination; ?>    
    <p>Allowed file formates: 'jpg', 'jpeg', 'png', 'bmp'</p>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
<?php if ($target) { ?>
$('a.thumbnail').on('click', function(e) {
	e.preventDefault();

	<?php if ($thumb) { ?>
	$('#<?php echo $thumb; ?>').find('img').attr('src', $(this).find('img').attr('src'));
	<?php } ?>

	<?php if ($thumb) { ?>
		var maxWidth = "1048px"; // Max width for the image
		var maxHeight = "821px";    // Max height for the image
		var maxratio=maxHeight/maxWidth;
		var width = $('.img-containers').find('img').width();    // Current image width
		var height =$('.img-containers').find('img').height();  // Current image height
		var curentratio=height/width;
		// Check if the current width is larger than the max

		if(curentratio>maxratio)
		{
			ratio = maxWidth / width;   // get ratio for scaling image
			$(this).css("width", maxWidth); // Set new width
			$(this).css("height", height *ratio); // Scale height based on ratio
		}
		else
		{ 
			ratio = maxHeight / height; // get ratio for scaling image
			$('.img-containers').find('img').css("height", maxHeight);   // Set new height
			$('.img-containers').find('img').css("width", width * ratio);    // Scale width based on ratio
		}
 
	$('.img-containers').find('img').attr('src', $(this).attr('href'));
	$('#getCropped').css("display", "block");
	<?php } ?>

	$('#<?php echo $target; ?>').attr('value', $(this).parent().find('input').attr('value'));

	$('#modal-image').modal('hide');
});

<?php } else { ?>
// Get the current selection
var range = window.getSelection().getRangeAt(0);
var node = range.startContainer;
var startOffset = range.startOffset;  // where the range starts
var endOffset = range.endOffset;      // where the range ends

$('a.thumbnail').on('click', function(e) {
	e.preventDefault();

    // Create a new range from the orginal selection
    var range = document.createRange();
    range.setStart(node, startOffset);
    range.setEnd(node, endOffset);

    var img = document.createElement('img');
	img.src = $(this).attr('href');

	range.insertNode(img);

	$('#modal-image').modal('hide');
});
<?php } ?>

$('a.directory').on('click', function(e) {
	e.preventDefault();

	$('#modal-image').load($(this).attr('href'));
});

$('.pagination a').on('click', function(e) {
	e.preventDefault();

	$('#modal-image').load($(this).attr('href'));
});

$('#button-parent').on('click', function(e) {
	e.preventDefault();

	$('#modal-image').load($(this).attr('href'));
});

$('#button-refresh').on('click', function(e) {
	e.preventDefault();

	$('#modal-image').load($(this).attr('href'));
});

$('input[name=\'search\']').on('keydown', function(e) {
	if (e.which == 13) {
		$('#button-search').trigger('click');
	}
});

$('#button-search').on('click', function(e) {
	var url = 'index.php?route=sellerproduct/filemanager&directory=<?php echo $directory; ?>';

	var filter_name = $('input[name=\'search\']').val();

	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}

	<?php if ($thumb) { ?>
	url += '&thumb=' + '<?php echo $thumb; ?>';
	<?php } ?>

	<?php if ($target) { ?>
	url += '&target=' + '<?php echo $target; ?>';
	<?php } ?>

	$('#modal-image').load(url);
});
//--></script>
<script type="text/javascript"><!--
$('#button-upload').on('click', function() {
	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" value="" accept=".jpg, .jpeg, .png, .bmp"/></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);
			$('#image_pop_cls').prop('disabled', true);
			$.ajax({
				url: 'index.php?route=sellerproduct/filemanager/upload&directory=<?php echo $directory; ?>',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$('#button-upload i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
					$('#button-upload').prop('disabled', true);
				},
				complete: function() {
					$('#button-upload i').replaceWith('<i class="fa fa-upload"></i>');
					$('#button-upload').prop('disabled', false);
				},
				success: function(json) {
					if (json['error']) {
						$('#image_pop_cls').prop('disabled', false);
						var modal = $('<div id="alert_pop" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="first_conf"><div class="modal-body"><p>'+json['error']+'</p></p></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">Ok</button></div></div></div></div></div>');  
    
						   $('body').append(modal);
						     modal.modal({
						     show: true
						    }) 
						//alert(json['error']);
					}

					if (json['success']) {
						//alert(json['success']);
						$('#image_pop_cls').prop('disabled', false);
						var modal = $('<div id="alert_pop" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="first_conf"><div class="modal-body"><p>'+json['success']+'</p></p></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">ok</button></div></div></div></div></div>');  
    
						   $('body').append(modal);
						     modal.modal({
						     show: true
						    })

						$('#button-refresh').trigger('click');
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					$('#image_pop_cls').prop('disabled', false);
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});

$('#button-folder').popover({
	html: true,
	placement: 'bottom',
	trigger: 'click',
	title: '<?php echo $entry_folder; ?>',
	content: function() {
		html  = '<div class="input-group">';
		html += '  <input type="text" name="folder" value="" placeholder="<?php echo $entry_folder; ?>" class="form-control">';
		html += '  <span class="input-group-btn"><button type="button" title="<?php echo $button_folder; ?>" id="button-create" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></span>';
		html += '</div>';

		return html;
	}
});

$('#button-folder').on('shown.bs.popover', function() {
	$('#button-create').on('click', function() {
	var folder_name = $.trim($('input[name=\'folder\']').val()).length;
	if(folder_name === 0){
		var modal = $('<div id="alert_pop_del" class="modal fade alert_pop_del_close" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="first_conf"><div class="modal-body"><p>Please enter folder name.</p></p></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">ok</button></div></div></div></div></div>');  
    
		   $('body').append(modal);
		     modal.modal({
		     show: true
		    })
		return false;
	}
		$.ajax({
			url: 'index.php?route=sellerproduct/filemanager/folder&directory=<?php echo $directory; ?>',
			type: 'post',
			dataType: 'json',
			data: 'folder=' + encodeURIComponent($('input[name=\'folder\']').val()),
			beforeSend: function() {
				$('#button-create').prop('disabled', true);
			},
			complete: function() {
				$('#button-create').prop('disabled', false);
			},
			success: function(json) {
				if (json['error']) {
					//alert(json['error']);
					var modal = $('<div id="alert_pop" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="first_conf"><div class="modal-body"><p>'+json['error']+'</p></p></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">ok</button></div></div></div></div></div>');  
    
						   $('body').append(modal);
						     modal.modal({
						     show: true
						    })
				}

				if (json['success']) {
					//alert(json['success']);
					var modal = $('<div id="alert_pop" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="first_conf"><div class="modal-body"><p>'+json['success']+'</p></p></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">ok</button></div></div></div></div></div>');  
    
						   $('body').append(modal);
						     modal.modal({
						     show: true
						    })

					$('#button-refresh').trigger('click');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
});

$('#modal-image #button-delete').on('click', function(e) {
	var atLeastOneIsChecked = $('input[name="path[]"]:checked').length > 0;
	//alert(atLeastOneIsChecked);
	if (atLeastOneIsChecked === false) {
		var modal = $('<div id="alert_pop_del" class="modal fade alert_pop_del_close" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="first_conf"><div class="modal-body"><p>Please select a file or folder to delete.</p></p></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">ok</button></div></div></div></div></div>');  
    
		   $('body').append(modal);
		     modal.modal({
		     show: true
		    })
		return false;
	}
	
	var modal = $('<div id="alert_pop_del" class="modal fade alert_pop_del_close" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="first_conf"><div class="modal-body"><p>Are you sure the files or folders you are about to delete is currently not in use for advertisements/products/banner?</p></p></div><div class="modal-footer"><button class="btn del_img_btn" >Yes</button><button class="btn" data-dismiss="modal" aria-hidden="true">No</button></div></div></div></div></div>');  
    
	   $('body').append(modal);
	     modal.modal({
	     show: true
	    })
$('.del_img_btn').on('click', function(e) {
		$('.alert_pop_del_close').modal('hide');
	//if (confirm('<?php echo $text_confirm; ?>')) {
		$.ajax({
			url: 'index.php?route=sellerproduct/filemanager/delete',
			type: 'post',
			dataType: 'json',
			data: $('input[name^=\'path\']:checked'),
			beforeSend: function() {
				$('#button-delete').prop('disabled', true);
			},
			complete: function() {
				$('#button-delete').prop('disabled', false);
			},
			success: function(json) {
				if (json['error']) {
					//alert(json['error']);
					var modal = $('<div id="alert_pop" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="first_conf"><div class="modal-body"><p>'+json['error']+'</p></p></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">ok</button></div></div></div></div></div>');  
    
						   $('body').append(modal);
						     modal.modal({
						     show: true
						    })
				}

				if (json['success']) {
					//alert(json['success']);
					var modal = $('<div id="alert_pop" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="first_conf"><div class="modal-body"><p>'+json['success']+'</p></p></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">ok</button></div></div></div></div></div>');  
    
						   $('body').append(modal);
						     modal.modal({
						     show: true
						    })

					$('#button-refresh').trigger('click');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	//}
});
});
$('#modal-image').modal({
	backdrop: 'static',
	keyboard: false
})

//--></script>
