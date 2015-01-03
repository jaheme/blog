<!DOCTYPE html>
<html lang="zh-CN" class="">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
    @charset "UTF-8";[ng\:cloak],[ng-cloak],[data-ng-cloak],[x-ng-cloak],.ng-cloak,.x-ng-cloak,.ng-hide{
        display:none !important;}ng\:form{display:block;}.ng-animate-block-transitions{transition:0s all!important;-webkit-transition:0s all!important;}.ng-hide-add-active,.ng-hide-remove{display:block!important;}</style>
    <meta charset="utf-8">
    <title>注册 - Jahe</title>
    <link rel="stylesheet" type="text/css" href="/static/css/base_common.css">
    <link rel="stylesheet" type="text/css" href="/static/css/base_outer.css">

    
    <meta name="author" content="YCTech">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="maximum-scale=1.0,width=device-width,initial-scale=1.0">
    <meta name="keywords" content="团队协同,项目管理,任务管理,项目协作,在线办公,协作办公,SAAS,云协作,企业办公">
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
                <!--a class="btn btn-link" href="/login">登 录</a-->
            </div>
        </div>
    </div>
</div>
<div class="other-warp ng-scope" data-ng-controller="user_signup_ctrl">
    <div data-minheight="58" class="single-panel clearfix" style="min-height: 562px;">
        <div class="single-panel-inner middle">
            <div class="single-panel-header">
                <h3>注册新用户</h3>
            </div>
            <div class="single-panel-body">
                <!-- ngIf: show_signup --><div class="single-panel-section ng-scope" ng-if="show_signup">
                    <form wt-form-validate="{blurTrig:false,showMsg:false}" name="register_form" novalidate="" class="form-horizontal wt-form ng-pristine ng-invalid ng-invalid-required">
                        <div class="form-group">
                            <label class="col-xs-2 control-label">邮箱：</label>

                            <div class="col-xs-10">
                                <input class="form-control ng-pristine ng-valid-email ng-invalid ng-invalid-required valid" type="email" placeholder="你的常用邮箱地址" id="uemail" name="signup_email" ng-model="user.email" required="" wt-remote-unique-check="{url:&#39;/api/user/email/check?email=&#39;}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-2 control-label">用户名：</label>

                            <div class="col-xs-10">
                                <input class="form-control ng-pristine ng-invalid ng-invalid-required valid ng-valid-romoteuniquecheck" autofocus="" type="text" placeholder="由字母、数字、下划线组成，以字母开头" id="uname" name="signup_name" ng-model="user.name" wt-remote-unique-check="{url:&#39;/api/user/name/check?name=&#39;}" wt-regex="^[A-Za-z]{1}[0-9A-Za-z_]{2,29}$" required="">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-2 control-label">真实姓名：</label>

                            <div class="col-xs-10">
                                <input class="form-control ng-pristine ng-valid-maxlength ng-invalid ng-invalid-required valid" type="text" placeholder="输入真实姓名，方便团队成员认识你" name="signup_display_name" ng-model="user.display_name" required="" ng-maxlength="200" id="real_name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-2 control-label">密码：</label>

                            <div class="col-xs-10">
                                <input class="form-control ng-pristine ng-valid-minlength ng-invalid ng-invalid-required valid" type="password" placeholder="最小长度6位" name="signup_password" ng-model="user.password" ng-minlength="6" required="" id="passw">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-2 control-label">确认密码：</label>

                            <div class="col-xs-10">
                                <input class="form-control ng-pristine ng-valid valid" type="password" placeholder="再输入一次密码" name="repeated_password" wt-repeat-password="signup_password" ng-model="user.repeated_password"  id="passw2">
                            </div>
                        </div>
                        <!-- ngIf: register_form.$errors.length > 0 -->
                        <div class="form-group">
                            <div class="col-xs-2"></div>
                            <div class="col-xs-10">
                                <button  onclick="handle_reg('register_form')" type="button" class="btn btn-success" data-loading-text="注册中..." loading-status="is_registering">注册新用户
                                </button>
                            </div>
                        </div>
                    </form>
                </div><!-- end ngIf: show_signup -->

                <!-- ngIf: signup_success -->
            </div>

            <div class="single-panel-footer ng-scope" ng-if="!signup_success">
                <div class="pull-right">点击注册，表明你同意我们的<a href="https://worktile.com/terms">服务条款</a></div></div><!-- end ngIf: !signup_success -->
        </div>
    </div>
</div>
</div></div>
<script src="/static/js/jquery-2.1.1.min.js"></script>
<script src="/static/js/user.js"></script>
</body></html>
