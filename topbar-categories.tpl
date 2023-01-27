<link rel="stylesheet" href="/themes/cart/province/assets/css/topbar.css">
<style>
    @media (max-width: 576px) {
      
      .firstgroup_item,.secondgroup_item{
          min-width:auto!important;
          width:50%;
          padding:0;
      }
    }
    
</style>

<div class="alert alert-success">
<strong>
<i class="bx bx-bell bx-tada"></i>
{$CustomDepot.cartnotice}
</strong>
</div>

<div class="mdui-card mdui-p-a-1 mdui-hoverable">

    <div class="mdui-card-primary">
        <div class="mdui-card-primary-title">
            筛选产品{if !$Userinfo}（受限筛选模式）<a href="javascript:;" class="mdui-typo-caption" mdui-tooltip="{content: '很多友商甚至不愿意注册账号就炒作价格，为减少不必要的麻烦以投入更多精力帮助正式客户，会对未登录用户隐藏库存和报价。请您先登录后获取详细信息。'}">为什么会受限？</a>{/if}
        </div>
        <div class="mdui-card-primary-subtitle">
            可在智简魔方控制台分类筛选适用于智简魔方控制台的产品。
            {if $Userinfo}
                <a href="/cart?action=viewcart" class="mdui-btn mdui-btn-icon" mdui-tooltip="{content: '查看已选产品'}"><i class="mdui-icon material-icons">shopping_cart</i></a>
            {/if}
        </div>
    </div>
    <div class="mdui-card-content">
        <div class="mdui-chip mdui-color-blue">
          <span class="mdui-chip-icon">
            <i class="mdui-icon material-icons">local_offer</i>
          </span>
          <a class="mdui-chip-title mdui-text-color-white">服务类型</a>
        </div>
    
        {foreach $Cart.product_groups as $index=>$first} 
            {if $first.id==$Think.get.fid || (!$Think.get.fid && $index==0)}
            <div class="mdui-chip mdui-color-blue-a400">
              <span class="mdui-chip-icon mdui-color-blue">
                <i class="mdui-icon material-icons">location_on</i>
              </span>
              <a class="mdui-chip-title mdui-text-color-white" href="/cart?fid={$first.id}{if $Get.site}&site={$Get.site}{/if}">{$first.name}</a>
            </div>
        	{assign name="cart_first_id" value="$first.id" /}  
        	{assign name="cart_second" value="$first.second" /}  
        	{else/}
        	<div class="mdui-chip">
              <a class="mdui-chip-title mdui-text-color-black" href="/cart?fid={$first.id}{if $Get.site}&site={$Get.site}{/if}">{$first.name}</a>
            </div>
        	{/if}
    	{/foreach}
    
    <hr>
        <div class="mdui-chip mdui-color-blue">
          <span class="mdui-chip-icon">
            <i class="mdui-icon material-icons">local_offer</i>
          </span>
          <a class="mdui-chip-title mdui-text-color-white">可用区或套餐</a>
        </div>
        {if $Userinfo}
        	{foreach $cart_second as $index=>$secondItem}
        	{if $secondItem.id == $Think.get.gid || (!$Think.get.gid && $index==0)}
        	<div class="mdui-chip mdui-color-blue-a400">
                  <span class="mdui-chip-icon mdui-color-blue">
                    <i class="mdui-icon material-icons">location_on</i>
                  </span>
                  <a class="mdui-chip-title mdui-text-color-white" href="/cart?fid={$cart_first_id}&gid={$secondItem.id}{if $Get.site}&site={$Get.site}{/if}">{$secondItem.name}</a>
                </div>
        	{assign name="cart_gid" value="$secondItem.id" /} 
        	{else/}
        	<div class="mdui-chip">
                  <a class="mdui-chip-title mdui-text-color-black" href="/cart?fid={$cart_first_id}&gid={$secondItem.id}{if $Get.site}&site={$Get.site}{/if}">{$secondItem.name}</a>
                </div>
        	
        	{/if}
        	{/foreach}
        {else}
            <i class="mdui-icon material-icons">block</i> 请先<a href="/login">登录</a>以获取更多可用区及报价信息。
        {/if}
    </div>
</div>

<br>

{foreach $cart_second as $index=>$secondItem}
{if $secondItem.id == $Think.get.gid || (!$Think.get.gid && $index==0)}
    {if $secondItem.headline}
    <div class="mdui-card mdui-p-a-1 mdui-hoverable">
            <span class="mdui-typo-headline">{$secondItem.headline}</span>
            {if $secondItem.tagline}
                <a class="mdui-btn mdui-btn-raised mdui-color-blue-a200 mdui-float-right" mdui-dialog="{target: '#incloudifyDetailDia'}">了解更多</a>
            {/if}
        	{assign name="cart_gid" value="$secondItem.id" /} 
    </div>
    
    <br>
    {/if}
    
    <div class="mdui-dialog" id="incloudifyDetailDia">
      <div class="mdui-dialog-title">产品信息</div>
      <div class="mdui-dialog-content">{$secondItem.tagline}</div>
      <div class="mdui-dialog-actions">
        <button class="mdui-btn mdui-ripple" mdui-dialog-close>我明白了</button>
      </div>
    </div>
{else}
{/if}
{/foreach}