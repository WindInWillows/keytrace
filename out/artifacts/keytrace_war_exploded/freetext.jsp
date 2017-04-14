<%--
  Created by IntelliJ IDEA.
  User: zhao
  Date: 2017/4/10
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="free-text-div" style="margin: 20px; border: solid 2px #eee; width: 80%; padding: 10px;" hidden>
    <p class="random-text" ><span class="entered"></span><span class="unentered"></span></p>
    <textarea class="input-area" style="ime-mode:disabled" id="text-input0" rows="8" cols="140" onkeydown="keyAction(0,0)" onkeyup="keyAction(1,0)" onpaste="return false;" ></textarea>
    <br /><br />
    <p class="random-text" ><span class="entered"></span><span class="unentered"></span></p>
    <textarea class="input-area" style="ime-mode: disabled" id="text-input1" rows="8" cols="140" onkeydown="keyAction(0,1)" onkeyup="keyAction(1,1)" onpaste="return false;"></textarea>
    <br /><br />
    <p class="random-text" ><span class="entered"></span><span class="unentered"></span></p>
    <textarea class="input-area" style="ime-mode: disabled" id="text-input2" rows="8" cols="140"  onkeydown="keyAction(0,2)" onkeyup="keyAction(1,2)" onpaste="return false;"></textarea>
    <br /><br />
    <button type="button" class="btn btn-primary" id="download-btn">提交</button>
    <br />
    <input type="hidden" id="random-key" value=""/>
</div>
