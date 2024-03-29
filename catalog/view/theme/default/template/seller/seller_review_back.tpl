

<?php echo $header; ?>
<div class="container-fluid">
	<!--<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
		</ul>-->
	<div class="row">
		<div id="content" class="col-sm-12">	
		<div class="container-fluid">
			     <br/>
		     <div class="row">
		    <div class="pull-left">
				<a href="index.php?route=sellerprofile/sellerprofile&amp;tab_section=store_detail#content" class="btn btn-primary pull-left">&lt;&lt; Back</a>
		      </div></div>
		    <br/>
		  </div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa-list"></i> Reviews</h3>
				</div>
				<div class="panel-body">
					<p>
						<?php for ($i = 1; $i <= 5; $i++) { ?>
						<?php if ($seller_rating_single < $i) { ?>
					<div class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></div>
					<?php } else { ?>
					<div class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></div>
					<?php } ?>
					<?php } ?> &nbsp; <?php if($review_count != ''){ ?><span class="str-votes"><?php echo $review_count; ?> Votes</span><?php } else { ?> 0 Votes <?php } ?>
					</p>
					<p class="rating-str">
						<img alt="" title="" src="https://chart.googleapis.com/chart?cht=bhs&amp;chs=220x120&amp;chco=0195ff&amp;chbh=a,5,15&amp;chds=0,100&amp;chxt=y&amp;chxl=0:|Poor|Average|Good|Very Good|Excellent&chxr=1,0,100,1&chm=N%20*f1*%20%25,000000,0,-1,12|r,FFFFFF,0,-0.01,2|R,FFFFFF,0,0.01,1&chd=t:<?php echo $rating_chart; ?>&chxp=1,10,30,50,70,90&chxtc=1,10&chxs=0,000000,13,-1,t,FFFFFF&chof=gif">
					</p>
					<?php if ($sellerreviews) { ?>
					<?php foreach ($sellerreviews as $sellerreview) { ?>
					<table class="table table-striped table-bordered review-tb">
						<tr>
							<td style="width: 50%;"><strong><?php echo substr_replace($sellerreview['phone'],"*****",2,5); ?></strong></td>
							<td class="text-right"><?php echo $sellerreview['date_added']; ?></td>
						</tr>
						<tr>
							<td colspan="2">
								<?php for ($i = 1; $i <= 5; $i++) { ?>
								<?php if ($sellerreview['rating'] < $i) { ?>
								<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
								<?php } else { ?>
								<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
								<?php } ?>
								<?php } ?>
								<p><?php echo $sellerreview['text']; ?></p>
							</td>
						</tr>
					</table>
					<?php } ?>
					<div class="text-right"><?php echo $pagination; ?></div>
					<?php } else { ?>
					<p><?php echo $text_no_sellerreviews; ?></p>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>

