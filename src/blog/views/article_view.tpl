<!DOCTYPE html>
<html lang="zh-CN" class=""><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">@charset "UTF-8";[ng\:cloak],[ng-cloak],[data-ng-cloak],[x-ng-cloak],.ng-cloak,.x-ng-cloak,.ng-hide{display:none !important;}ng\:form{display:block;}.ng-animate-start{border-spacing:1px 1px;-ms-zoom:1.0001;}.ng-animate-active{border-spacing:0px 0px;-ms-zoom:1;}</style>
    <meta charset="utf-8">
    <title>jaheme > {{.a.Title}}</title>
    <link rel="stylesheet" type="text/css" href="/static/css/base_common.css">
    <link rel="stylesheet" type="text/css" href="/static/css/base_outer.css">
    <link rel="stylesheet" type="text/css" href="/static/css/base_club.css">

    
    <meta name="author" content="yctech">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="maximum-scale=1.0,width=device-width,initial-scale=1.0">
    <meta name="keywords" content="blog">
    <meta name="description" content="Jahe GO">
    
<style type="text/css">.fancybox-margin{margin-right:0px;}</style></head>
<body class="">
<div id="wrap-all"><div id="main" class="inner">
<div class="page_navbar">
    <div class="page-navbar-warp">
        <div class="title">
            <h3>
                <a href="/">
                    <i class="icon-rss mr_10"></i>博客  >  {{.a.Title}}
                </a>                
            </h3>
        </div>
        <div class="main">
            <div class="toolbar_panel pull-right">
                
            </div>
        </div>
    </div>
</div>


<div class="content-panel blog-panel ng-scope" ng-controller="blog_civilian_ctrl">
    <div class="content-container" ng-init="">
        <div class="content col-xs-12 col-sm-9">
            <div class="content-wrapper">
                <article class="article">
                    <h3 class="article-title">
                        {{.a.Title}}
                    </h3>

                    <div class="article-meta">
                        <a class="avatar avatar-30" size="30" name="true" title="Terry" href="javascript:;">
                                <span class="avatar-face"><img src="/static/img/16f9b554-a883-436c-8b8c-476fe980748e.jpg" alt="Terry"></span>
                            <span class="avatar-name">Terry</span>
                        </a>
                        <span class="published">{{dateformat .a.Create_time "2006-01-02 15:04"}}</span>
                        |
                        <a class="category-name" href="">
                            {{ if eq .a.Category 0}} 原创 {{else}} 转载 {{end}}
                        </a>
                    </div>

                    <div class="article-summary article-markdown">
                    {{str2html .a.Content}}
                    </div>
                </article>
            </div>
            <div class="content-wrapper">
                <div class="article-comments-wrapper">
                    <div class="article-comments-heading">
                        <h3>
                            评论
                        </h3>
                    </div>
                    <div class="article-comments">                   
                        
                        <div class="wt-row comment-item">
                            <div class="comment-meta">
                                <a class="comment-author avatar avatar-30">
                                    <span class="avatar-face"><img ng-src="https://wt-avatars.oss.aliyuncs.com/40/5a69f6124d484f589996b1956126cf52.jpg" alt="徐海峰" src="/static/img/5a69f6124d484f589996b1956126cf52.jpg"></span>
                                    <span class="avatar-name ng-binding" ng-bind="clubUsers[&#39;13885434e31bcb&#39;].display_name || &#39;UnmetUser&#39;">徐海峰</span>
                                </a>
                                <span class="top-right-corner">
                                    <span class="">
                                        <span ng-bind="1407513097388|fromNow" class="comment-time ng-binding">08-08 23:51</span>
                                    </span>
                                    
                                    <span class="forum-badge floor-label">#1</span>
                                </span>
                            </div>
                            <div class="comment-content article-markdown">
                                <span>
                                    <p>千呼万唤始出来，哈哈哈</p>

                                </span>
                            </div>

                        </div>
                        
                        
                    </div>
                    <div class="comment-pager">
                        <ul class="pagination"></ul>
                    </div>
                </div>
            </div>
            <div class="content-wrapper">
                <div class="article-newcomment-wrapper">
                    <div class="article-newcomment-heading">
                        <h3>
                            回复
                        </h3>
                    </div>
                    <div class="comment-editor">
                        
                        <div class="comment-plz-signin text-center">
                            <p>
                            </p><h4>您还没有登录，请您登录后参与讨论：</h4><br>
                            <a class="btn btn-danger" href="/login">登录</a>
                            &nbsp;或&nbsp;
                            <a class="btn btn-success" href="/reg">立即注册</a>
                            <p></p>

                        </div>

                        
                    </div>
                </div>
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
        
        <div class="sidebar-widget ng-scope" ng-controller="blog_qr_ctrl">
            <h4>扫二维码分享本文</h4>
            <div class="contact-code" id="the-qr-code">
                <qrcode data="" version="7" size="148"><canvas height="148" width="148"></canvas></qrcode>
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
