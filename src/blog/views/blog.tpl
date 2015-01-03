<!DOCTYPE html>
<!-- saved from url=(0025)/ -->
<html lang="zh-CN" class=""><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">@charset "UTF-8";[ng\:cloak],[ng-cloak],[data-ng-cloak],[x-ng-cloak],.ng-cloak,.x-ng-cloak,.ng-hide{display:none !important;}ng\:form{display:block;}.ng-animate-start{border-spacing:1px 1px;-ms-zoom:1.0001;}.ng-animate-active{border-spacing:0px 0px;-ms-zoom:1;}
</style>
    <meta charset="utf-8">
    <title>我的博客 - jaheme</title>
    <link rel="stylesheet" type="text/css" href="/static/css/base_common.css">
    <link rel="stylesheet" type="text/css" href="/static/css/base_outer.css">
    <link rel="stylesheet" type="text/css" href="/static/css/base_club.css">

    
    <meta name="author" content="yctech">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="maximum-scale=1.0,width=device-width,initial-scale=1.0">
    <meta name="keywords" content="团队协同,项目管理,任务管理,项目协作,在线办公,协作办公,SAAS,云协作,企业办公">
    <meta name="description" content="jaheme go">
    
<style type="text/css">.fancybox-margin{margin-right:0px;}</style></head>
<body class="">
<div id="wrap-all"><div id="main" class="inner">
<div class="page_navbar">
    <div class="page-navbar-warp">
        <div class="title">
            <h3 style="padding-left:30px">
                <a href="/">
                    <i class="icon-rss mr_10"></i>首页
                </a>
            </h3>
            <h3 style="padding-left:60px">
                <a href="/">
                    <i class="icon-rss mr_10"></i>原创
                </a>
            </h3>
            <h3 style="padding-left:60px">
                <a href="/">
                    <i class="icon-rss mr_10"></i>转载
                </a>
            </h3>
            <h3 style="padding-left:60px">
                <a href="/">
                    <i class="icon-rss mr_10"></i>留言
                </a>
            </h3>
            <h3 style="padding-left:60px">
                <a href="/">
                    <i class="icon-rss mr_10"></i>关于
                </a>
            </h3>
        </div>
        <div class="main">
            <div class="toolbar_panel pull-right">
                <!--a class="btn btn-link" href="/login">登 录</a>
                <a class="btn btn-link" href="/reg">注 册</a-->
            </div>
        </div>
    </div>
</div>


<div class="content-panel blog-panel">
    <div class="content-container">
        <div class="content col-xs-12 col-sm-9">
            <div class="content-wrapper">      
                    {{range $key, $a := .as}}
                    
                    <article class="article">
                        <h3 class="article-title">
                            <a href="/view/{{$a.Url}}">{{$a.Title}}</a>

                            <div class="article-comments-num">
                            <span><a href="/view/{{$a.Url}}">{{$a.Commends}}</a></span>
                            <span class="arrow"></span>
                            </div>
                        </h3>

                        <div class="article-meta">
                            <a class="avatar avatar-30" size="30" name="true" title="Terry" href="javascript:;">
                                <span class="avatar-face"><img src="/static/img/16f9b554-a883-436c-8b8c-476fe980748e.jpg" alt="Terry"></span>
                                <span class="avatar-name">Terry</span>
                            </a>
                            <span class="published">
                                {{dateformat $a.Create_time "2006-01-02 15:04"}}
                            </span> |
                            <a class="category-name" href="">
                                {{ if eq $a.Category 0}} 原创 {{else}} 转载 {{end}}
                            </a>
                        </div>
                        <div class="article-summary article-markdown">
                            {{str2html $a.Content}}
                        </div>
                        <div class="article-footer">
                            <a href="/view/{{$a.Url}}">阅读全文<i class="icon-double-angle-right"></i></a>
                        </div>
                    </article>
                    {{end}}                    

                <ul class="pagination"><li class="disabled"><a href="javascript:;" class="paginator-previous">上一页</a></li><li class="active"><a href="/?page=1">1</a></li><li class="paginator-page"><a href="/?page=2">2</a></li><li class="paginator-page"><a href="/?page=3">3</a></li><li class="paginator-page"><a href="/?page=4">4</a></li><li class="paginator-page"><a href="/?page=5">5</a></li><li class="paginator-page"><a href="/?page=6">6</a></li><li class="paginator-page"><a href="/?page=7">7</a></li><li class="paginator-page"><a href="/?page=8">8</a></li><li class=""><a href="/?page=2" class="paginator-next">下一页</a></li></ul>
            </div>
        </div>
        <div class="visible-xs">&nbsp;</div>
<div class="sidebar col-xs-12 col-sm-3">
    <div class="sidebar-inner">
        <div class="sidebar-widget">
            <h4>分类</h4>
            <ul>
                <!--
                <li>
                <a href="">
                    新闻速递
                </a>
                </li>
                
                <li class="active">
                <a href="">
                    功能日记
                </a>
                </li>
                -->
                
            </ul>
        </div>
        
        <div class="sidebar-widget">
            <h4>关注微信</h4>
            <div class="contact-code">
                <img src="/static/img/contact-code.png">
            </div>
        </div>
        
        
    </div>
</div>

    </div>
    <footer id="footer-outer" class="hidden-xs">
</footer>
</div>


</div></div>

</body></html>
