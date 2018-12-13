<%@ Page Language="C#" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="BBS.contact" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>校园学习网上论坛</title>
        <meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="public/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="public/css/main.css" />
</head>
<body class="bodypg">
		<div class="top-intr">
			<div class="container">
				<p class="pull-left">
					校园学习网上论坛
				</p>
				<p class="pull-right">
					<a><i class="glyphicon glyphicon-earphone"></i>联系电话：0531-55555555 </a>
				</p>
			</div>
		</div>
		<nav class="navbar-default">
			<div class="container">
				<div class="navbar-header">
					<!--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>-->
					<a href="index.aspx">
						<h1>网上论坛</h1>
						<p>  ONLIINE BBS </p>
					</a>
				</div>
				<div class="pull-left search">
					<input type="text" placeholder="输入搜索的内容"/>
						<a><i class="glyphicon glyphicon-search"></i>搜索</a>
					</div>
				<div class="nav-list"><!--class="collapse navbar-collapse" id="bs-example-navbar-collapse"-->
					<ul class="nav navbar-nav">
						<li class="active hidden-xs">
							<a href="index.aspx">网站首页</a>
						</li>
						<li>
							<a href="fabutiezi.aspx">发布帖子</a>
						</li>
						<li>
							<a href="PersonModify.aspx">信息修改</a>
						</li>
						<li>
							<a href="video.aspx">学习视频</a>
						</li>
						<li>
							<a href="contact.aspx">联系我们</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="fl hidden-lg hidden-md hidden-sm">
			<ul>
				<li>
					<a href="index.aspx">
						<p><i class="glyphicon glyphicon-home"></i>
						网站首页</p>
					</a>
				</li>
				<li>
					<a href="tel:17865313528" >
						<p><i class="glyphicon glyphicon-earphone"></i>
						拨号联系</p>
					</a>
				</li>
				<li>
					<a href="contact.aspx#message">
						<p><i class="glyphicon glyphicon-comment"></i>
						在线留言</p>
					</a>
				</li>
			</ul>
		</div>
		<!--banner-->
		<div id="carousel-example-generic" class="carousel slide " data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="public/images/banner/banner2.jpg">
				</div>
				<div class="item">
					<img src="public/images/banner/banner3.jpg">
				</div>
				<div class="item">
					<img src="public/images/banner/banner1.jpg">
				</div>
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!--main-->
		<div class="main container">
		<div class="map">
						<iframe src="map.aspx" title="地图"></iframe>
					</div>

		</div>
		<a class="move-top">
			<p><i class="glyphicon glyphicon-chevron-up"></i></p>
		</a>
		<footer>
			<div class="footer02">
				<div class="container">
					<div class="col-sm-4 col-xs-12 footer-address">
						<h4>校园学习网上论坛</h4>
						<ul>
							<li><i class="glyphicon glyphicon-home"></i>公司地址：山东省济南市历城区山东建筑大学</li>
							<li><i class="glyphicon glyphicon-phone-alt"></i>固定电话：0531-55555555 </li>
							<li><i class="glyphicon glyphicon-phone"></i>移动电话：15650075270</li>
							<li><i class="glyphicon glyphicon-envelope"></i>联系邮箱：136574390@qq.com</li>
						</ul>
					</div>
					<ul class="footerlink col-sm-4 hidden-xs">
						<li>
							<a href="index.aspx">网站首页</a>
						</li>
						<li>
							<a href="contact.aspx">联系我们</a>
						</li>
						<li>
							<a href="video.aspx">学习视频</a>
						</li>
						<li>
							<a href="contact.aspx">联系我们</a>
						</li>
					</ul>
					<div class="gw col-sm-4 col-xs-12">
						<p>关注我们：</p>
						<img src="public/images/wx.jpg"/>
						<p>客服热线：0531-55555555</p>
					</div>
				</div>
				<div class="copyright text-center">
					<span>copyright © 2018 </span>
					<span>校园学习网上论坛</span>
				</div>
			</div>
		</footer>
		<script src="public/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="public/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="public/js/main.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>
