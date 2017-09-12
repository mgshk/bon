

<?php if ($categories) { ?>
<!--<nav id="menu" class="navbar">
	<div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
	  <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
	</div>
	<div class="collapse navbar-collapse navbar-ex1-collapse">
	  <ul class="nav navbar-nav">
	    <?php foreach ($categories as $category) { ?>
	    <?php if ($category['children']) { ?>
	    <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
	      <div class="dropdown-menu">
	        <div class="dropdown-inner">
	          <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
	          <ul class="list-unstyled">
	            <?php foreach ($children as $child) { ?>
	            <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
	            <?php } ?>
	          </ul>
	          <?php } ?>
	        </div>
	        <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
	    </li>
	    <?php } else { ?>
	    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
	    <?php } ?>
	    <?php } ?>
	  </ul>
	</div>
	</nav>-->
<div class="container-fluid">
<div class="row">
<div class="col-sm-2 center category-left">
	<!--<h4>Category</h4>-->
	<ul>
		<?php foreach ($categories as $category) { ?>
		<?php if ($category['children']) { ?>
		<li data-toggle="collapse" data-target="#left_menu_<?php echo $category['category_id']; ?>">
			<a class="parent"><i class="fa fa-chevron-circle-down"></i> <span><?php echo $category['name']; ?></span></a>                  
			<?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
			<ul id="left_menu_<?php echo $category['category_id']; ?>" class="panel-collapse collapse">
				<?php foreach ($children as $child) { ?>
				<li><a href="<?php echo $child['href']; ?>"><i class="fa fa-hand-o-right"></i> <?php echo $child['name']; ?></a></li>
				<?php } ?>
				<li class="show-all-item-menu-cat"><a href="<?php echo $category['href']; ?>" class="see-all"><i class="fa fa-eye"></i> <?php echo $text_all; ?> <?php //echo $category['name']; ?></a></li>
			</ul>
			<?php } ?>
		</li>
		<?php } else { ?>
		<li><a href="<?php echo $category['href']; ?>"><i class="fa fa-chevron-circle-down"></i> <?php echo $category['name']; ?></a></li>
		<?php } ?>
		<?php } ?>
	</ul>
</div>
<?php } ?>

