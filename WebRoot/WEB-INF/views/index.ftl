<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>UcanerPay</title>
</head>

<body>
账户信息添加用于下面测试
<div>
    <form id="form">
    账户id<input type="text" name="payId">
    <br>
    支付合作id<input type="text" name="partner">
    <br>
    应用id<input type="text" name="appid">
    <br>
    支付平台公钥(签名校验使用)<input type="text" name="publicKey"><b>支付公钥，sign_type只有单一key时public_key与private_key相等，比如sign_type=MD5(友店支付除外)的情况</b>
    <br>
    应用私钥(生成签名使用)<input type="text" name="privateKey">
    <br>
    异步回调地址<input type="text" name="notifyUrl"><b>友店支付用不到此参数，在友店管理端进行配置</b>
    <br>
    同步回调地址<input type="text" name="returnUrl"><b>同上</b>
    <br>
    收款账号(即时付款填写支付合作id)<input type="text" name="seller"><b>针对支付宝</b>
        <br/>
    签名类型<select name="signType">
    <option>MD5</option>
    <option>RSA</option>
    <option>RSA2</option>
</select>
    <br>
    编码类型(建议UTF-8)<input type="text" name="inputCharset" value="UTF-8">
    <br>
    支付账户类型 <select name="payType">
    <option value="aliPay">aliPay</option>
    <option value="wxPay">wxPay</option>
    <option value="youdianPay">youdianPay</option>
    <option value="youdianPay">fuiou</option>
</select><b>此处为开发者自定义，详情请查看 com.egzosn.pay.demo.entity.PayType</b>
    <br>
    消息类型 <select name="msgType">
    <option>text</option>
    <option>xml</option>
    <option>json</option>
</select>
    <br>
        是否为沙箱环境<select type="text" name="isTest">
        <option value="true">是</option>
        <option value="false">否</option>
    </select>
    <br>
    </form>
    <button id="submit">提交</button>
</div>

<br/>
<div>各个支付对应的<b>交易类型</b>可自行查看对应的官方文档，本项目已实现几种交易类型,对应各个支付类型的<code>com.egzosn.pay.common.bean.TransactionType</code>具体实现</div>
<div>旧版支付宝(<code>com.egzosn.pay.ali.before.bean.AliTransactionType</code>)： 即时付款=DIRECT ， 移动支付=APP ， 手机网站支付=WAP</div>
<div>新版支付宝(<code>com.egzosn.pay.ali.bean.AliTransactionType</code>)：  即时付款=DIRECT ， app支付=APP ， 手机网站支付=WAP , 扫码付=SWEEPPAY, 条码付=BAR_CODE, 声波付=WAVE_CODE </div>
<div>微信(<code>com.egzosn.pay.wx.bean.WxTransactionType</code>)： 公众号支付=JSAPI ， 移动支付=APP ， 扫码付=NATIVE</div>
<div>友店微信(<code>com.egzosn.pay.wx.youdian.bean.YoudianTransactionType</code>)： 扫码付=NATIVE</div>
<div>富友(<code>com.egzosn.pay.fuiou.bean.FuiouTransactionType</code>)： B2B，B2C</div>

<br>
<br>
<br>
APP提交(返回对应的json，具体实现，app端demo暂时未实现)
<form action="
getOrderInfo" target="_blank">
    账户id<input type="text" name="payId">
    <br>
    金额<input type="text" name="price">
    <br>
    交易类型<input type="text" name="transactionType" value="APP" readonly>
    <br>
    <input type="submit" value="提交">
</form>

<br>
普通web提交
<form action="toPay.html" target="_blank">
    账户id<input type="text" name="payId">
    <br>
    金额<input type="text" name="price">
    <br>
    交易类型<input type="text" name="transactionType">
    <br>
    <input type="submit" value="提交">
</form>
<br>
公众号支付(请用微信访问)
<form id="jsapi" >
    账户id<input type="text" name="payId">
    <br>
    金额<input type="text" name="price">
    <br>
    openid<input type="text" name="openid">
    <br>
    <button id="js_submit">提交</button>
</form>

<br>
二维码
<form action="toQrPay.jpg" target="_blank">
    账户id<input type="text" name="payId">
    <br>
    金额<input type="text" name="price">
    <br>
    交易类型<input type="text" name="transactionType">
    <br>
    <input type="submit" value="提交">
</form>
<br>

