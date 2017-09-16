function autoCompleteCategories() {
  $("input[name='category']").autocomplete({
     source: function(request, response) {
        var elem = '';
        var row = $(this).data('row');

        $.ajax({
           url: 'index.php?route=sellerprofile/sellerprofile/category_autocomplete&filter_name=' +  encodeURIComponent(request),
           dataType: 'json',
           success: function(json) {
              $.map(json, function(item) {
                 elem += "<li class=\"list-category\" data-row="+row+" data-id="+item['category_id']+">"+item['name']+"</li>";
              });

              $('.dropdown-menu_'+ row).empty().html(elem).show();
           }
        });
     },
     minLength: 0
     }).focus(function() {
        var row = $(this).data('row');
        var selected_category = $('#category_hidden_'+row).val();

        console.log('focus');
   });

  return false;
}

function autoCompleteSubcategories() {

  $("input[name='sub_category']").autocomplete({
     source: function(request, response) {
        var elem = '';
        var row = $(this).data('row');
        var category_id = $('#category_hidden_'+row).val();

        $.ajax({
           url: 'index.php?route=sellerprofile/sellerprofile/sub_category_autocomplete&path_id=' + category_id + '&filter_name=' +  encodeURIComponent(request),
           dataType: 'json',
           success: function(json) {
              $.map(json, function(item) {
                 elem += "<li class=\"list-subcategory\" data-row="+row+" data-id="+item['category_id']+">"+item['name']+"</li>";
              });

              $('.dropdown-submenu_'+ row).empty().html(elem).show();
           }
        });
     },
     minLength: 0
     }).focus(function() {
        console.log('focus');
   });

  return false;
}


$(document).ready(function() {

	autoCompleteCategories();
   	autoCompleteSubcategories();


   	$("body").on("click", "#addBtnCategories", function() {
      	var ctr = $("#cats tbody").find(".extra").length;
   
		if (ctr < 15) {
			var html  = '<tr id="cat-rows' + ctr + '" class="extra">';
	         html += '<td class="text-left cat">';
	         html += '<input type="text" name="category" data-row="'+ctr+'" id="category_'+ctr+'" value="" placeholder="Type here" class="form-control" autocomplete="off"><ul class="dropdown-menu_'+ctr+'"></ul>';
	         html += '<input type="hidden" id="category_hidden_'+ctr+'" name="category_id" data-row="'+ctr+'" value=""  class="form-control">';
	         html += '</td>';
	         html += '<td class="text-left subcat">';
	         html +=  '<input type="text" name="sub_category" id="sub_category_'+ctr+'" data-row="'+ctr+'" value="" placeholder="Type here" class="form-control" autocomplete="off"><ul class="dropdown-submenu_'+ctr+'"></ul>';
	         html += '<div id="product-category_'+ctr+'" class="well well-sm" style="height: 150px; overflow: auto;">';
	         html += '</div>';
	         html += '</td>';
	         html += '<td class="text-left"><button type="button" onclick="$(\'#cat-rows' + ctr + '\').remove();" class="--minus-btn">-</button></td>';
	         html += '</tr>';

		     $("#cats tbody").append(html);

		     autoCompleteCategories();
		     autoCompleteSubcategories();
		  }

       return false;
   });

	$("body").on("click", ".list-category", function() {
		var category_id = $(this).data('id');
		var row = $(this).data('row');

		$('#category_'+row).val($(this).text());
		$('.dropdown-menu_'+ row).hide();

		$('#category_hidden_'+row+'').val(category_id);

		return false;
	});

	$("body").on("click", ".list-subcategory", function() {
      var selected_ids = [];
      var subcategory_id = $(this).data('id');
      var row = $(this).data('row');

      $('#sub_category_'+row).val('');
      $('.dropdown-submenu_'+ row).hide();

      selected_ids.push($(this).data('id'));

      $('#product-category_'+row).append('<p><i class="fa fa-minus-circle"></i> ' + $(this).text() + '<input type="hidden" name="product_category[]" id="product_category_'+subcategory_id+'" value=""></p>');

      $('#product_category_'+subcategory_id+'').val(subcategory_id);

      return false;
   });

   $('#button-cat-subcat-save').on('click', function(e) {

      var categories = [];

      $("input[name='category_id'").each(function() {
         var row = $(this).data('row');
         var value = $(this).val();

         if(value) {
            var sub_categories = $("#product-category_"+row+" input[name='product_category[]'").map(function() {
               return $(this).val();
            }).get();

            categories.push({'category' : value, 'sub_categories': sub_categories});
         }
      });

      $.ajax({
         cache: false,
         type: "POST",
         url: 'index.php?route=sellerprofile/sellerprofile/categories_subcategories_store',
         data: {
            category: JSON.stringify(categories)
         },
         success: function(data) {
            $('#store_cat').modal('toggle');
         }
      });

      return false;
   });

});
