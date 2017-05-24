<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
  <meta charset="utf-8">
  <title>注册</title>
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
            <li class="active"><a href="toSignup.action">密码型键盘识别</a></li>
            <li class="active">训练</li>
          </ol>
        </div>
      </div>
    </div>
  </div>

  <div class="section clearfix">
    <div class="container">
      <h2>密码型键盘识别指南</h2>
      <div class="process">
        <ul class="nav nav-pills white space-top" role="tablist">
          <li class="active"><a href="#pill-1" role="tab" data-toggle="tab" title="Step 1"><i class="fa fa-dot-circle-o pr-5"></i> 第一步</a></li>
          <li><a href="#pill-2" role="tab" data-toggle="tab" title="Step 2"><i class="fa fa-dot-circle-o pr-5"></i> 第二步</a></li>
          <li><a href="#pill-3" role="tab" data-toggle="tab" title="Step 3"><i class="fa fa-dot-circle-o pr-5"></i> 第三步</a></li>
        </ul>
        <div class="tab-content clear-style">
          <div class="tab-pane active" id="pill-1">
            <h3>输入一组账户密码</h3>
            <p>在下方的模拟注册页面中，输入一组账号密码及确认密码</p>
            <p>（建议您输入您经常输入的序列作为密码但不要输入真实使用的密码信息，尽管为确保传输安全，我们在网络传输过程中采用了SSL协议）</p>
          </div>
          <div class="tab-pane" id="pill-2">
            <h3>训练并学习您的输入习惯</h3>
            <p>和文字型键盘识别一样，浏览器将您的输入习惯发回云服务器，服务器经过特定的算法，学习出您特有的输入特征，并存与数据库</p>
          </div>
          <div class="tab-pane" id="pill-3">
            <h3>测试输入者的身份</h3>
            <p>在测试页面中，输入者再次输入第一步中的密码，相关数据发回服务器后，经过计算即可得出该输入者与第一步中输入者为同一人的概率大小</p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <section class="main-container" alignment="center">
    <div class="container">
      <div class="row">
        <div id="sign-up-div" style="padding: 20px; margin: 0 auto; width: 30%; border: solid 2px #eee">
          <form>

            <div id="alert-dan" class="alert alert-danger" role="alert" hidden></div>
            <div id="alert-suc" class="alert alert-success" role="alert" hidden>注册成功！正在跳转...</div>

            <div class="form-group">
              <label for="input-name">用户名</label>
              <input type="text" class="form-control" id="input-name" placeholder="3位以上用户名">
            </div>

            <div class="form-group">
              <label for="input-pass1">密码</label>
              <input autocomplete="false"
                     onkeydown="keyAction(0,0)" onkeyup="keyAction(1,0)"
                     type="password" class="form-control" id="input-pass1" placeholder="6位以上密码">
            </div>

            <div class="form-group">
              <label for="input-pass2">确认密码</label>
              <input
                      onkeydown="keyAction(0,1)" onkeyup="keyAction(1,1)"
                      type="password" class="form-control" id="input-pass2" placeholder="确认密码">
            </div>
            <table>
              <tr>
                <td>
                  <input type="button" id="btn-signup" class="btn btn-primary" value="注册"/>
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>
                  <a href="toLogin">已注册？</a>
                </td>
              </tr>
            </table>
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
    var MAXN = 2;
</script>
<script>

    var validate = function () {
        var username = $("#input-name").val();
        var pass1 = $("#input-pass1").val();
        var pass2 = $("#input-pass2").val();
        if (username.length < 3 || username.length > 12 || !username.match("[a-zA-Z0-9_]+")) {
            error("用户名不合法！");
            return false;
        }
        if (pass1.length < 6 || pass1.length > 20 || !pass1.match("[a-zA-Z0-9]+")) {
            error("密码至少6位");
            return false;
        }
        if (pass2 != pass1) {
            error("两次密码不一致！");
            return false;
        }
        return true;
    }

    var error = function (info) {
        var obj = $("#alert-dan");
        obj.html(info);
        obj.show();
        setTimeout(function () {
            obj.hide();
            window.location.href = "toSignup";
        }, 2000);
    }
    $(document).ready(function () {
        $("#input-name").blur(function () {
            $.post("hasUser",
                {user_name: $(this).val(),},
                function (result) {
                    if (result == "true") {
                        error("用户名已存在！");
                    }
                });
        });

        $("#btn-signup").click(function () {
            if (!validate()) return;
            var res = "";
            for (var i = 0; i < MAXN; i++)
                res += record[i];
            $.post("signup",
                {
                    user_name: $("#input-name").val(),
                    user_pass: $("#input-pass1").val(),
                    record: res,
                },
                function (data) {
                    if (data.length > 0) {
                        $("#alert-suc").show();
                        setTimeout(function () {
                            window.location.href = "toLogin";
                        }, 2000);
                    }
                    else {
                        error("未知错误，请重试！");
                    }
                }
            );
        })
    })

</script>
<script src="js/main.js"></script>
</body>

</html>
