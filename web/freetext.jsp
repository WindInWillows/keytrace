<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
  <meta charset="utf-8">
  <title>文本型键盘识别-训练</title>
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
            <li><i class="fa fa-home pr-10"></i><a href="/index.jsp">主页</a></li>
            <li class="active"><a href="toFreetext.action">文本型键盘识别</a></li>
            <li class="active">训练</li>
          </ol>
        </div>
      </div>
    </div>
  </div>

  <div class="section clearfix">
    <div class="container">
      <h2>文本型键盘识别指南</h2>
      <div class="process">
        <ul class="nav nav-pills white space-top" role="tablist">
          <li class="active"><a href="#pill-1" role="tab" data-toggle="tab" title="Step 1"><i class="fa fa-dot-circle-o pr-5"></i> 第一步</a></li>
          <li><a href="#pill-2" role="tab" data-toggle="tab" title="Step 2"><i class="fa fa-dot-circle-o pr-5"></i> 第二步</a></li>
          <li><a href="#pill-3" role="tab" data-toggle="tab" title="Step 3"><i class="fa fa-dot-circle-o pr-5"></i> 第三步</a></li>
        </ul>
        <div class="tab-content clear-style">
          <div class="tab-pane active" id="pill-1">
            <h3>记录您的输入信息</h3>
            <p>在下方的两个输入框中输入两段不同文字，浏览器会记住您的输入习惯</p>
          </div>
          <div class="tab-pane" id="pill-2">
            <h3>训练并学习您的输入习惯</h3>
            <p>浏览器将您的输入习惯发回云服务器，服务器经过一系列算法，学习出您特有的输入特征，并存与数据库</p>
          </div>
          <div class="tab-pane" id="pill-3">
            <h3>测试输入者的身份</h3>
            <p>在测试页面中，输入者再次输入一段文字，相关数据发回服务器后，经过计算即可得出该输入者与上一步中输入者为同一人的概率大小</p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <section class="main-container" alignment="center">
    <div class="container">
      <div class="row">
        <div id="free-text-div" style="margin: 0 auto; border: solid 2px #eee; width: 90%; padding: 10px;">
          <p class="random-text"><span class="entered"></span><span class="unentered"></span></p>
          <textarea class="input-area" style="width: 100%; height: 200px;
          ime-mode:disabled" id="text-input0" onkeydown="keyAction(0,0)"
                    onkeyup="keyAction(1,0)" <%--onpaste="return false;" --%>></textarea>
          <br/><br/>
          <p class="random-text"><span class="entered"></span><span class="unentered"></span></p>
          <textarea class="input-area" style="width: 100%; height: 200px; ime-mode: disabled" id="text-input1"
                    onkeydown="keyAction(0,1)"
                    onkeyup="keyAction(1,1)" <%--onpaste="return false;"--%>></textarea>
          <br/><br/>

          <button type="button" class="btn btn-primary" id="learn-btn">提交</button>
          <br/>

        </div>
      </div>
      <br>
      <p style="text-align: center">
        <a href="toSignup.action" class="btn btn-white margin-top-clear">体验密码型键盘识别</a>
      </p>
    </div>
  </section>

  <jsp:include page="footer.jsp"/>

</div>
<!-- page-wrapper end -->

<!-- zhaoge-->
<script type="text/javascript">var MAXN = 2;</script>
<script type="text/javascript">
    var learnPattern = function (rec) {
        var res = "";
        for (var i = 0; i < MAXN; i++)
            res += rec[i];
        $.post("learnPattern",
            {
                record: res,
            }, function () {
                window.location.href = "toJudge";
            });
    }

    $(document).ready(function () {
        var ran_text = load_random_text(MAXN);

        $("#learn-btn").click(function () {
            var flag = true;
            for (var i = 0; i < MAXN; i++) {
                var rate = editDistance($("#text-input" + i).val(), ran_text[i]) / 1.0 / ran_text[i].length;
                if (rate > 0.2) {
                    flag = false;
                    alert("第" + (i + 1) + "个文本框错误太多，请重新输入！");
                    $("#text-input" + i).focus();
                    return;
                }
            }
            if (flag) {
                learnPattern(record);
            }
        });

    });
</script>
<!--end-->
<script src="js/main.js"></script>
</body>
</html>
