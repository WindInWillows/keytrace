<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">

  <script src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
  <script src="js/md5.min.js"></script>
  <script src="js/jquery.min.js"></script>

  <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
  <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
        integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
  <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
          integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
          crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/normalize.css">

  <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />

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

<div class="jumbotron" style="margin:20px; width: 80%;">
  <h1>KeyTrace</h1>
  <p>请在下面的文本框中输入！</p>
</div>

<div class="try-out__solution-switch-trigger">
  <div class="switch"><input class='tgl tgl-ios' id='toggle' type='checkbox'>
    <label class='tgl-btn' for='toggle'></label></div>
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
    if(a==1) updateText(e);
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

  var downloadFile = function (record) {
    var res = "";
    record.forEach(function (v) {res+=v;})
    $.post("downloadFile",
      {
        ran:$("#random-key").val(),
        record:res,
      },
      function (data) {
          if(data.length > 0) {
              alert("保存成功！");
              window.location.href = "/keytrace";
          }
      }
    );
  }

  var load_random_text = function () {
    var res = null;
    $.ajax({
      url:"loadRandomText",
      async:false,
      success:function (data) {
        var ps = $(".random-text");
        for (var i = 0; i < ps.length; i++) {
          $($(ps[i]).children()[1]).text(data[i]);
        }
        res = data;
      }
    });
    return res;
  }

  var editDistance = function (s1,s2) {
    var len1=s1.length,len2=s2.length;
    var matrix=[];
    var i,j;

    for(i = 0;i <= len1;i++){
      matrix[i]=[];
      matrix[i][0] = i;
    }
    for(j = 0;j <= len2;j++){
      matrix[0][j] = j;
    }
    for(i = 1;i <= len1;i++){
      for(j = 1;j <= len2;j++) {
        var temp = s1[i-1] == s2[j-1] ? 0 : 1;
        matrix[i][j] = Math.min( matrix[i-1][j] + 1 , matrix[i][j-1] + 1 , matrix[i-1][j-1] + temp);
      }
    }
    return matrix[len1][len2];
  }

  $(document).ready(function () {

    $("#random-key").val(parseInt(Math.random()*100000));
    var ran_text = load_random_text();

    $("#download-btn").click(function () {
      var flag = true;
      for (var i=0;i<3;i++) {
          var rate = editDistance($("#text-input"+i).val(), ran_text[i])/1.0/ran_text[i].length;
          if (rate>0.2) {
              flag = false;
              alert("第"+(i+1)+"个文本框错误太多，请重新输入！");
              $("#text-input"+i).focus();
              return;
          }
      }
      if (flag)
          downloadFile(record);
    });

  });

</script>

</div>

</body>

</html>
