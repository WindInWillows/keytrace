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

  <style>
    .entered {
      font-size: larger;
      color: #d9edf7;
      background-color: rgba(212, 165, 66, 0.9);
    }
    .full {
      font-size: larger;
      color: #d9edf7;
      background-color: rgba(0, 100, 0, 0.7);

    }
    .overflow {
      font-size:larger;
      color: #d9edf7;
      background-color: rgba(255, 0, 0, 0.7);
    }
  </style>

</head>

<body>

<div class="jumbotron" style="margin:20px;">
  <h1>KeyTrace</h1>
  <p>请在下面的文本框中输入！</p>
</div>


<div style="margin: 20px;">
    <p class="random-text" ><span class="entered"></span><span class="unentered"></span></p>
  <textarea class="input-area" style="ime-mode:disabled" id="text-input0" rows="8" cols="150" onkeydown="keyAction(0,0)" onkeyup="keyAction(1,0)"> </textarea>
  <br /><br />
    <p class="random-text" ><span class="entered"></span><span class="unentered"></span></p>
  <textarea class="input-area" style="ime-mode: disabled" id="text-input1" rows="8" cols="150" onkeydown="keyAction(0,1)" onkeyup="keyAction(1,1)"></textarea>
  <br /><br />
    <p class="random-text" ><span class="entered"></span><span class="unentered"></span></p>
  <textarea class="input-area" style="ime-mode: disabled" id="text-input2" rows="8" cols="150"  onkeydown="keyAction(0,2)" onkeyup="keyAction(1,2)"></textarea>
  <br /><br />
  <button type="button" class="btn btn-primary" id="download-btn">保存到文件</button>
  <br />
<input type="hidden" id="random-key" value=""/>
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

  var updateText = function (event) {
    var t = $(event.target);
    var p = $(t).prev();
    var span = $(p).children();
    var raw = $(span[0]).text()+$(span[1]).text();
    var entered = $(t).val();
    if(raw.length > entered.length) {
      $(span[0]).attr("class","entered");
      $(span[0]).text(raw.substr(0,entered.length));
      $(span[1]).text(raw.substr(entered.length));
    } else if(raw.length == entered.length) {
      $(span[0]).text(raw);
      $(span[0]).attr("class","full");
      $(span[1]).text("");
    } else {
      $(span[0]).text(raw);
      $(span[0]).attr("class","overflow");
      $(span[1]).text("");
    }
  }

  var keyAction = function(a,t) {
    var e = event || window.event || arguments.callee.caller.arguments[0];
    var d = new Date();
    var str = e.keyCode +","+ filter(d.getSeconds()*1000 + d.getMilliseconds(),t)+','+a+"\n";
    var newspan = $("<span></span><br />").text(str);
    $("#show-head").append(newspan);
    record[t] += str;
    if(a==1) updateText(e);
  }


  var downloadFile = function (record) {
    var res = "";
    record.forEach(function (v) {res+=v;})
    $.post("downloadFile",
      {
        ran:$("#random-key").val(),
        record:res,
      },
      function (data) {
        window.location.href = data;
      }
    );
  }

  var load_random_text = function () {
    $.post("loadRandomText",{},function (data) {
        var ps = $(".random-text");
        for(var i=0;i<ps.length;i++) {
            $($(ps[i]).children()[1]).text(data[i]);
        }
    });
  }

  $(document).ready(function () {

      $("#random-key").val(parseInt(Math.random()*10000));


      load_random_text();
    $("#download-btn").click(function () {
      downloadFile(record);
    });

  });

</script>
</div>

</body>

</html>
