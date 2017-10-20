function getAddressZones (val) {
	$.ajax({
		url: 'index.php?route=account/account/country&country_id=' + val,
		dataType: 'json',
		success: function(json) {
			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
						html += ' selected="selected"';
			  		}

			  		html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('#address_zone').html(html);

			setTimeout(function() {
				$('#address_zone').trigger('change');
			}, 500);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
}

function getAddressCities(val) {
  $.ajax({
      url: 'index.php?route=account/account/getCities&city=' + val,
      dataType: 'json',
      success: function(cities) {
        var html = '<option value="0"> --- Please Select --- </option>';

        for (i = 0; i < cities.length; i++) {
          html += '<option value="' + cities[i]['city_name'] + '"';

          if (cities[i]['city_name'] == $('#hidden_address_city').val()) {
            html += ' selected="selected"';
          }

          html += '>' + cities[i]['city_name'] + '</option>';
        }

        $('#address_city').html(html);
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
  });

  return false;
}

$(document).ready(function() {

	$(document).on('change', '#address_country', function() {
	    getAddressZones($(this).find('option:selected').val());

	    return false;
	});

	$(document).on('change', '#address_zone', function() {
	    getAddressCities($(this).find('option:selected').text());

	    return false;
	  });

	$('#address_country').trigger('change');
});