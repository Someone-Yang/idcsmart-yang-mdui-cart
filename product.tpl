{include file="cart/incloudifynormal/topbar-categories"}
<style>
  .card-footer a {
    color: #6064ff;
    display: inline-block;
    width: 100%;
    line-height: 40px;
    background: #fff;
  }

  .cartitem {
    background-color: #f5f7f9;
  }

  .cartitem.active {
    background: #fff;
  }
  .cartitem.active .card-footer {
    background-color: #f1672a!important;
  }
  

  .cartitem.active .card-footer a {
    background-color: #6064ff!important;
    color: #fff;
    z-index: 99;
  }
</style>
<link rel="stylesheet" href="/themes/cart/province/assets/fonts/iconfont.css?v={$Ver}">
<div class="mdui-row">
  <div class="mdui-row-xs-1 mdui-row-sm-2 mdui-row-md-4">
  
      {if $Cart.products}
          {foreach $Cart.products as $list}
          <div class="mdui-col mdui-p-a-1">
            <div class="mdui-card mdui-hoverable">
                <div class="mdui-card-primary">
                    <div class="mdui-card-primary-title mdui-text-truncate{if $Userinfo && $list.stock_control==1 && $list.qty<1} mdui-text-color-grey{/if}" mdui-tooltip="{content: '{$list.name}{if $Userinfo && $list.stock_control==1 && $list.qty<1}（此产品已售罄，请优先选择其他产品）{/if}'}">
                        {$list.name}
                    </div>
                </div>
                <div class="mdui-card-content">
                    {$list.description}
                    <hr>
                    {if $Userinfo}
                        {if $list.stock_control==1}
                            此产品限制库存，预计库存余量：
                            <div class="mdui-progress" mdui-tooltip="{content: '此产品（{$list.name}）库存余量由财务端报告，仅供参考。如有疑问请发起工单联系运维人员。'}">
                                {if $list.qty<1}
                                    <div class="mdui-progress-determinate mdui-color-red" style="width: 2%;"></div>
                                {elseif $list.qty<5}
                                    <div class="mdui-progress-determinate mdui-color-orange" style="width: 10%;"></div>
                                {elseif $list.qty<10}
                                    <div class="mdui-progress-determinate mdui-color-amber" style="width: 30%;"></div>
                                {elseif $list.qty<15}
                                    <div class="mdui-progress-determinate  mdui-color-blue" style="width: 50%;"></div>
                                {else}
                                    <div class="mdui-progress-determinate  mdui-color-green" style="width: 70%;"></div>
                                {/if}
                            </div>
                        {else}
                            此产品库存充足。
                            <div class="mdui-progress">
                                <div class="mdui-progress-determinate mdui-color-green" style="width: 90%;"></div>
                            </div>
                        {/if}
                        标准报价：{$Cart.currency.prefix} {$list.product_price} {$Cart.currency.suffix} / {$list.billingcycle_zh}
                    {else}
                        无法获取库存信息，请尝试<a href="/login">登录</a>。
                            <div class="mdui-progress">
                                <div class="mdui-progress-indeterminate mdui-color-grey"></div>
                            </div>
                        无法获取报价，请尝试<a href="/login">登录</a>。
                    {/if}
                </div>
                <div class="mdui-card-actions">
                    {if $Userinfo}
                        {if $list.stock_control==1 && $list.qty<1} 
                            <a href="javascript:;" class="mdui-btn" disabled><i class="mdui-icon material-icons">block</i> 已售罄</a>
                            <a href="/supporttickets" class="mdui-btn mdui-btn-icon" mdui-tooltip="{content: '联系补货'}"><i class="mdui-icon material-icons">add_alert</i></a>
                        {else}
                            <a href="/cart?action=configureproduct&pid={$list.id}{if $Get.site}&site={$Get.site}{/if}" class="mdui-btn"><i class="mdui-icon material-icons">add_circle_outline</i> 进入选配页面</a>
                        {/if}
                    {else}
                        <a href="javascript:;" class="mdui-btn" disabled><i class="mdui-icon material-icons">block</i> 无法获取报价</a>
                        <a href="/login" class="mdui-btn mdui-btn-icon" mdui-tooltip="{content: '登录'}"><i class="mdui-icon material-icons">person_add</i></a>
                    {/if}
                </div>
            </div>
          </div>
              
          {/foreach}
      {else}
      <div class="mdui-card mdui-p-a-1">
        <div class="mdui-card-primary">
            <div class="mdui-card-primary-title">
                未发现产品
            </div>
        </div>
        <div class="mdui-card-content">
            筛选条件下，未找到适合玲行云端魔方控制台的产品。产品可能已售罄或不适合您所在的国家或地区，请更改筛选条件或查阅其他玲行云端用户中心。
        </div>
      </div>
      {/if}
    
  </div>
</div>

<script>
  $(function () {
    $('.cartitem').on('mouseover', function () {
      $(this).addClass('active')
    })
    $('.cartitem').on('mouseleave', function () {
      $(this).removeClass('active')
    })
  })
</script>