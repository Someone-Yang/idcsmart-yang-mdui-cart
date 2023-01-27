# 智简魔方财务 氧MDUI 购物车主题

## 特点

- 手机端自适应
- 对未登录用户隐藏库存和价格
- 对猜产品 ID 进入配置页的未登录用户隐藏配置信息和价格
- 选填的产品组标语和介绍
- 产品组介绍由对话框单独弹出

## 说明

此主题需要安装[氧MDUI 用户中心主题](https://github.com/Someone-Yang/idcsmart-yang-mdui-clientarea)或自行引用 MDUI 文件。

只有启用库存、用户已登录、且库存小于 15 时，产品卡片的进度条才会发生变化。如果您是大厂，请您修改其中的参数。相关参数：

```
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
```

## 自定义字段

默认提供一个公告栏。字段为 `cartnotice` 。