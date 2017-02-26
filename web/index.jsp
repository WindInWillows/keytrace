<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <script src="js/jquery.min.js"> </script>
</head>

<body>

  <textarea name="record" rows="8" cols="80" onkeydown="keyAction(0)" onkeyup="keyAction(1)"> </textarea>
  <br />
  <button id="download-btn">保存到文件</button>

<div class="show-div">
  <span id="show-head">
    键码  秒 毫秒 类型<br />
  </span>
</div>
<script>
  var record = "";

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
