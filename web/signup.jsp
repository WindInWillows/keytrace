<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <script type="text/javascript">
      var MAXN = 2;
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

<div id="sign-up-div" style="padding: 20px; margin: 20px; width: 30%; border: solid 2px #eee">
  <form >
    <div id="alert-has" class="alert alert-danger" role="alert" hidden>用户名已被注册！</div>
    <div id="alert-suc" class="alert alert-success" role="alert" hidden>注册成功！正在跳转...</div>

    <div class="form-group">
      <label for="input-name">用户名</label>
      <input type="text" class="form-control" id="input-name" placeholder="用户名">
    </div>

    <div class="form-group">
      <label for="input-pass1">密码</label>
      <input autocomplete="false"
             onkeydown="keyAction(0,0)" onkeyup="keyAction(1,0)"
             type="password" class="form-control" id="input-pass1" placeholder="密码">
    </div>

    <div class="form-group">
      <label for="input-pass2">确认密码</label>
      <input
              onkeydown="keyAction(0,1)" onkeyup="keyAction(1,1)"
              type="password" class="form-control" id="input-pass2" placeholder="确认密码">
    </div>

    <input type="button" id="btn-signup" class="btn btn-primary" value="注册并学习" />
    <a href="toLogin">已注册？</a>
  </form>
</div>

<div class="show-div" style="margin: 20px;">
  <span id="show-head">
    键码 毫秒 类型<br />
  </span>
</div>

<script>
    $(document).ready(function () {
        $("#btn-signup").click(function () {
            var pass1 = $("#input-pass1").val();
            var pass2 = $("#input-pass2").val();
            if(pass1==pass2) {
                var res = "";
                for(var i=0;i<MAXN;i++)
                    res+=record[i];
                $.post("signup",
                    {
                        user_name:$("#input-name").val(),
                        user_pass:pass1,
                        record:res,
                    },
                    function (data) {
                        if(data.length>0) {
                            $("#alert-suc").show();
                            setTimeout(function () {
                                window.location.href = "toLogin";
                            },2000);
                        }
                        else {
                            $("#alert-has").show();
                            setTimeout(function () {
                                window.location.href = "toSignup";
                            },2000)
                        }
                    }
                );
            }
        })
    })

</script>

</div>



</body>

</html>
