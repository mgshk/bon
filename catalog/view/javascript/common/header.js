function getZones(val) {
  $.ajax({
      url: 'index.php?route=account/account/country&country_id=' + val,
      dataType: 'json',
      success: function(json) {
        var html = '<option value="0"> --- Please Select --- </option>';

        if (json['zone'] && json['zone'] != '') {
          for (i = 0; i < json['zone'].length; i++) {
            html += '<option value="' + json['zone'][i]['zone_id'] + '"';

            if (json['zone'][i]['zone_id'] == 1503) {
              html += ' selected="selected"';
            }

            html += '>' + json['zone'][i]['name'] + '</option>';
          }
        }

        $('#header_zone_id').html(html);

        setTimeout(function() {
          $('#header_zone_id').trigger('change');
        }, 500);
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
  });

  return false;
}

function getCities(val) {
  $.ajax({
      url: 'index.php?route=account/account/getCities&city=' + val,
      dataType: 'json',
      success: function(cities) {
        var html = '<option value="0"> --- Please Select --- </option>';

        for (i = 0; i < cities.length; i++) {
          html += '<option value="' + cities[i]['city_name'] + '"';

          html += '>' + cities[i]['city_name'] + '</option>';
        }

        $('#header_city_id').html(html);
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
  });

  return false;
}

$(document).ready(function() {
  $(document).on('change', '#header_country_id', function() {
    getZones($(this).val());
  });

  $(document).on('change', '#header_zone_id', function() {
    getCities($(this).find('option:selected').text());
  });

  $('#header_country_id').trigger('change');

  $(document).on('click', '#updat-bon-det', function () {
      $('#zone-bon-error-login').html('');
      $('#reg-sucess').html('');
      $.ajax({
        url: 'index.php?route=common/header/new_login_update_two',
        type: 'post',
        dataType: 'json',
        data: $("#top-sign-last").serialize(),
        success: function (json) {
          $('._erroe-li').show();

          if (json['success']) {
            $('#_top-sign-otp').trigger("reset");
            $('#top-sign-last').trigger("reset");
            $('#reg-sucess').html('<i class="fa fa-check" aria-hidden="true"></i><span>' + json['success']);
            $("._top-sign-upd").hide();
            $("._top-log-in").show();
          }

          if (json['error_firstname']) {
            $('#fist-name-bon').html('<i class="fa fa-times" aria-hidden="true"></i><span>' + json['error_firstname']);
          }

          if (json['lastname']) {
            $('#last-name-bon').html('<i class="fa fa-times" aria-hidden="true"></i><span>' + json['lastname']);
          }

          if (json['error_address_1']) {
            $('#address-bon').html('<i class="fa fa-times" aria-hidden="true"></i><span>' + json['error_address_1']);
          }

          setTimeout(function() {
            $('#reg-sucess').hide();
            $('._erroe-li').hide();
          }, 3000);

        }
      });
  });
});