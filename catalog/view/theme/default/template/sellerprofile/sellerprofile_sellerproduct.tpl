    <div class="prod--sell-ed">
          
          <a href="<?php echo $edit; ?>" class="prf--sell btn btn-primary edt">Edit</a>
 </div>
 


		       <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                   <td class="text-center"><?php echo $column_image; ?></td>
                  <td class="text-left">Name</td>
                  <td class="text-left"><?php echo $column_price; ?></td>
                  <td class="text-left"><?php echo $column_special_price; ?></td>
                  <td class="text-right"><?php echo $column_quantity; ?></td>
                  <td class="text-left"><?php echo $column_status; ?></td>
                  
                </tr>
              </thead>
              <tbody>
                <?php if ($products) { ?>
                <?php foreach ($products as $product) { ?>
                <tr>
                 
                  <td class="text-center"><?php if ($product['image']) { ?>
                    <img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" class="img-thumbnail" />
                    <?php } else { ?>
                    <span class="img-thumbnail list"><i class="fa fa-camera fa-2x"></i></span>
                    <?php } ?></td>
                
                  <td class="text-left"><?php echo $product['name']; ?></td>
                  <td class="text-left"><?php if ($product['special']) { ?>
                    <span style="text-decoration: line-through;"><?php echo $product['price']; ?></span><br/>
                    <div class="text-danger"><?php echo $product['special']; ?></div>
                    <?php } else { ?>
                    <?php echo $product['price']; ?>
                    <?php } ?></td>
                  <td class="text-left"><?php echo $product['special_price']; ?></td>
                  <td class="text-right"><?php if ($product['quantity'] <= 0) { ?>
                    <span class="label label-warning"><?php echo $product['quantity']; ?></span>
                    <?php } elseif ($product['quantity'] <= 5) { ?>
                    <span class=""><?php echo $product['quantity']; ?></span>
                    <?php } else { ?>
                    <span class=""><?php echo $product['quantity']; ?></span>
                    <?php } ?></td>
                  <td class="text-left"><?php echo $product['status']; ?></td>
                  </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="7"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>

</div>
<div class="row">
  <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
  <div class="col-sm-6 text-right"><?php echo $results; ?></div>
</div>
