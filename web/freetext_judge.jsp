<%--
  Created by IntelliJ IDEA.
  User: zhao
  Date: 2017/4/15
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <script src="js/jquery.min.js"></script>
</head>

<div id="freetext-judge-div" style="margin: 20px; border: solid 2px #eee; width: 80%; padding: 10px;" hidden>
    <p class="random-text" ><span class="entered"></span><span class="unentered"></span></p>
    <textarea class="input-area" style="ime-mode: disabled" id="text-input-judge" rows="8" cols="140"  onkeydown="keyAction(0,2)" onkeyup="keyAction(1,2)" onpaste="return false;"></textarea>
    <br /><br />
    <button type="button" class="btn btn-primary" id="judge-btn">提交</button>
    <br />
</div>
