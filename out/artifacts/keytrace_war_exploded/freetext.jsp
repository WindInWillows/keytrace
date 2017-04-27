<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">

  <script type="text/javascript">var MAXN = 2;</script>

  <script src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
  <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
  <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
  <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <script src="js/main.js"></script>
  <link rel="stylesheet" href="css/main.css">

</head>

<body>

<div class="jumbotron" style="margin:20px; width: 80%;">
  <h1>KeyTrace</h1>
  <p>请在下面的文本框中输入！</p>
</div>

<div id="free-text-div" style="margin: 20px; border: solid 2px #eee; width: 80%; padding: 10px;" >
  <p class="random-text" ><span class="entered"></span><span class="unentered"></span></p>
  <textarea class="input-area" style="ime-mode:disabled" id="text-input0" rows="8" cols="140" onkeydown="keyAction(0,0)" onkeyup="keyAction(1,0)" <%--onpaste="return false;" --%>></textarea>
  <br /><br />
  <p class="random-text" ><span class="entered"></span><span class="unentered"></span></p>
  <textarea class="input-area" style="ime-mode: disabled" id="text-input1" rows="8" cols="140" onkeydown="keyAction(0,1)" onkeyup="keyAction(1,1)" <%--onpaste="return false;"--%>></textarea>
  <br /><br />

  <button type="button" class="btn btn-primary" id="learn-btn">提交</button>
  <br />

</div>


<div class="show-div" style="margin: 20px;">
  <span id="show-head">
    键码 毫秒 类型<br />
  </span>
</div>

<script type="text/javascript">
    var learnPattern = function (rec) {
        var res = "";
        for(var i=0;i<MAXN;i++)
            res+=rec[i];
        $.post("learnPattern",
            {
                record:res,
            },function () {
                window.location.href = "toJudge";
            });
    }

    $(document).ready(function () {
        var ran_text = load_random_text(MAXN);

        $("#learn-btn").click(function () {
            var flag = true;
            for (var i=0; i<MAXN; i++) {
                var rate = editDistance($("#text-input"+i).val(), ran_text[i])/1.0/ran_text[i].length;
                if (rate>0.2) {
                    flag = false;
                    alert("第"+(i+1)+"个文本框错误太多，请重新输入！");
                    $("#text-input"+i).focus();
                    return;
                }
            }
            if(flag) {
                learnPattern(record);
            }
        });

    });
</script>

</div>

</body>

</html>
