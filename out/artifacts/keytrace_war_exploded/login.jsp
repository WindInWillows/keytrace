<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <script type="text/javascript">
      var MAXN = 1;
  </script>
  <script src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
  <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
  <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
  <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <script src="js/main.js"></script>

</head>

<body>

<div class="jumbotron" style="margin:20px; width: 80%;">
  <h1>KeyTrace</h1>
  <p>请在下面的文本框中输入！</p>
</div>

<div id="login-div" style="padding: 20px; margin: 20px; width: 30%; border: solid 2px #eee" >
  <form >
    <div id="alert-pass-error" class="alert alert-danger" role="alert" hidden>用户名或密码错误！</div>
    <div id="alert-pass-result" class="alert alert-success" role="alert" hidden></div>

    <div class="form-group">
      <label for="login-name">用户名</label>
      <input type="text" class="form-control" id="login-name" placeholder="用户名">
    </div>

    <div class="form-group">
      <label for="login-pass">密码</label>
      <input onkeydown="keyAction(0,0)" onkeyup="keyAction(1,0)" type="password" class="form-control" id="login-pass" placeholder="密码">
    </div>

    <input id="btn-login" class="btn btn-primary" value="登录" />
    <a href="toLogin">再试一次</a>
  </form>
</div>

<script type="text/javascript">

    $(document).ready(function () {

        $("#btn-login").click(function () {
            var res = "";
            for(var i=0;i<MAXN;i++)
                res+=record[i];
            $.post('login',
                {
                    user_name:$("#login-name").val(),
                    user_pass:$("#login-pass").val(),
                    record:res,
                },
                function (res) {
                    if(res=="") {
                        $("#alert-pass-error").show();
                        setTimeout(function () {
                            $("#alert-pass-error").hide();
                        },2000);
                    } else {
                        $("#alert-pass-result").html("登录成功！匹配率"+res+"%");
                        $("#alert-pass-result").show();
                    }
                })
        })
    })
</script>

</div>

</body>

</html>
