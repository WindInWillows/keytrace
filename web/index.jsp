<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">

  <script src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
  <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
  <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
  <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>

<body>

<div class="jumbotron" style="margin:20px; width: 80%;">
  <h1>KeyTrace</h1>
  <p>请在下面的文本框中输入！</p>
</div>

<div class="switch switch-large" style="margin: 20px;">
  <button id="toggle" class="btn btn-primary">toggle</button>
</div>

<jsp:include page="signup.jsp" />
<jsp:include page="login.jsp" />
<jsp:include page="freetext.jsp" />

<div class="show-div" style="margin: 20px;" hidden>
  <span id="show-head">
    键码 毫秒 类型(按下0，松开1)<br />
  </span>
</div>

<script type="text/javascript">

  var toggle = function (n) {
      var objs = [$("#sign-up-div"),$("#login-div"),$("#free-text-div")];
      for (var i=0; i<objs.length;i++) {
          if(i==n){
              objs[i].show();
          } else {
              objs[i].hide();
          }
      }
  }
  $(document).ready(function () {
      var tog = 0;
      $("#toggle").click(function () {
          tog++;
          if(tog%2==0) {
              toggle(0);
          } else {
              toggle(2);
          }
      });
  })
</script>

</div>

</body>

</html>
