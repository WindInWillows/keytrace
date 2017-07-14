<%--
  Created by IntelliJ IDEA.
  User: cxy
  Date: 2017/7/13
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8">
    <title>结果</title>
    <meta name="description" content="iDea a Bootstrap-based, Responsive HTML5 Template">
    <meta name="author" content="htmlcoder.me">

    <jsp:include page="head_inc.jsp" />

</head>
<body>

<div class="page-wrapper">
    <jsp:include page="header.jsp"/>
    <div class="page-intro">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <ol class="breadcrumb">
                        <li><i class="fa fa-home pr-10"></i><a href="index.jsp">主页</a></li>
                        <li class="active"><a href="toFreetext.action">文本型键盘识别</a></li>
                        <li class="active">结果</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <section class="main-container" alignment="center">
        <div class="container">
            <div align="center">
                <h1 style="font-size: 2.1875rem;line-height: 1.5em;font-weight: 400;color: #455a67">Keyboardification 测试您属于本人的概率如下</h1>
            </div>
            <div class="row">
                <div id="login-div" style="padding: 20px; margin: 0 auto; width: 30%;">
                    <svg id="circle" width="97%" height="250"></svg>
                </div>
            </div>
        </div>

        <script language="JavaScript">
            var res=JSON.parse(window.sessionStorage.getItem("res"));
            //alert(res);

            loadLiquidFillGauge("circle", res);
            var config1 = liquidFillGaugeDefaultSettings();
            config1.circleColor = "#FF7777";
            config1.textColor = "#FF4444";
            config1.waveTextColor = "#FFAAAA";
            config1.waveColor = "#FFDDDD";
            config1.circleThickness = 0.2;
            config1.textVertPosition = 0.2;
            config1.waveAnimateTime = 1000;
        </script>

        <p style="text-align: center">
            <a href="toJudge.action" class="btn btn-white margin-top-clear">重新尝试</a>
        </p>
    </section>

    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
