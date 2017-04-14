<%--
  Created by IntelliJ IDEA.
  User: zhao
  Date: 2017/4/10
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                   onkeydown="passKeyAction(0,0)" onkeyup="passKeyAction(1,0)"
                   type="password" class="form-control" id="input-pass1" placeholder="密码">
        </div>

        <div class="form-group">
            <label for="input-pass2">确认密码</label>
            <input
                    onkeydown="passKeyAction(0,1)" onkeyup="passKeyAction(1,1)"
                    type="password" class="form-control" id="input-pass2" placeholder="确认密码">
        </div>

        <input type="button" id="btn-signup" class="btn btn-primary" value="注册并学习" />
        <a onclick="toggle(1)">已注册？</a>
    </form>
</div>

<script>
var pass_record = ["key,ms,type\n","key,ms,type\n"];
var pass_ab_pre = [-1,-1];
var pass_re_pre = [-1,-1];

var pass_filter = function (ms,t) {
    var ans = ms - pass_ab_pre[t] + pass_re_pre[t];
    if(ms <= pass_ab_pre[t]) {
        ans += 60000;
    }
    if(pass_ab_pre[t] == -1 && pass_re_pre[t] == -1) {
        ans = 0;
    }
    pass_ab_pre[t] = ms;
    pass_re_pre[t] = ans;
    return ans;
}

var passKeyAction = function(a,t) {
    var e = event || window.event || arguments.callee.caller.arguments[0];
    var d = new Date();
    var str = e.keyCode +","+ pass_filter(d.getSeconds()*1000 + d.getMilliseconds(),t)+','+a+"\n";
    pass_record[t] += str;
}

$(document).ready(function () {

    $("#btn-signup").click(function () {
        var pass1 = $("#input-pass1").val();
        var pass2 = $("#input-pass2").val();
        if(pass1==pass2) {
            var res = "";
            pass_record.forEach(function (v) {res+=v;})
            $.post("signup",
                {
                    user_name:$("#input-name").val(),
                    user_pass:pass1,
                    pass_record:res,
                },
                function (data) {
                    if(data.length>0) {
                        $("#alert-suc").show();
                        setTimeout(function () {
                            $("#alert-suc").hide();
                            toggle(1);
                        },2000);
                    }
                    else {
                        $("#alert-has").show();
                        setTimeout(function () {
                            $("#alert-has").hide();
                        },2000)
                    }
                }
            );
        }
    })
})

</script>