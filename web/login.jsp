<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
  <meta charset="utf-8">
  <title>登陆</title>
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
            <li class="active"><a href="toSignup.action">密码型键盘识别</a></li>
            <li class="active">测试</li>
          </ol>
        </div>
      </div>
    </div>
  </div>
  <section class="main-container" alignment="center">
    <div class="container">
      <div class="row">
        <div id="login-div" style="padding: 20px; margin: 0 auto; width: 30%; border: solid 2px #eee">
          <form>
            <div id="alert-pass-error" class="alert alert-danger" role="alert" hidden>用户名或密码错误！</div>
            <div id="alert-pass-result" class="alert alert-success" role="alert" hidden></div>

            <div class="form-group">
              <label for="login-name">用户名</label>
              <input type="text" class="form-control" id="login-name" placeholder="用户名">
            </div>

            <div class="form-group">
              <label for="login-pass">密码</label>
              <input onkeydown="keyAction(0,0)" onkeyup="keyAction(1,0)" type="password"
                     class="form-control" id="login-pass" placeholder="密码">
            </div>

            <input id="btn-login" class="btn btn-primary" value="登录"/>
            <a href="toSignup.action">没有账号？</a>
          </form>
        </div>
      </div>
      <br>
      <p style="text-align: center">
        <a href="toFreetext.action" class="btn btn-white margin-top-clear">体验文本型键盘识别</a>
      </p>
    </div>
  </section>

  <jsp:include page="footer.jsp"/>

</div>
<!-- page-wrapper end -->


<!-- zhaoge-->
<script type="text/javascript">

    $(document).ready(function () {

        $("#btn-login").click(function () {
            var res = "";
            for (var i = 0; i < MAXN; i++)
                res += record[i];
            $.post('login',
                {
                    user_name: $("#login-name").val(),
                    user_pass: $("#login-pass").val(),
                    record: res,
                },
                function (res) {
                    if (res == "") {
                        $("#alert-pass-error").show();
                        setTimeout(function () {
                            $("#alert-pass-error").hide();
                        }, 2000);
                    } else {
                        $("#alert-pass-result").html("登录成功！匹配率" + res + "%");
                        $("#alert-pass-result").show();
                    }
                })
        })
    })
</script>
<script type="text/javascript">
    var MAXN = 1;
</script>
<!--end-->
<script src="js/main.js"></script>
</body>

</html>
