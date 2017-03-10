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

<%--  <link href="js/main.css" data-turbolinks-track="true">
    <script src="js/main.js" data-turbolinks-track="true"></script>--%>

  <link rel="stylesheet" media="all"
        href="https://cdn-frontend.keytrac.net/assets/application-696da57c543834bb63f6565857f37b63abcbeca8ffd9aa2cf833594d93fe98a2.css"
        data-turbolinks-track="true"/>
  <script src="https://cdn-frontend.keytrac.net/assets/application-7600c8c3be529fc546635b941e11d5833df03621619a78bdddb4565b25363eed.js"
          data-turbolinks-track="true"></script>

</head>

<body>

<div class="jumbotron" style="margin:20px;">
  <h1>KeyTrace</h1>
  <p>请在下面的文本框中输入！</p>
</div>

<div class="site-content">
  <section class="information try-out">
    <div class="information__content">
      <div class="try-out__solution-switch">
        <div class="try-out__solution-switch-content">
          <span class="keytrac-solution keytrac-solution--password keytrac-solution--active">用户名密码</span>
        </div>
        <div class="try-out__solution-switch-trigger">
          <div class="switch"><input type="checkbox" name="use_password" id="keytrac-solution-checkbox"/>
            <label for="keytrac-solution-checkbox"></label></div>
        </div>
        <div class="try-out__solution-switch-content">
          <span class="keytrac-solution keytrac-solution--anytext">任意文本信息</span>
        </div>
      </div>
      <div class="try-out__solution">
        <div class="try-out__solution-content">
          <div class="try-out__solution-content-block try-out__solution-content-block--password try-out__solution-content-block--active">

            <form class="try-out__solution-content-block-form" autocomplete="off" action="/en/tryout"
                  accept-charset="UTF-8" method="post">
              <input name="utf8" type="hidden" value="&#x2713;"/>
              <input type="hidden" name="authenticity_token"
                     value="8a3/aOJ94xfO8e0fui1lBKp9GGPm+S55+XFnmjhJvRXkHA/f6hskHq5UsMjWnMXXFalvrNSnopVeFDUlqNSnwA=="/>
              <div class="try-out__solution-content-block--password-input-wrapper">
                <label for="username">用户名</label>
                <input type="text" name="username" id="username" placeholder="请输入一个超过5位的用户名(字母)"
                       autocomplete="off" onkeydown="keyAction(0)"
                       onkeyup="keyAction(1)"
                       onpaste="return false" ondragenter="return false" oncontextmenu="return false;" style="ime-mode:disabled"/>
                <div class="pwmfix">
                  <input type="text">
                </div>
              </div>
              <div class="try-out__solution-content-block--password-input-wrapper">
                <div class="pwmfix">
                  <input type="password">
                </div>
                <label for="password_1">密码</label>
                <input type="password" name="password_1" id="password_1" placeholder="请输入一个超过5位的密码(字母)"
                       onkeydown="keyAction(0)" onkeyup="keyAction(1)"
                       onpaste="return false" ondragenter="return false" oncontextmenu="return false;" style="ime-mode:disabled"/>
              </div>
              <div class="try-out__solution-content-block--password-input-wrapper">
                <div class="pwmfix"><input type="password"></div>
                <label for="password_2">确认密码</label>
                <input type="password" name="password_2" id="password_2" placeholder="再次输入上述密码"
                       onkeydown="keyAction(0)" onkeyup="keyAction(1)"
                       onpaste="return false" ondragenter="return false" oncontextmenu="return false;" style="ime-mode:disabled"/>
              </div>
              <div class="try-out__solution-content-block--password-input-wrapper">
                <input type="hidden" name="solution" value="password"/>
              </div>
            </form>
            <div class="try-out__solution-content-block-description">
              <em><h3 style="color: red">请输入一些随意编造的信息,不要使用真实数据。</h3></em>
            </div>
          </div>
          <div class="try-out__solution-content-block try-out__solution-content-block--anytext">
            <form class="try-out__solution-content-block-form" autocomplete="off" action="/en/tryout"
                  accept-charset="UTF-8" method="post">
              <input name="utf8" type="hidden" value="&#x2713;"/>
              <input type="hidden" name="authenticity_token"
                     value="l1zwy94Htq4Ksi8KRXPj51e5KLDo/5gOFCw085Yqw2qC7QB81mFxp2oXct0pwkM06G1ff9qhFOKzSWZMBrfZvw=="/>

              <div class="try-out__solution-content-block--anytext-input-wrapper">
                <p data-text-snippet="The summer evenings were long. It was not dark, yet. Presently Tom checked his whistle. A stranger was before him a shade larger than himself."
                   data-percentual-overflow="5" id="anytext_1_text_snippet">
                  <span class="typed"></span>
                  <span class="untyped">The summer evenings were long. It was not dark, yet. Presently Tom checked his whistle. A stranger was before him a shade larger than himself.
								</span>
                </p>
                <textarea name="anytext_1" id="anytext_1" maxlength="153" onkeydown="keyAction(0)"
                          onkeyup="keyAction(1)"
                          onpaste="return false" ondragenter="return false" oncontextmenu="return false;" style="ime-mode:disabled">
