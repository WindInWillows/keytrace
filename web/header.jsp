<%--
  Created by IntelliJ IDEA.
  User: zhao
  Date: 2017/5/18
  Time: 18:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="header fixed clearfix">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="header-left clearfix">
                    <div class="logo">
                        <a href="index.jsp"><img id="logo" src="images/logo.png" alt="iDea"></a>
                    </div>
                    <div class="site-slogan">
                        Keyboardification
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <div class="header-right clearfix">
                    <div class="main-navigation animated">
                        <nav class="navbar navbar-default" role="navigation">
                            <div class="container-fluid">
                                <!-- Toggle get grouped for better mobile display -->
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                                </div>
                                <div class="collapse navbar-collapse" id="navbar-collapse-1">
                                    <ul class="nav navbar-nav navbar-right">
                                        <li>
                                            <a href="index.jsp">主页</a>
                                        </li>

                                        <li class="dropdown">

                                            <a class="dropdown-toggle" >体验一下</a>
                                            <ul class="dropdown-menu">
                                                <li><a href="toSignup.action">密码型键盘识别</a></li>
                                                <li><a href="toFreetext.action">文本型键盘识别</a></li>
                                            </ul>
                                        </li>

                                        <li>
                                            <a href="#">技术</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

