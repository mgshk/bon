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

      try {

        var firstname = $('#input-firstname').val();
        var lastname = $('#input-lastname').val();
        var address_1 = $('#input-address-1').val();
        var address_2 = $('#address_2').val();
        var country_id = $('input[name="country_id"]').val();
        var zone_id = $('#header_zone_id').find('option:selected').val();
        var city_id = $('#header_city_id').find('option:selected').val();
        var post_code = $('#input-postcode').val();

        if ($.trim(firstname) === '' || firstname.length < 1 || firstname.length > 32)
          throw "First Name must be between 1 and 32 characters!";

        if ($.trim(lastname) === '' || lastname.length < 1 || lastname.length > 32)
          throw "Last Name must be between 1 and 32 characters!";

        if ($.trim(address_1) === '' || address_1.length < 3 || address_1.length > 128)
          throw "Address must be between 3 and 128 characters!";

        if (country_id == '' || country_id === '0')
          throw "Please select a country!";

        if (zone_id == '' || zone_id === '0')
          throw "Please select a region / state!";

        if (city_id == '' || city_id === '0')
          throw "Please select a city";

        if ($.trim(post_code) === '' || post_code.length < 2 || post_code.length > 10)
          throw "Postcode must be between 2 and 10 characters!";

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
              $('#reg-sucess').html('<i class="fa fa-check" aria-hidden="true"></i><span>' + json['success']).show();
              $("._top-sign-upd").hide();
              $("._top-log-in").show();

              if (json['login_type'] === 'seller') {
                $('input:radio[id=seller]').prop('checked', true);
              }
            }

            if (json['error_firstname']) {
              $('#signUpErrorMsg').html('<i class="fa fa-times-circle"></i> '+ json['error_firstname']).show();
            }

            if (json['lastname']) {
              $('#signUpErrorMsg').html('<i class="fa fa-times-circle"></i> '+ json['lastname']).show();
            }

            if (json['error_address_1']) {
              $('#signUpErrorMsg').html('<i class="fa fa-times-circle"></i> '+ json['error_address_1']).show();
            }

            setTimeout(function() {
              $('#signUpErrorMsg').empty().hide();
              $('#reg-sucess').empty().hide();
            }, 3000);

          }
        });

      } catch (e) {
        $('#signUpErrorMsg').html('<i class="fa fa-times-circle"></i> '+ e).show();

        setTimeout(function() {
          $('#signUpErrorMsg').empty().hide();
        }, 3000);
      }

      return false;
  });

  //Login pop with mobile num
  $('#main-log-bon input').on('keydown', function (e) {
    if (e.keyCode == 13) {
      $('#log-btn-main-bon').trigger('click');
    }
  });

  $('#log-btn-main-bon').click(function () {

    try {

      var username = $('#input-email').val();
      var password = $('#input-password').val();

      if ($.trim(username) === '')
        throw "Please enter phone number";

      if ($.trim(password) === '')
        throw "Please enter passsword!";

      $.ajax({
        url: 'index.php?route=account/login/login',
        type: 'post',
        dataType: 'json',
        data: $("#main-log-bon").serialize(),
        success: function (json) {
          if (json['error']) {
            $('#loginErrorMsg').html('<i class="fa fa-times-circle"></i> '+ json['error']).show();
          }

          if (json['success']) {
            if (document.getElementById('seller').checked) {
              window.location.assign('<?php echo $seller_profile; ?>&tab_section=store_detail#content')
            } else {
              loacation();              
            }
            $('#_log-bon').modal('hide');
          }

          setTimeout(function() {
            $('#loginErrorMsg').empty().hide();
          }, 3000);
        }
      });
    } catch (e) {
      $('#loginErrorMsg').html('<i class="fa fa-times-circle"></i> '+ e).show();

      setTimeout(function() {
        $('#loginErrorMsg').empty().hide();
      }, 3000);
    }    

    return false;
  });

  $('#sign-up-bon-top').on('click', function () {

      try {

        var telephone = $('#input-telephone').val();

        if ($.trim(telephone) === '' || telephone.length !== 10)
          throw "Mobile Number must be 10 characters!";

        $("#LoadingImage").show();

        $.ajax({
          url: 'index.php?route=common/header/new_login',
          type: 'post',
          dataType: 'json',
          data: $("#sig_top_hd").serialize(),
          success: function (json) {
            $("#LoadingImage").hide();

            if (json['success']) {
              $('#cus_prof').val(json['success']);
              var zon_id = json['zone_select'];

              if (zon_id == 1503) {
                $('#zone_select_ret').val('Tamil nadu');
              } else if (zon_id == 1499) {
                $('#zone_select_ret').val('Puducherry');
              }

              $('#input-telephone_ret').val(json['telephone']);
              $("._top-sign-in").hide();
              $("._top-sign-otp").show();
            }

            if (json['error_warning']) {
              $('#errorTopMsg').html('<i class="fa fa-times-circle"></i> '+ json['error_warning']).show();
            }

            if (json['error_telephone']) {
              $('#errorTopMsg').html('<i class="fa fa-times-circle"></i> '+ json['error_telephone']).show();
            }

            if (json['telephone_number']) {
              $('#errorTopMsg').html('<i class="fa fa-times-circle"></i> '+ json['telephone_number']).show();
            }

            setTimeout(function() {
              $('#errorTopMsg').empty().hide();
            }, 3000);
          }
        });

      } catch (e) {
        $('#errorTopMsg').html('<i class="fa fa-times-circle"></i> '+ e).show();

        setTimeout(function() {
          $('#errorTopMsg').empty().hide();
        }, 3000);
      }

      return false;
  });

  $("input#otp").keyup(function () {
      var lgt = $('#otp').val().length;

      if (lgt == 6) {
        $('#top-line-star-otp').empty().hide();

        $.ajax({
          url: 'index.php?route=common/header/code_check',
          type: 'post',
          dataType: 'json',
          data: $("#_top-sign-otp").serialize(),
          success: function (json) {
            if (json['success']) {
              $("#input-email-otp").removeAttr('disabled');
              $("#input-password-otp").removeAttr('disabled');
              $("#input-confirm-otp").removeAttr('disabled');
              $("#security_select").removeAttr('disabled');
              $("#sign-up-bon-top-prof").removeAttr('disabled');
            }

            if (json['error_warning']) {
              $('#top-line-star-otp').html('<i class="fa fa-times-circle"></i> '+ json['error_warning']).show();

              setTimeout(function() {
                $('#top-line-star-otp').empty().hide();
              }, 3000);
            }
          }
        });
      };
  });

  $('#sign-up-bon-top-prof').on('click', function () {
    
    try {

      var email = $("#input-email-otp").val();
      var password = $("#input-password-otp").val();
      var confirm_password = $("#input-confirm-otp").val();
      var security_select = $("#security_select").find('option:selected').val();
      var security_ans = $("#security_answer").val();

      if ($.trim(email) === '')
        throw "E-Mail cannot be empty";

      if ($.trim(password) === '')
        throw "Password must be between 4 and 20 characters!";

      if ($.trim(confirm_password) === '')
        throw "Password confirmation does not match password!";

      if ($.trim(password) === '' !== $.trim(confirm_password) === '')
        throw "Password confirmation does not match password!";

      if ($.trim(security_select) === '0')
        throw "Please select security question";

      if ($.trim(security_ans) === '')
        throw "Please enter security answer";

      $.ajax({
        url: 'index.php?route=common/header/new_login_update',
        type: 'post',
        dataType: 'json',
        data: $("#_top-sign-otp").serialize(),
        success: function (json) {
          if (json['success']) {
            $('#cus_d_up').val(json['success']);
            $("._top-sign-otp").hide();
            $("._top-sign-upd").show()
          }

          if (json['error_email_empty']) {
            $('#top-line-star-otp').html('<i class="fa fa-times-circle"></i> '+ json['error_email']).show();
          }

          if (json['error_email']) {
            $('#top-line-star-otp').html('<i class="fa fa-times-circle"></i> '+ json['error_email']).show();
          }

          if (json['error_warning']) {
            $('#top-line-star-otp').html('<i class="fa fa-times-circle"></i> '+ json['error_warning']).show();
          }

          if (json['error_password']) {
            $('#top-line-star-otp').html('<i class="fa fa-times-circle"></i> '+ json['error_password']).show();
          }

          if (json['error_confirm']) {
            $('#top-line-star-otp').html('<i class="fa fa-times-circle"></i> '+ json['error_confirm']).show();
          }

          if (json['security_select']) {
            $('#top-line-star-otp').html('<i class="fa fa-times-circle"></i> '+ json['security_select']).show();
          }

          if (json['security_answer']) {
            $('#top-line-star-otp').html('<i class="fa fa-times-circle"></i> '+ json['security_answer']).show();
          }

          setTimeout(function() {
            $('#top-line-star-otp').empty().hide();
          }, 3000);
        }
      });

    } catch (e) {
      $('#top-line-star-otp').html('<i class="fa fa-times-circle"></i> '+ e).show();

      setTimeout(function() {
        $('#top-line-star-otp').empty().hide();
      }, 3000);
    }

    return false;
  });

  $(".free_listBtn_logged").click(function () {
    $('#_log-bon').modal('show');
    $("._top-log-in").hide();
    $("._alreary_logged").show();
    $('._sig_log').show().css('height', '100px');
  });

  $(".free_listBtn").click(function () {
    $('#_log-bon').modal('show');
    $("._top-log-in").hide();

    $('#login_type').val('seller');

    $("._top-sign-in").show();
  });
  
  $("._bon--login").click(function () {

    $('#_log-bon').modal({
      backdrop: 'static',
      keyboard: false
    });

    $('#_log-bon').modal('show');
  });
});