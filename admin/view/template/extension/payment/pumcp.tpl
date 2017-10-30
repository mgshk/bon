<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
  <div class="container-fluid">
  <div class="pull-right">
        <button type="submit" form="form-citrus" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
 
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </ul>
  </div>
  </div>
  <div class="container-fluid">
  <?php if (!empty($error_warning)) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
  <?php } ?>
  <!--<div class="warning"><?php echo $error_warning; ?></div> -->
  <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $breadcrumb['text']; ?></h3>
  </div>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" name="form-pumcp" id="form-pumcp" class="form-horizontal">
 <div class="box">
  <!--// PayU //-->
  <div class="heading">
       <h1><img src="view/image/payment/payulogo.png" alt="PayU Money" height="40" /></h1>
   </div>
 <div class="content">
  <div class="panel-body">
        <div class="col-sm-10"> 
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-merchant"><span data-toggle="tooltip" title="<?php echo $help_merchant; ?>"><?php echo $entry_merchant; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="pumcp_payu_merchant" value="<?php echo $pumcp_payu_merchant; ?>" placeholder="<?php echo $entry_merchant; ?>" id="pumcp_payu_merchant" class="form-control" />
              <?php  if (!empty($error_merchant)) { ?>
              <div class="text-danger"><?php echo $error_merchant; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-salt"><span data-toggle="tooltip" title="<?php echo $help_salt; ?>"><?php echo $entry_salt; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="pumcp_payu_salt" value="<?php echo $pumcp_payu_salt; ?>" placeholder="<?php echo $entry_salt; ?>" id="pumcp_payu_salt" class="form-control" />
              <?php if (!empty($error_salt)) { ?>
              <div class="text-danger"><?php echo $error_salt; ?></div>
              <?php } ?>
            </div>
          </div>


      </div>
     </div>
     </div>
    <!--// PayU End //-->
<hr />
	<!--// Citrus //-->
   <div class="heading">
       <h2><img src="view/image/payment/citrus.png" alt="Citruspay" height="40" />&nbsp;Citrus Pay</h2>
   </div>
<div class="content"> 
       <div class="panel-body">
        
       <div class="col-sm-10"> 
    
		   <div class="form-group required">
               <label class="col-sm-2 control-label" for="input-total"><span data-toggle="tooltip" title="<?php echo $help_vanityurl; ?>"><?php echo $entry_vanityurl; ?></span></label>
                  <div class="col-sm-10">
                      <input type="text" name="pumcp_citrus_vanityurl" value="<?php echo $pumcp_citrus_vanityurl; ?>" id="input-sort-order"class="form-control" placeholder="<?php echo $entry_vanityurl; ?>" />
                    <?php if (!empty($error_citrus_vanityurl)) { ?>
                       <div class="text-danger"><?php echo $error_citrus_vanityurl; ?></div>
                    <?php } ?>
                 </div>
	       </div>
               	  
		  <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-total"><span data-toggle="tooltip" title="<?php echo $help_accesskey; ?>"><?php echo $entry_access_key; ?></span></label>
                   <div class="col-sm-10">
                      <input type="text" name="pumcp_citrus_access_key" value="<?php echo $pumcp_citrus_access_key; ?>"  id="input-sort-order"class="form-control" placeholder="<?php echo $entry_access_key; ?>" />
                   <?php if (!empty($error_citrus_access_key)) { ?>
                      <div class="text-danger"><?php echo $error_citrus_access_key; ?></div>
                   <?php } ?>
                </div> 
          </div>
         
		  <div class="form-group required">
               <label class="col-sm-2 control-label" for="input-total"><span data-toggle="tooltip" title="<?php echo $help_secretkey; ?>"><?php echo $entry_secret_key; ?></span></label>
                 <div class="col-sm-10">
                    <input type="text" name="pumcp_citrus_secret_key" value="<?php echo $pumcp_citrus_secret_key; ?>"  id="input-sort-order"class="form-control" placeholder="<?php echo $entry_secret_key; ?>" />
                   <?php if (!empty($error_citrus_secret_key)) { ?>
                     <div class="text-danger"><?php echo $error_citrus_secret_key; ?></div>
                   <?php } ?>
                 </div> 
          </div>
                    
              
      </div>
    </div>
  </div>
</div>
<hr />
 <!--// Common Settings //-->
 <div class="box">
 <div>&nbsp;</div>
 <div class="heading">
       <h3>General Settings</h3>
   </div>
 <div class="content">
  <div class="panel-body">
        <div class="col-sm-10"> 
        	<div class="form-group">
            <label class="col-sm-2 control-label" for="input-route"><span data-toggle="tooltip" title="<?php echo $help_route; ?>"><?php echo $entry_route; ?></span></label>
            <div class="col-sm-10">
           
            	<label class="col-sm-2 control-label" for="input-route_payu"><?php echo $entry_route_payu; ?></label>
              <input type="text" name="pumcp_route_payu" value="<?php echo $pumcp_route_payu; ?>" placeholder="<?php echo $entry_route; ?>" id="pumcp_route_payu"  size="3" maxlength="3" />
            </div>
            <div class="col-sm-10">
            	<label class="col-sm-2 control-label" for="input-route_citrus"><?php echo $entry_route_citrus; ?></label>
              <input type="text" name="pumcp_route_citrus" value="<?php echo $pumcp_route_citrus; ?>" placeholder="<?php echo $entry_route; ?>" id="pumcp_route_citrus"  size="3" maxlength="3" />
            
            <?php if (!empty($error_route)) { ?>
                <div class="text-danger"><?php echo $error_route; ?></div>
            <?php } ?>
            </div>
          </div>
        
 			<div class="form-group">
            <label class="col-sm-2 control-label" for="input-total"><?php echo $entry_module; ?></label>
              <div class="col-sm-10">
                  <select name="pumcp_module" id="pumcp_module" class="form-control">
                    <?php $cm=explode('|',$entry_module_id);foreach($cm as $m){?>
                    <?php if ($pumcp_module == $m) { ?>
                    <option value="<?php echo $m; ?>" selected><?php echo $m; ?></option>
                    <?php } else { ?>
                       <option value="<?php echo $m; ?>"><?php echo $m; ?></option>
                    <?php }} ?>
                  </select>
              </div>
              <?php if (!empty($error_module)) { ?>
                  <span class="error"><?php echo $error_module; ?></span>
              <?php } ?>
            </div> 
         
         <div class="form-group">
            <label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $entry_geo_zone; ?></label>
            <div class="col-sm-10">
              <select name="pumcp_geo_zone_id" id="pumcp_geo_zone_id" class="form-control">
                <option value="0"><?php echo $text_all_zones; ?></option>
                <?php foreach ($geo_zones as $geo_zone) { ?>
                <?php if ($geo_zone['geo_zone_id'] == $pumcp_geo_zone_id) { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          
           <div class="form-group">
            <label class="col-sm-2 control-label" for="input-total"><span data-toggle="tooltip" title="<?php echo $help_currency; ?>"><?php echo $entry_currency; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="pumcp_currency" value="<?php echo $pumcp_currency; ?>" placeholder="<?php echo $entry_currency; ?>" id="pumcp_currency" size="8" maxlength="3" class="form-control" />
              <?php if (!empty($error_currency)) { ?>
                  <div class="text-danger"><?php echo $error_currency; ?></div>
              <?php } ?>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-total"><span data-toggle="tooltip" title="<?php echo $help_total; ?>"><?php echo $entry_total; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="pumcp_total" value="<?php echo $pumcp_total; ?>" placeholder="<?php echo $entry_total; ?>" id="pumcp_total" class="form-control" />
            </div>
          </div>
          
          <!--order_status-->
          
          <div class="form-group">
             <label class="col-sm-2 control-label" for="input-total"><?php echo $entry_order_status; ?></label>
               <div class="col-sm-10">
                 <select name="pumcp_order_status_id" id="pumcp_order_status_id" class="form-control">
                    <?php foreach ($order_statuses as $order_status) { ?>
                    <?php if ($order_status['order_status_id'] == $pumcp_order_status_id) { ?>
                      <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                    <?php } else { ?>
                      <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                 </select>
               </div> 
          </div>
          
          <!--order_status-->          
          
          <!--order_fail_status-->
          
          <div class="form-group">
             <label class="col-sm-2 control-label" for="input-total"><?php echo $entry_order_fail_status; ?></label>
               <div class="col-sm-10">
                 <select name="pumcp_order_fail_status_id" id="input-status" class="form-control">
                    <?php foreach ($order_statuses as $order_status) { ?>
                    <?php if ($order_status['order_status_id'] == $pumcp_order_fail_status_id) { ?>
                      <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                    <?php } else { ?>
                      <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                 </select>
               </div> 
          </div>
          
          <!--order_fail_status-->    
          
          <div class="form-group">
              <label class="col-sm-2 control-label" for="input-total"><?php echo $entry_status; ?></label>
                 <div class="col-sm-10">
                   <select name="pumcp_status" id="input-status" class="form-control">
                      <?php if ($pumcp_status) { ?>
                         <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                         <option value="0"><?php echo $text_disabled; ?></option>
                      <?php } else { ?>
                         <option value="1"><?php echo $text_enabled; ?></option>
                         <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                      <?php } ?>
                   </select>
                   <?php if (!empty($error_status)) { ?>
                	<div class="text-danger"><?php echo $error_status; ?></div>
            	 	<?php } ?>
                 </div>                  
          </div>
          
          <div class="form-group">
               <label class="col-sm-2 control-label" for="input-total"><?php echo $entry_sort_order; ?></label>
               	 <div class="col-sm-10">
                      <input type="text" name="pumcp_sort_order" value="<?php echo $pumcp_sort_order; ?>"  id="input-sort-order"class="form-control"size="1" />
                 </div>
          </div>  
         
 		</div>
  </div>
 </div>
 </div> 
   <!--// Common Settings End //-->
<hr />
</form>
<script type="text/javascript">
function routeen()
{
	if( $('input[name=pumcp_payu_merchant]').val()==="" || $('input[name=pumcp_payu_salt]').val()==="" || $('input[name=pumcp_citrus_vanityurl]').val()==="" || $('input[name=pumcp_citrus_access_key]').val()==="" || $('input[name=pumcp_citrus_secret_key]').val()==="")
	   {		   
		   $('input[name=pumcp_route_citrus]').attr("readonly", true);
		   $('input[name=pumcp_route_payu]').attr("readonly", true);
	   }
	   else {		
	   	   $('input[name=pumcp_route_citrus]').removeAttr("readonly");
		   $('input[name=pumcp_route_payu]').removeAttr("readonly");
	   }
}

$(document).ready(function() { routeen(); });
$('#form-pumcp').change(function() { routeen();  });
 
$('#pumcp_route_payu').bind('change',function() {
	var val = parseInt(this.value,10);	
	if(val > 100)
	{
		$('input[name=pumcp_route_payu]').val(100);
		$('input[name=pumcp_route_citrus]').val(0);
	}
	else if(val < 0)
	{
		$('input[name=pumcp_route_payu]').val(0);
		$('input[name=pumcp_route_citrus]').val(100);
	}
	else {
		$('input[name=pumcp_route_citrus]').val(Math.abs(100 - val));	
	}
	
});

$('#pumcp_route_citrus').bind('change',function() {
	var val = parseInt(this.value,10);	
	if(val > 100)
	{
		$('input[name=pumcp_route_citrus]').val(100);
		$('input[name=pumcp_route_payu]').val(0);		
	}
	else if(val < 0)
	{
		$('input[name=pumcp_route_citrus]').val(0);
		$('input[name=pumcp_route_payu]').val(100);
		
	}
	else {
		$('input[name=pumcp_route_payu]').val(Math.abs(100 - val));	
	}
});

</script>
<?php echo $footer; ?>