function getZones(val) {
  $.ajax({
      url: 'index.php?route=account/account/country&country_id=' + val,
      dataType: 'json',
      beforeSend: function() {
        $('select[name=\'register_country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
      },
      complete: function() {
        $('.fa-spin').remove();
      },
      success: function(json) {
        var html = '<option value="0"> --- Please Select --- </option>';

        if (json['zone'] && json['zone'] != '') {
          for (i = 0; i < json['zone'].length; i++) {
            html += '<option value="' + json['zone'][i]['zone_id'] + '"';

            if (json['zone'][i]['zone_id'] == $('#zone_id').val()) {
              html += ' selected="selected"';
            }

            html += '>' + json['zone'][i]['name'] + '</option>';
          }
        }

        $('select[name=\'register_zone_id\']').html(html);
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
  });

  return false;
}

$(document).ready(function() {
  $(document).on('change', 'select[name=\'register_country_id\']', function() {
    getZones($(this).val());
  });

  $('select[name=\'register_country_id\']').trigger('change');
});