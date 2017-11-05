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
            <h4>Thank You!! Your payment is successful! 
              <br/>
            <br/>
             Amount Paid: Rs <?php echo round($order_info['total'],2) ?> <br/><br/>
             Please make not of your transaction id and Order id for future reference. <br/>
             Your transaction Id is: <b><?php echo $mihpayid; ?></b><br />
             And your order Id is: <b><?php echo $order_id; ?></b><br />
            </h4>
    <?php } else { ?>
      <h4>Sorry!! Your payment is not successful!</h4> 
      <br/>
      
    <?php } ?>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
   

   
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>