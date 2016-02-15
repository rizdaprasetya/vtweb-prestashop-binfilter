{capture name=path}{l s='Veritrans Payment' mod='veritransbinpromo'}{/capture}
{* {include file="$tpl_dir./breadcrumb.tpl"} *}

<h2 class="page-heading">{l s='Order Summary' mod='veritransbinpromo'}</h2>

{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}

<div class="box cheque-box">
	{if $nbProducts <= 0}
		<p class="warning">{l s='Your shopping cart is empty.' mod='veritransbinpromo'}</p>
	{elseif $error_message != ""}
		<p class="warning">{$error_message}</p>
	{else}
		<h3 class="page-subheading">{l s='Payment via Veritrans.' mod='veritransbinpromo'}</h3>
		{* <form action="{$url}" method="post" name="payment_form" class="std"> *}
		{if (version_compare(Configuration::get('PS_VERSION_DB'), '1.5') == -1)}
			<form action="{$base_dir|cat:'modules/veritransbinpromo/validation.php'}" method="post" class="std"> 
		{else}
			<form action="{$link->getModuleLink('veritransbinpromo', 'validation', [], true)}" method="post" class="std"> 
		{/if}
			<p>
				<img src="{$this_path}Veritrans.png" alt="{l s='Veritrans' mod='veritransbinpromo'}" height="49" style="float:left; margin: 0px 10px 5px 0px;" />
				<br/><b>{l s='You have chosen to pay via Veritrans.' mod='veritransbinpromo'}</b><br/>
			</p>

			<p style="margin-top:20px;">
				- {l s='The total amount of your order is' mod='veritransbinpromo'}
				<span id="amount" class="price">{displayPrice price=$total}</span>
				{if $use_taxes == 1}
		    	{l s='(tax incl.)' mod='veritransbinpromo'} 
		    {/if} <span><strong> | Before discount applied</strong></span><br/>
		    - <span><strong>Discount</strong> will be applied on the next step</span><br/>
				-
				{if $currencies|@count > 1}
					{l s='We allow several currencies to be sent via Veritrans.' mod='veritransbinpromo'}
					<br /><br />
					{l s='Choose one of the following:' mod='veritransbinpromo'}
					<select id="currency_payement" name="currency_payement" onchange="setCurrency($('#currency_payement').val());">
						{foreach from=$currencies item=currency}
							<option value="{$currency.id_currency}" {if $currency.id_currency == $cust_currency}selected="selected"{/if}>{$currency.name}</option>
						{/foreach}
					</select>
				{else}
					{l s='We allow the following currency to be sent via Veritrans:' mod='veritransbinpromo'}&nbsp;<b>{$currencies.0.name}</b>
					<input type="hidden" name="currency_payement" value="{$currencies.0.id_currency}" />
				{/if}
			</p>

			{if $payment_type == 'vtdirect'}
				<h3 class="page-subheading">Credit Card Information</h3>
				<div class="form-group">
					<label for="">Credit Card Number</label>	
					<input type="text" class="form-control">
				</div>
				<div class="form-group">
					<label for="">Card Expiry</label>	
					<input type="text" class="form-control">
					<input type="text" class="form-control">
				</div>
				<div class="form-group">
					<label for="">CVV</label>
					<input type="text" class="form-control">
				</div>					
			{/if}

			<h3 class="page-subheading">Confirm Order</h3>
			
			<p class="cart_navigation clearfix" id="cart_navigation">
				<input type="submit" value="{l s='Place my order' mod='veritransbinpromo'}" class="exclusive_large" />
				<a href="{$link->getPageLink('order', true, NULL, "step=3")}" class="button_large">{l s='Other payment methods' mod='veritransbinpromo'}
				</a>
			</p>
		</form>
	{/if}
</div>