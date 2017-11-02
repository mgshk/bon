<?php echo $header; ?>
<div class="container">
  <!--<ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>-->
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
    <br/>

    <?php if($txnstatus == "success") { ?>
            <h1>Thank You!! Your payment is successful!</h1> 
            <br/>
            <h3> Please make not of your transaction id and Order id for future reference.<h2><br/>
            <h4>
              <?php echo "Your transaction Id is:".$mihpayid; ?><br />
              <?php echo "And your order Id is:".$order_id; ?><br />
            </h4>
    <?php } else { ?>
      <h1>Sorry!! Your payment is not successful!</h1> 
      <br/>
      
    <?php } ?>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
   

   
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>