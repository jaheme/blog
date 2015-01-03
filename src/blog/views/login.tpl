<!DOCTYPE html>
<html lang="zh-CN" class=""><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><style type="text/css">@charset "UTF-8";[ng\:cloak],[ng-cloak],[data-ng-cloak],[x-ng-cloak],.ng-cloak,.x-ng-cloak,.ng-hide{display:none !important;}ng\:form{display:block;}.ng-animate-block-transitions{transition:0s all!important;-webkit-transition:0s all!important;}.ng-hide-add-active,.ng-hide-remove{display:block!important;}</style>
    <meta charset="utf-8">
    <title>登录 - Jahe</title>
    <link rel="stylesheet" type="text/css" href="/static/css/base_common.css">
    <link rel="stylesheet" type="text/css" href="/static/css/base_outer.css">

    
    <meta name="author" content="YCTech">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="maximum-scale=1.0,width=device-width,initial-scale=1.0">
    <meta name="keywords" content="go jahe">
    <meta name="description" content="Jahe GO">
    
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
                <!--a class="btn btn-link" href="/reg">注 册</a-->
            </div>
        </div>
    </div>
</div>
<div class="other-warp login-wrap ng-scope" data-ng-controller="user_login_ctrl">

    <div data-minheight="58" class="single-panel clearfix" style="min-height: 562px;">
        <!-- ngIf: status.code == 0 --><div class="single-panel-inner login-mini ng-scope" ng-if="status.code == 0">
            <div class="single-panel-header">
                <h3>登录</h3>
            </div>
            <div class="single-panel-body">
                <div class="single-panel-section">
                    <form wt-form-validate="{blurTrig:false,showMsg:false}" name="login_form" class="form-horizontal wt-form ng-pristine ng-invalid ng-invalid-required" novalidate="">
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="icon icon-user"></i></span>
                                <input class="form-control ng-pristine ng-invalid ng-invalid-required valid" type="text" placeholder="输入用户名" name="login_name" ng-model="signin_user.name" required="" wt-autofocus="">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon fs_17"><i class="icon icon-lock"></i></span>
                                <input class="form-control ng-pristine ng-invalid ng-invalid-required valid" type="password" placeholder="输入密码" name="login_password" ng-model="signin_user.password" required="">
                            </div>
                        </div>

                        <!-- ngIf: login_form.$errors.length > 0 -->
                        <div class="form-group">
                            <button wt-form-submit="signin(login_form)" class="btn btn-success btn-lg btn-block" type="button" data-loading-text="登录中..." loading-status="signin_user.is_login_ing"> 登 录
                            </button>
                        </div>
                    </form>
                </div>

            </div>
            <div class="single-panel-footer">
                <div class="pull-right">
                    <a href="/forgot">忘记密码？</a></div>
            </div>
        </div><!-- end ngIf: status.code == 0 -->


    </div>
</div>

</div></div>
</body></html>
