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
                        <li><i class="fa fa-home pr-10"></i><a href="/index.jsp">主页</a></li>
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
                        <!--
                        <div class="col-md-6">
                            <ul class="nav nav-pills white space-top" role="tablist">
                                <li><a href="#portfolio-video" role="tab" data-toggle="tab" title="video"><i
                                        class="fa fa-video-camera pr-5"></i> Video</a></li>
                            </ul>
                            <div class="tab-pane" id="portfolio-video1">
                                <div class="embed-responsive embed-responsive-16by9">
                                    <video controls="controls" width="500" height="234">
                                        <source src="all.mp4" type="video/mp4"></source>
                                    </video>
                                </div>
                            </div>
                        </div>
                        -->
                    </div>
                    <hr>
                    <p style="text-align: center">
                        <a href="toFreetext.action" class="btn btn-white margin-top-clear">开始体验键盘识别</a>
                    </p>
                    <hr>
                    <!--
                    <div class="row">
                        <div class="col-md-3 col-xs-6">
                            <h3>Project Info</h3>
                            <ul class="list">
                                <li><strong class="vertical-divider">Client </strong> John Doe</li>
                                <li><strong class="vertical-divider">Date </strong> OCT 2014</li>
                                <li><strong class="vertical-divider">In </strong> Web Design</li>
                                <li><strong class="vertical-divider">Place </strong> Europe</li>
                                <li><strong class="vertical-divider">URL </strong> <a href="http://www.htmlcoder.me/preview/idea/v.1.0/">www.idea.com</a></li>
                            </ul>
                        </div>
                        <div class="col-md-3 col-xs-6">
                            <h3>Share This</h3>
                            <div id="share"></div>
                        </div>
                        <div class="col-md-6 col-xs-12">
                            <h3>More info</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.</p>
                            <form role="form">
                                <div class="form-group has-feedback">
                                    <input type="email" class="form-control" id="exampleInputEmail3" placeholder="Email">
                                    <i class="fa fa-envelope-o form-control-feedback"></i>
                                </div>
                                <a href="#" class="btn btn-white margin-top-clear">Subscribe</a>
                            </form>
                        </div>
                    </div>
                    -->
                </div>
            </div>
        </div>
    </section>


    <!-- page-intro end -->

    <!--
    <section class="main-container">

        <div class="container">
            <div class="row">
                <div class="main col-md-12">
                    <h1 class="page-title text-center">Core Features</h1>
                    <div class="separator"></div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="box-style-3 right animated fadeInUpSmall">
                                <div class="icon-container default-bg">
                                    <i class="fa fa-bold"></i>
                                </div>
                                <div class="body">
                                    <h2>Bootstrap Based</h2>
                                    <p>Voluptatem ad provident non veritatis beatae cupiditate amet reiciendis.</p>
                                    <a href="page-services.html" class="link"><span>Read More</span></a>
                                </div>
                            </div>
                            <div class="box-style-3 right animated fadeInUpSmall">
                                <div class="icon-container default-bg">
                                    <i class="fa fa-check"></i>
                                </div>
                                <div class="body">
                                    <h2>Unlimited Options</h2>
                                    <p>Iure sequi unde hic. Sapiente quaerat labore inventore veritatis cumque.</p>
                                    <a href="page-services.html" class="link"><span>Read More</span></a>
                                </div>
                            </div>
                            <div class="box-style-3 right animated fadeInUpSmall">
                                <div class="icon-container default-bg">
                                    <i class="fa fa-bicycle"></i>
                                </div>
                                <div class="body">
                                    <h2>Easy to Use</h2>
                                    <p>Inventore dolores aut laboriosam cum consequuntur delectus sequi! Eum est.</p>
                                    <a href="page-services.html" class="link"><span>Read More</span></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="space hidden-lg hidden-md"></div>
                            <img class="animated fadeInUpSmall" src="images/services-1.png" alt="iDea">
                        </div>
                    </div>
                    <div class="space"></div>

                </div>
            </div>
        </div>
    </section>
    -->

    <!--
    <div class="section gray-bg clearfix">
        <div class="container">
            <h1 class="text-center title">More Features</h1>
            <div class="row grid-space-10">
                <div class="col-sm-4">
                    <div class="box-style-2 object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="0">
                        <div class="icon-container default-bg">
                            <i class="fa fa-leaf"></i>
                        </div>
                        <div class="body">
                            <h2>Clean Design and Code</h2>
                            <p>Voluptatem ad provident non veritatis beatae cupiditate amet reiciendis.</p>
                            <a href="page-services.html" class="link"><span>Read More</span></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="box-style-2 object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="200">
                        <div class="icon-container default-bg">
                            <i class="fa fa-laptop"></i>
                        </div>
                        <div class="body">
                            <h2>Very Flexible</h2>
                            <p>Iure sequi unde hic. Sapiente quaerat labore inventore veritatis cumque.</p>
                            <a href="page-services.html" class="link"><span>Read More</span></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="box-style-2 object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="400">
                        <div class="icon-container default-bg">
                            <i class="fa fa-sitemap"></i>
                        </div>
                        <div class="body">
                            <h2>Latest Technologies</h2>
                            <p>Inventore dolores aut laboriosam cum consequuntur delectus sequi! Eum est.</p>
                            <a href="page-services.html" class="link"><span>Read More</span></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row grid-space-10">
                <div class="col-sm-4">
                    <div class="box-style-2 object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="600">
                        <div class="icon-container default-bg">
                            <i class="fa fa-bold"></i>
                        </div>
                        <div class="body">
                            <h2>Packed Full of Features</h2>
                            <p>Voluptatem ad provident non veritatis beatae cupiditate amet reiciendis.</p>
                            <a href="page-services.html" class="link"><span>Read More</span></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="box-style-2 object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="800">
                        <div class="icon-container default-bg">
                            <i class="fa fa-check"></i>
                        </div>
                        <div class="body">
                            <h2>100% Responsive</h2>
                            <p>Iure sequi unde hic. Sapiente quaerat labore inventore veritatis cumque.</p>
                            <a href="page-services.html" class="link"><span>Read More</span></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="box-style-2 object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="1000">
                        <div class="icon-container default-bg">
                            <i class="fa fa-bicycle"></i>
                        </div>
                        <div class="body">
                            <h2>After Sale Support</h2>
                            <p>Inventore dolores aut laboriosam cum consequuntur delectus sequi! Eum est.</p>
                            <a href="page-services.html" class="link"><span>Read More</span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    -->
    <!-- section end -->

    <!-- section start -->
    <!-- ================ -->
    <!--
    <div class="section clearfix">
        <div class="container">
            <h1>The Process We Follow</h1>
            <div class="process">
                <ul class="nav nav-pills white space-top" role="tablist">
                    <li class="active"><a href="#pill-1" role="tab" data-toggle="tab" title="Step 1"><i class="fa fa-dot-circle-o pr-5"></i> Step 1</a></li>
                    <li><a href="#pill-2" role="tab" data-toggle="tab" title="Step 2"><i class="fa fa-dot-circle-o pr-5"></i> Step 2</a></li>
                    <li><a href="#pill-3" role="tab" data-toggle="tab" title="Step 3"><i class="fa fa-dot-circle-o pr-5"></i> Step 3</a></li>
                </ul>
                <div class="tab-content clear-style">
                    <div class="tab-pane active" id="pill-1">
                        <h3>Consectetur adipisicing elit</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <p>Ipsum dolor sit amet, consectetur adipisicing elit. Sit, labore iste! Pariatur tempore, dicta voluptatibus quis blanditiis voluptates in. Molestiae asperiores sed, pariatur nesciunt saepe. Culpa ipsam ut enim reiciendis!</p>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ea sit enim sint deleniti saepe esse nisi nesciunt fuga eaque dicta tenetur, cupiditate illo, consequuntur unde dolores quis dolore rem ex asperiores error. Labore saepe beatae harum quod fuga ipsam! Iusto earum iste similique, quam esse rerum, quae atque inventore consequuntur voluptatum amet deserunt mollitia? Tempore fugit, cumque dolor eaque doloremque iusto nostrum excepturi unde! Similique ipsum fugit eius laboriosam nihil quos, quia et! Earum iure, sapiente. Molestiae unde earum fugiat voluptate incidunt.</p>
                            </div>
                            <div class="col-md-6">
                                <div class="embed-responsive embed-responsive-16by9">
                                    <iframe class="embed-responsive-item" src="//player.vimeo.com/video/29198414?byline=0&amp;portrait=0"></iframe>
                                    <p><a href="http://vimeo.com/29198414">Introducing Vimeo Music Store</a> from <a href="http://vimeo.com/staff">Vimeo Staff</a> on <a href="https://vimeo.com">Vimeo</a>.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="pill-2">
                        <h3>Lorem ipsum dolor sit amet</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <img src="images/section-image-1.png" alt="">
                            </div>
                            <div class="col-md-6">
                                <p>Ipsum dolor sit amet, consectetur adipisicing elit. Sit, labore iste! Pariatur tempore, dicta voluptatibus quis blanditiis voluptates in. Molestiae asperiores sed, pariatur nesciunt saepe. Culpa ipsam ut enim reiciendis!</p>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ea sit enim sint deleniti saepe esse nisi nesciunt fuga eaque dicta tenetur, cupiditate illo, consequuntur unde dolores quis dolore rem ex asperiores error. Labore saepe beatae harum quod fuga ipsam! Iusto earum iste similique, quam esse rerum, quae atque inventore consequuntur voluptatum amet deserunt mollitia? Tempore fugit, cumque dolor eaque doloremque iusto nostrum excepturi unde! Similique ipsum fugit eius laboriosam nihil quos, quia et! Earum iure, sapiente. Molestiae unde earum fugiat voluptate incidunt.</p>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="pill-3">
                        <h3>Dolor lorem ipsum sit amet</h3>
                        <p>Consectetur adipisicing elit. Sit, labore iste! Pariatur tempore, dicta voluptatibus quis blanditiis voluptates in. Molestiae asperiores sed, pariatur nesciunt saepe. Culpa ipsam ut enim reiciendis!</p>
                        <p>Ipsum dolor sit amet, consectetur adipisicing elit. Debitis eaque nihil obcaecati minus perferendis officiis cumque nesciunt quae dolorem ad tenetur voluptate blanditiis labore libero id veritatis similique facere, fugiat soluta omnis minima? Iusto optio hic a reiciendis, inventore numquam impedit quaerat deserunt, voluptatum illum in magni, aspernatur corporis mollitia nam? Ipsum, cumque facilis recusandae commodi dolorum sequi quis possimus, aut, ab incidunt dolorem perferendis rerum tenetur. Labore exercitationem magni perspiciatis laborum, aliquam officia molestias obcaecati, voluptatum quidem eum iure aut, officiis dicta cupiditate ab, sit aliquid. Corporis ducimus ab commodi officia? Inventore suscipit saepe dolorem vitae aperiam autem, iusto id, enim assumenda modi a voluptate aliquam molestiae quidem sapiente, obcaecati recusandae. Magni repellat dignissimos sint iste dolorem maxime accusantium quas repellendus quam ipsa, sapiente, beatae enim ab ex. Optio eveniet necessitatibus, tempora dolor eaque saepe, ipsam vero at officiis cumque, maxime consequuntur in ea, voluptate quae nesciunt hic delectus.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    -->
    <!-- section end -->

    <!-- section start -->
    <!-- ================ -->
    <!--
    <div class="section clearfix">
        <div class="container">
            <div class="pricing-tables gray object-non-visible" data-animation-effect="fadeInUpSmall">
                <div class="row grid-space-0">
                    <div class="col-sm-4 plan">
                        <div class="header">
                            <h3>Basic</h3>
                            <div class="price"><span>Free</span></div>
                        </div>
                        <ul>
                            <li>1 User</li>
                            <li>
                                <a href="#" class="pt-popover" data-toggle="popover" data-placement="right" data-content="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." title="" data-original-title="15GB Storage" data-trigger="hover">1GB Storage</a>
                            </li>
                            <li>
                                <a href="#" class="pt-popover" data-toggle="popover" data-placement="right" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." title="" data-original-title="15 Email Acounts">1 Email Acounts</a>
                            </li>
                            <li>Subdomains</li>
                            <li>Security</li>
                            <li>Bandwidth</li>
                            <li>Databases</li>
                            <li><a class="btn btn-gray">Subscribe</a></li>
                        </ul>
                    </div>

                    <div class="col-sm-4 plan best-value">
                        <div class="header">
                            <h3>Premium</h3>
                            <div class="price"><span>$19.99</span>/m.</div>
                        </div>
                        <ul>
                            <li>80 Users</li>
                            <li>Unlimited Disk Space</li>
                            <li>
                                <a href="#" class="pt-popover" data-toggle="popover" data-placement="right" data-content="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." title="" data-original-title="Unlimited Subdomains">Unlimited Email Acounts</a>
                            </li>
                            <li>Subdomains</li>
                            <li>Security</li>
                            <li>500 Visitors per month</li>
                            <li>1 Database</li>
                            <li><a class="btn btn-gray"><i class="fa fa-shopping-cart pr-10"></i>Order Now</a></li>
                        </ul>
                    </div>

                    <div class="col-sm-4 plan">
                        <div class="header">
                            <h3>Pro</h3>
                            <div class="price"><span>$24.99</span>/m.</div>
                        </div>
                        <ul>
                            <li>Unlimited Users</li>
                            <li>Unlimited Disk Space</li>
                            <li>Unlimited Email Acounts</li>
                            <li>Unlimited Subdomains</li>
                            <li>
                                <a href="#" class="pt-popover" data-toggle="popover" data-placement="right" data-content="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." title="" data-original-title="Enchaned Security">Enchaned Security</a>
                            </li>
                            <li>Unlimited Bandwidth</li>
                            <li>Unlimited Databases</li>
                            <li><a class="btn btn-gray"><i class="fa fa-shopping-cart pr-10"></i>Order Now</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    -->
    <!-- section end -->

    <!-- section start -->
    <!-- ================ -->
    <!--
    <div class="section gray-bg text-muted footer-top clearfix">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="owl-carousel clients">
                        <div class="client">
                            <a href="#"><img src="images/client-1.png" alt=""></a>
                        </div>
                        <div class="client">
                            <a href="#"><img src="images/client-2.png" alt=""></a>
                        </div>
                        <div class="client">
                            <a href="#"><img src="images/client-3.png" alt=""></a>
                        </div>
                        <div class="client">
                            <a href="#"><img src="images/client-4.png" alt=""></a>
                        </div>
                        <div class="client">
                            <a href="#"><img src="images/client-5.png" alt=""></a>
                        </div>
                        <div class="client">
                            <a href="#"><img src="images/client-6.png" alt=""></a>
                        </div>
                        <div class="client">
                            <a href="#"><img src="images/client-7.png" alt=""></a>
                        </div>
                        <div class="client">
                            <a href="#"><img src="images/client-8.png" alt=""></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <blockquote class="inline">
                        <p class="margin-clear">Design is not just what it looks like and feels like. Design is how it works.</p>
                        <footer><cite title="Source Title">Steve Jobs </cite></footer>
                    </blockquote>
                </div>
            </div>
        </div>
    </div>
    -->
    <!-- section end -->

    <jsp:include page="footer.jsp"/>

</div>

</body>

</html>
