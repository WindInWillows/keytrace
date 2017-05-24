<%--
  Created by IntelliJ IDEA.
  User: zhao
  Date: 2017/4/15
  Time: 16:31
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
    <title>文本型键盘识别-测试</title>
    <meta name="description" content="iDea a Bootstrap-based, Responsive HTML5 Template">
    <meta name="author" content="htmlcoder.me">

    <jsp:include page="head_inc.jsp" />
</head>

<body>

<div class="page-wrapper">
    <jsp:include page="header.jsp" />

    <div class="page-intro">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <ol class="breadcrumb">
                        <li><i class="fa fa-home pr-10"></i><a href="index.jsp">主页</a></li>
                        <<li class="active"><a href="toFreetext.action">文本型键盘识别</a></li>
                        <li class="active">测试</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <section class="main-container" alignment="center">
        <div class="container">
            <div class="row">

                <div id="free-text-div" style="margin: 0 auto; border: solid 2px #eee; width: 80%; padding: 10px;" >
                    <div id="judge-result" class="alert alert-success" role="alert" hidden></div>

                    <p class="random-text" ><span class="entered"></span><span class="unentered"></span></p>
                    <textarea class="input-area" style="width: 100%; height: 200px; ime-mode: disabled" id="text-input0" onkeydown="keyAction(0,0)" onkeyup="keyAction(1,0)" <%--onpaste="return false;" --%>></textarea>
                    <br /><br />
                    <button type="button" class="btn btn-primary" id="judge-btn">提交</button>
                    <br />
                </div>
            </div>
            <br>
            <p style="text-align: center">
                <a href="toSignup.action" class="btn btn-white margin-top-clear">体验密码型键盘识别</a>
            </p>
        </div>
    </section>

    <jsp:include page="footer.jsp" />

</div>
<!-- page-wrapper end -->

<!-- zhaoge-->
<script type="text/javascript">

    var judgeText = function (rec) {
        var res = "";
        for(var i=0;i<MAXN;i++)
            res+=rec[i];
        $.post("judgeText",
            {
                record:res,
            },
            function (data) {
                $("#judge-result").html("匹配率："+data+"%!");
                $("#judge-result").show();
            });
    }

    $(document).ready(function () {

        var ran_text = load_random_text(MAXN);

        $("#judge-btn").click(function () {
            var flag = true;
            for (var i=0;i<MAXN;i++) {
                var rate = editDistance($("#text-input"+i).val(), ran_text[i])/1.0/ran_text[i].length;
                if (rate>0.2) {
                    flag = false;
                    alert("第"+(i+1)+"个文本框错误太多，请重新输入！");
                    $("#text-input"+i).focus();
                    return;
                }
            }
            if(flag) {
                judgeText(record);
            }
        });

    });
</script>
<script type="text/javascript">
    var MAXN = 1;
</script>
<!--end-->
<script src="js/main.js"></script>
</body>
</html>
