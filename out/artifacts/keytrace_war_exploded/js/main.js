/**
 * Created by zhao on 2017/4/17.
 */
var record = ["key,ms,type\n","key,ms,type\n"];
var ab_pre = [-1,-1];
var re_pre = [-1,-1];

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
    if(e.keyCode==9) return;
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

/*    var downloadFile = function (record) {
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
 }*/

var load_random_text = function (num) {
    var res = null;
    $.ajax({
        url:"loadRandomText",
        async:false,
        success:function (data) {
            var ps = $(".random-text");
            for (var i = 0; i < ps.length && i<num; i++) {
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

