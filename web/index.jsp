<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">

  <script src="js/jquery.min.js"> </script>
  <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
  <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
  <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>

<body>

<div class="jumbotron" style="margin:20px;">
  <h1>KeyTrac</h1>
  <p>请在下面的文本框中输入！</p>
</div>
<div style="margin: 20px;">
  <textarea rows="8" cols="150" onkeydown="keyAction(0)" onkeyup="keyAction(1)"> </textarea>
  <br /><br />
  <button type="button" class="btn btn-primary" id="download-btn">保存到文件</button>
  <br />
</div>


<div class="show-div" style="margin: 20px;">
  <span id="show-head">
    键码  秒 毫秒 类型<br />
  </span>
</div>
<script>
  var record = "按键码,秒,毫秒,类型\n";

  var keyAction = function(a) {
    var e = event || window.event || arguments.callee.caller.arguments[0];
    var d = new Date();
    var str = e.keyCode +","+ d.getSeconds() + "," + d.getMilliseconds()+','+a+"\n";
    var newspan = $("<span></span><br />").text(str);
    $("#show-head").append(newspan);
    record += str;
  }

  var downloadFile = function (record) {
    $.post("downloadFile",
      {
        record:record,
      },
      function (data) {
        window.location.href = data;
      }
    );
  }

  $(document).ready(function () {
    $("#download-btn").click(function () {
      downloadFile(record);
    });
  });

</script>
</body>
</html>
