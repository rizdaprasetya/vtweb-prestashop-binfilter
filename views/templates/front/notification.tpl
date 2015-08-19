{capture name=path}{l s='Veritrans payment.' mod='veritransbinpromo'}{/capture}
<h2>{l s='Order summary' mod='veritransbinpromo'}</h2>

{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}

<h3 class="page-subheading">{l s='Payment via Veritrans.' mod='veritransbinpromo'}
<!-- <form action="{$link->getModuleLink('veritransbinpromo', 'validation', [], true)}" method="post"> -->
<img src="{$this_path}Veritrans.png" alt="{l s='veritrans' mod='veritransbinpromo'}" width="120" height="21" style=" float:left; margin: 0px 10px 5px 0px;" /></h3> <br/>
<div class="text-center">
{if $status == 'success'}
	<p>
		<b><h3 class="alert alert-success">{l s='Your payment on %s is complete!' sprintf=$shop_name mod='veritransbinpromo'}</h3></b>
	</p>
	<p class="warning">
		{l s='If you have questions, comments or concerns, please contact our' mod='veritransbinpromo'} <a href="{$link->getPageLink('contact', true)}">{l s='expert customer support team. ' mod='veritransbinpromo'}</a>.<br/><br/>
	</p>
	<a href="{$link->getPageLink('history', true)}" title="{l s='Back to orders'}" class="button-exclusive btn btn-primary">{l s='view order history'}</a>
{else}
	<p>
		<b><h3 class="alert alert-danger">{l s='Payment Error!' mod='veritransbinpromo'}</h3></b>
	</p>
	<p class="warning">
		{l s='We noticed a problem with your order. Please do re-checkout.
		If you think this is an error, feel free to contact our' mod='veritransbinpromo'} <a href="{$link->getPageLink('contact', true)}">{l s='expert customer support team. ' mod='veritransbinpromo'}</a> <br/><br/>
	</p>
	<a class="button" href="{$link->getPageLink('order', true, NULL, "submitReorder&id_order={$order_id|intval}")|escape:'html':'UTF-8'}" title="{l s='Re-Checkout'}"> 
	<i class="icon-refresh"></i>&nbsp;{l s='Re-Checkout'}</a>
{/if}
</div>
<br/><br/><br/>
