<form action="{$form_url}" method="post">
  <fieldset>
  <legend><img src="../img/admin/contact.gif" />Basic Information</legend>
    <table border="0" id="form">
      
      <!-- <tr>
        <td width="300" style="vertical-align: top;">API Version</td>
        <td>
          <select name="VB_API_VERSION" id="veritransApiVersion">
            {foreach from=$api_versions item=version key=k}
              <option value="{$k}" {if $k == $api_version}selected{/if}>{$version}</option>
            {/foreach}
          </select>
        </td>
      </tr> -->
      <input type="hidden" name="VB_API_VERSION" value="2">
      <!-- API VERSION -->

      <!-- <tr>
        <td width="300" style="vertical-align: top;">Payment Type</td>
        <td>
          <select name="VB_PAYMENT_TYPE" id="veritransPaymentType">
            {foreach from=$payment_types item=v key=k}
              <option value="{$k}" {if $k == $payment_type}selected{/if}>{$v}</option>
            {/foreach}
          </select>
        </td>
      </tr> -->
      <!-- PAYMENT_TYPE -->

      <!-- <tr class="v1_vtweb_settings sensitive">
        <td width="300" style="vertical-align: top;">Merchant ID</td>
        <td><input type="text" name="VT_MERCHANT_ID" value="{$merchant_id}" style="width: 300px;" /></td>
      </tr> -->
      <!-- MERCHANT_ID -->

      <!-- <tr class="v1_vtweb_settings sensitive">
        <td width="300" style="vertical-align: top;">Merchant Hash</td>
        <td><input type="text" name="VT_MERCHANT_HASH" value="{$merchant_hash_key}" style="width: 300px;" /></td>
      </tr> -->
      <!-- MERCHANT_HASH -->

      <tr class="v1_vtdirect_settings v2_settings">
        <td width="300" style="vertical-align: top;">Client Key</td>
        <td><input type="text" name="VB_CLIENT_KEY" value="{$client_key}" style="width: 300px;" /></td>
      </tr>
      <!-- CLIENT_KEY -->

      <tr class="v1_vtdirect_settings v2_settings">
        <td width="300" style="vertical-align: top;">Server Key</td>
        <td><input type="text" name="VB_SERVER_KEY" value="{$server_key}" style="width: 300px;" /></td>
      </tr>
      <!-- SERVER_KEY -->

      <tr class="v1_vtdirect_settings v2_settings">
        <td width="300" style="vertical-align: top;">Environment</td>
        <td>
          <select name="VB_ENVIRONMENT">
            {foreach from=$environments item=v key=k}
              <option value="{$k}" {if $k == $environment}selected{/if}>{$v}</option>
            {/foreach}
          </select>
        </td>
      </tr>
      <!-- ENVIRONMENT -->

      <input type="hidden" name="VB_PAYMENT_TYPE" value="vtweb">
      <!-- PAYMENT_TYPE -->

      <tr>
        <td width="300" style="vertical-align: top;">Map Payment Success to Status:</td>
        <td>
          <select name="VB_PAYMENT_SUCCESS_STATUS_MAP">
            {foreach from=$statuses item=v}
              <option value="{$v['id_option']}" {if $v['id_option'] == $payment_success_status_map}selected{/if}>{$v['name']}</option>
            {/foreach}
          </select>
        </td>
      </tr>
      <!-- PAYMENT_SUCCESS_STATUS_MAP -->

      <tr>
        <td width="300" style="vertical-align: top;">Map Payment Challenged to Status:</td>
        <td>
          <select name="VB_PAYMENT_CHALLENGE_STATUS_MAP">
            {foreach from=$statuses item=v}
              <option value="{$v['id_option']}" {if $v['id_option'] == $payment_challenge_status_map}selected{/if}>{$v['name']}</option>
            {/foreach}
          </select>
        </td>
      </tr>
      <!-- PAYMENT_CHALLENGE_STATUS_MAP -->

      <tr>
        <td width="300" style="vertical-align: top;">Map Payment Failure to Status:</td>
        <td>
          <select name="VB_PAYMENT_FAILURE_STATUS_MAP">
            {foreach from=$statuses item=v}
              <option value="{$v['id_option']}" {if $v['id_option'] == $payment_failure_status_map}selected{/if}>{$v['name']}</option>
            {/foreach}
          </select>
        </td>
      </tr>
      <!-- PAYMENT_FAILURE_STATUS_MAP -->
	  
      <tr>
        <td width="300" style="vertical-align: top;">Enable 3D Secure?</td>
        <td><input type="checkbox" name="VB_3D_SECURE" {if $enable_3d_secure}checked{/if} style="width: 300px;" /></td>
      </tr>
      <!-- 3D_SECURE -->
      
      <tr>
        <td width="300" style="vertical-align: top;">Enable Sanitization?</td>
        <td><input type="checkbox" name="VB_SANITIZED" {if $enable_sanitized}checked{/if} style="width: 300px;" /></td>
      </tr>
     
      <tr>
        <td width="300" style="vertical-align: top;">Kurs</td>
        <td><input type="text" name="VB_KURS" value="{$kurs}" style="width: 300px;" /></td>
      </tr>
      <!-- KURS -->

    </table>
    <br/>
    <input class="button" name="btnSubmit" value="Update Settings" type="submit" />
  </fieldset>
</form>
<script>
  $(function() {
    function sensitiveOptions() {
      var api_version = $('#veritransApiVersion').val();
      var payment_type = $('#veritransPaymentType').val();
      var api_string = 'v' + api_version + '_settings';
      var payment_type_string = payment_type;
      var api_payment_type_string = 'v' + api_version + '_' + payment_type + '_settings';
      $('.sensitive').hide();
      $('.' + api_string).show();
      $('.' + payment_type_string).show();
      $('.' + api_payment_type_string).show();
    }

    $("#veritransApiVersion").on('change', function(e, data) {
      sensitiveOptions();
    });
    $("#veritransPaymentType").on('change', function(e, data) {
      sensitiveOptions();
    });

    sensitiveOptions();
    
  });
</script>