支付宝微信一码付二维码
<form action="toWxAliQrPay.jpg" target="_blank">
    账户（微信）id<input type="text" name="wxPayId">
    <br>
    账户(支付宝)id<input type="text" name="aliPayId">
    <br>
    金额<input type="text" name="price">
    <br>
    <br>
    <input type="submit" value="提交">
</form>
<br>
查询账单
<form action="query" target="_blank">
    账户id<input type="text" name="payId">
    <br>
    支付平台订单号<input type="text" name="tradeNo">
    <br>
    商户单号<input type="text" name="outTradeNo">
    <br>
    <input type="submit" value="提交">
</form>
<br/>
交易关闭接口
<form action="close" target="_blank">
    账户id<input type="text" name="payId">
    <br>
    支付平台订单号<input type="text" name="tradeNo">
    <br>
    商户单号<input type="text" name="outTradeNo">
    <br>
    <input type="submit" value="提交">
</form>
<br/>
申请退款接口
<form action="refund" target="_blank">
    账户id<input type="text" name="payId">
    <br>
    支付平台订单号<input type="text" name="tradeNo">
    <br>
    商户单号<input type="text" name="outTradeNo">
    <br>
    退款金额<input type="text" name="refundAmount">
    <br>
    总金额(微信必填)<input type="text" name="totalAmount">
    <br>
    <input type="submit" value="提交">
</form>
<br/>
查询退款
<form action="refundquery" target="_blank">
    账户id<input type="text" name="payId">
    <br>
    支付平台订单号<input type="text" name="tradeNo">
    <br>
    商户单号<input type="text" name="outTradeNo">
    <br>
    <input type="submit" value="提交">
</form>

<br>
下载对账单(日期，不支持月份)
<form action="downloadbill" target="_blank">
    账户id<input type="text" name="payId">
    <br>
    账单时间：具体请查看对应支付平台<input type="text" name="billDate">
    <br>
    账单类型 <input type="text" name="billType">
    <br>
    <input type="submit" value="提交">
</form>

<br>
通用查询接口，根据 交易类型（TransactionType） 进行实现,此接口不包括退款
<form action="secondaryInterface" target="_blank">
    账户id<input type="text" name="payId">
    <br>
    支付平台订单号或者账单日期<input type="text" name="tradeNoOrBillDate">
    <br>
    商户单号或者 账单类型<input type="text" name="outTradeNoBillType">
    <br>
    交易类型<input type="text" name="transactionType">
    <br>
    <input type="submit" value="提交">
</form>
<script src="${basePath}/static/jquery/jquery-3.1.1.min.js"></script>
<script>
   $(function ($) {
        $("#submit").click(function () {
            $.ajax({
                url : "add",
                type : "post",
                data : $("#form").serialize(),
                dataType : 'json',
                success : function(data) {
                    if (data.code == 0){
                        alert("保存成功");
                        return;
                    }
                    alert("保存失败");
                },
                error : function(edata) {
                    alert("服务器异常")
                }
            })
        }) ;
       $("#js_submit").click(function () {
            $.ajax({
                url : "jsapi",
                type : "post",
                async: true,
                data : $("#jsapi").serialize(),
                dataType : 'json',
                success : function(data) {
                    if (data.code == 0){
                        if (typeof WeixinJSBridge == "undefined"){
                            if( document.addEventListener ){
                                document.addEventListener('WeixinJSBridgeReady', onBridgeReady(data), false);
                            }else if (document.attachEvent){
                                document.attachEvent('WeixinJSBridgeReady', onBridgeReady(data));
                                document.attachEvent('onWeixinJSBridgeReady', onBridgeReady(data));
                            }
                        }else{
                            onBridgeReady(data);
                        }
                        return;
                    }
                    alert("保存失败");
                },
                error : function(edata) {
                    alert("服务器异常")
                }
            })
        })
   });
   function onBridgeReady(data){
       WeixinJSBridge.invoke(
           'getBrandWCPayRequest', {
               "appId": data.appid,     //公众号名称，由商户传入
               "timeStamp": data.timestamp,         //时间戳，自1970年以来的秒数
               "nonceStr": data.noncestr, //随机串
               "package": data.package,
               "signType": data.signType,         //微信签名方式：
               "paySign": data.sign //微信签名
           },
           function(res){
               // 使用以断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。
               if(res.err_msg == "get_brand_wcpay_request:ok" ) {
                   alert("支付成功")

               }
           }
       );
   }

</script>
<script type="text/javascript" src="${basePath}/static/jwexin/jweixin-1.0.0.js"></script>
</body>
</html>
