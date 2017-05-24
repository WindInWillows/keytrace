<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8">
    <title>主页</title>
    <meta name="description" content="iDea a Bootstrap-based, Responsive HTML5 Template">
    <meta name="author" content="htmlcoder.me">

    <jsp:include page="head_inc.jsp" />
</head>

<body>

<div class="page-wrapper">
    <jsp:include page="header.jsp"/>

    <div class="page-intro">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <ol class="breadcrumb">
                        <li><i class="fa fa-home pr-10"></i><a href="index.jsp">主页</a></li>
                        <!--<li class="active">技术</li>-->
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <div class="banner">
        <div class="fixed-image section light-translucent-bg"
             style="background-image:url('images/page-services-banner.jpg');">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="space-top"></div>
                        <h2>基于用户击键特征的身份鉴别系统</h2>
                        <div class="separator-2"></div>
                        <p class="lead">
                        <ul>
                            <li>密码验证，总要小心躲避旁人的窥视</li>
                            <br class="hidden-xs hidden-sm">
                            <li>指纹验证，总要谨慎擦拭触碰的物品</li>
                            <br class="hidden-xs hidden-sm">
                        </ul>
                        <h2><em>基于键盘输入习惯的身份验证，</em></h2>
                        <h2><em>在无声中验别使用者身份</em></h2>
                        </p>
                    </div>
                    <div class="col-md-6">
                        <ul class="nav nav-pills white space-top" role="tablist">
                            <li><a href="#portfolio-video" role="tab" data-toggle="tab" title="video"><i
                                    class="fa fa-video-camera pr-5"></i> Video</a></li>
                        </ul>
                        <div class="tab-pane" id="portfolio-video">
                            <div class="embed-responsive embed-responsive-16by9">
                                <video controls="controls" width="500" height="234">
                                    <source src="all.mp4" type="video/mp4"></source>
                                </video>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <section class="main-container">
        <div class="container">
            <div class="row">
                <div class="main col-md-12">
                    <div class="row">
                        <div class="col-md-6">
                            <h1>行为习惯与身份鉴别</h1>
                            <div class="separator-2"></div>
                            <br>
                            <h3>
                                <ul>人群里，我们会轻松认出他熟悉的背影</ul>
                                <br class="hidden-xs hidden-sm"><br>
                                <ul>混杂的声音中，我们能轻易分辨出他爽朗的笑声</ul>
                                <br class="hidden-xs hidden-sm"><br>
                                <ul>文字聊天时，我们不自觉的形成了特有的语言风格</ul>
                            </h3>
                        </div>
                        <div class="col-md-6">
                            <div class="tab-content clear-style">
                                <div class="tab-pane active" id="portfolio-images1">
                                    <div class="overlay-container">
                                        <img src="images/people.png" alt="未加载的图片">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <h1 class="page-title margin-top-clear">键盘输入认证</h1>
                    <div class="row">
                        <h3>工作原理</h3>
                        <div class="separator-2"></div>
                        <p>如同说话方式、动作行为和性格特点，每个人的键盘输入特点也有很高的辨识度</p>
                        <p>即使输入相同一段文字，不同的人在按键盘时，每个按键的持续时间和相邻按键的间隔时间特征也大不相同</p>

                    </div>
                    <hr>
                    <p style="text-align: center">
                        <a href="toFreetext.action" class="btn btn-white margin-top-clear">开始体验键盘识别</a>
                    </p>
                    <hr>
                </div>
            </div>
        </div>
    </section>


    <jsp:include page="footer.jsp"/>

</div>

</body>

</html>
