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

<div class="jumbotron" style="margin:20px;">
  <h1>KeyTrace</h1>
  <p>请在下面的文本框中输入！</p>
</div>


<div style="margin: 20px;">
  <textarea style="ime-mode:disabled" id="text-input0" rows="8" cols="150" onkeydown="keyAction(0,0)" onkeyup="keyAction(1,0)"> </textarea>
  <br /><br />
  <textarea style="ime-mode: disabled" id="text-input1" rows="8" cols="150" onkeydown="keyAction(0,1)" onkeyup="keyAction(1,1)"></textarea>
  <br /><br />
  <textarea style="ime-mode: disabled" id="text-input2" rows="8" cols="150" onkeydown="keyAction(0,2)" onkeyup="keyAction(1,2)"></textarea>
  <br /><br />
  <button type="button" class="btn btn-primary" id="download-btn">保存到文件</button>
  <br />

</div>

<div class="show-div" style="margin: 20px;">
  <span id="show-head">
    键码 毫秒 类型<br />
  </span>
</div>
<script>
  var record = ["key,ms,type\n","key,ms,type\n","key,ms,type\n"];
  var ab_pre = [-1,-1,-1];
  var re_pre = [-1,-1,-1];

  var filter = function (ms,t) {
    var ans = ms - ab_pre[t] + re_pre[t];
    if(ms <= ab_pre[t]) {
      ans += 60000;
    }
    if(ab_pre[t] == -1 && re_pre[t] == -1) {
      ans = 0;
    }
    ab_pre[t] = ms;
    re_pre[t] = ans;
    return ans;
  }

  var keyAction = function(a,t) {
    var e = event || window.event || arguments.callee.caller.arguments[0];
    var d = new Date();
    var str = e.keyCode +","+ filter(d.getSeconds()*1000 + d.getMilliseconds(),t)+','+a+"\n";
    var newspan = $("<span></span><br />").text(str);
    $("#show-head").append(newspan);
    record[t] += str;
  }


  var downloadFile = function (record) {
    var res = "";
    record.forEach(function (v) {res+=v;})
    $.post("downloadFile",
      {
        text:$("#text-input").val(),
        record:res,
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
</div>

</body>

</html>