</textarea></div>
              <div class="try-out__solution-content-block--anytext-input-wrapper">
                <p data-text-snippet=
                           "Darcy only smiled; and the general pause which ensued made
                                    	Elizabeth tremble lest her mother should be exposing herself again."
                   data-percentual-overflow="5" id="anytext_2_text_snippet">
                  <span class="typed"></span>
                  <span class="untyped">
                                    	Darcy only smiled; and the general pause which ensued made Elizabeth tremble lest her mother should be exposing herself again.
                                    </span>
                </p>
                <textarea name="anytext_2" id="anytext_2" maxlength="136" onkeydown="keyAction(0)"
                          onkeyup="keyAction(1)"
                          onpaste="return false" ondragenter="return false" oncontextmenu="return false;" style="ime-mode:disabled"></textarea>
              </div>
              <div class="try-out__solution-content-block--anytext-input-wrapper">
                <input type="hidden" name="solution" value="anytext"/>
                <button type="button" class="btn btn-primary" id="download-btn">保存到文件</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>

<%--<div style="margin: 20px;">
  <textarea style="ime-mode:disabled" id="text-input" rows="8" cols="150" onkeydown="keyAction(0)" onkeyup="keyAction(1)"> </textarea>
  <br /><br />
  <button type="button" class="btn btn-primary" id="download-btn">保存到文件</button>
  <br />
</div>--%>
  
<div class="show-div" style="margin: 20px;">
  <span id="show-head">
    键码 毫秒 类型<br />
  </span>
</div>
<script>
  var record = "key,ms,type\n";
  var ab_pre = -1;
  var re_pre = -1;
/*
  var keypress = function () {
    var e = event || window.event || arguments.callee.caller.arguments[0];
    var d = new Date();
    alert(e.keyCode);
  }*/

  var filter = function (ms) {
    var ans = ms - ab_pre + re_pre;
    if(ms <= ab_pre) {
      ans += 60000;
    }
    if(ab_pre == -1 && re_pre == -1) {
      ans = 0;
    }
    ab_pre = ms;
    re_pre = ans;
    return ans;
  }

  var keyAction = function(a) {
    var e = event || window.event || arguments.callee.caller.arguments[0];
    var d = new Date();
    var str = e.keyCode +","+ filter(d.getSeconds()*1000 + d.getMilliseconds())+','+a+"\n";
    var newspan = $("<span></span><br />").text(str);
    $("#show-head").append(newspan);
    record += str;
  }


  var downloadFile = function (record) {
    $.post("downloadFile",
      {
        text:$("#text-input").val(),
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
