<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<html>
<head>
<title>青城博雅教育出品</title>
<meta charset="utf-8">

<link rel="stylesheet" type="text/css" href="/css/scroll.css">
<link rel="stylesheet" type="text/css" href="/css/xiami.css">

<script type="text/javascript" src="/js/common/jquery-1.8.3.js"></script>
<script type="text/javascript" src="/js/common/jquery-ui.js"></script>
<script type="text/javascript" src="/js/portal/canvas.js"></script>
<script type="text/javascript" src="/js/portal/mousewheel.js"></script>
<script type="text/javascript" src="/js/portal/scroll.js"></script>
<script type="text/javascript" src="/js/xiami.js"></script>

</head>
<body>
	<!--模糊画布-->
	<div class="blur">
		<canvas style="width:1366px;height:700px;opacity:0;" width="1366" height="700" id="canvas"></canvas>
	</div>
	<div class="playerMain">
		<div class="top">
			<a href="#" class="logo"></a>
			<div class="search">
				<div type="submit" class="searchBtn"></div>
				<input type="text" class="searchTxt">
			</div>
			<div class="mainNav">
				<div class="tipLogin">
					马上
					<a href="#" class="loginA">登录</a>
				</div>
				<a href="#" class="myroom"></a>
			</div>
		</div>
		<div class="middle">
			<div class="mainWrap">
				<div class="leftBar">
					<ul class="menuUL">
						<li class="menuLi cur">
							<a href="#">
								<i class="icon iplay"></i>
								正在播放
							</a>
						</li>
						<li class="menuLi">
							<a href="#">
								<i class="icon ihst"></i>
								播放历史
							</a>
						</li>
						<li class="menuLi">
							<a href="#">
								<i class="icon ishouc"></i>
								我收藏的单曲
							</a>
						</li>
					</ul>
					<div class="collectOut">
						<span class="colS">我创建的精选集</span>
						<a href="#" class="colA"></a>
					</div>
					<div class="cellectList"></div>
					<audio id="audio"  src="/dyzdj.mp3"></audio>
					<%--http://localhost:8088/mp3/8e018892-2bbf-42a0-98b9-03afbddc709a.mp3--%>
				</div>
				<div class="mainBody">
					<div class="playHd">
						<div class="phInner">
							<div class="col">歌曲(50)</div>
							<div class="col">演唱者</div>
							<div class="col">专辑</div>
						</div>
					</div>
					<div class="playBd">
						<div class="scrollView">
							<!-- <div class="scroll"></div> -->
							<ul class="songUL">
								<c:forEach items="${songs}" var="song" varStatus="status">
								<li class="songList">
									<div class="songLMain">
										<div class="check">
											<input class="checkIn" type="checkbox" select="0" value="${song.sid}">
										</div>
										<div class="start" >
											<em sonN="${status.count}" msid="${song.sid}">${status.count}</em>
										</div>
										<div class="songBd">
											<div class="col colsn">${song.sname}</div>
											<div class="col colcn">${song.songer.srname}</div>
											<div class="col">${song.album.aname}</div>
										</div>
										<div class="control">
											<a class="cicon love"></a>
											<a class="cicon more" style="display:none"></a>
											<a class="cicon dele" style="display:none"></a>
										</div>
									</div>									
								</li>
								</c:forEach>

							</ul>
						</div>
					</div>
					<div class="playFt">
						<div class="track">
							<div class="uiCheck">
								<input class="checkAll" type="checkbox" select="0">
							</div>
							<div class="uiItem">
								<a href="#" class="itIcon itDele">删除</a>
							</div>
							<div class="uiItem">
								<a href="#" class="itIcon itShou">收藏</a>
							</div>
							<div class="uiItem">
								<a href="#" class="itIcon itJin">添加到精选集</a>
							</div>
							<div class="uiItem">
								<a href="#" class="itIcon itMore">更多</a>
							</div>
						</div>
					</div>
				</div>
				<div class="mainOuther">
					<div class="albumCover">
						<a href="#">
							<img src="/images/2.jpg" id="canvas1">
						</a>
					</div>
					<div class="albumSale">
						<a href="#" class="asA">
							<img src="">
						</a>
					</div>
					<div id="lyr"></div>
				</div>
			</div>
		</div>
		<div class="bottom">
			<div class="playerWrap">
				<div class="playerCon">
					<a href="#" class="pbtn prevBtn"></a>
					<a href="#" class="pbtn playBtn" isplay="0"></a>
					<a href="#" class="pbtn nextBtn"></a>
					<a href="#" class="mode"></a>
				</div>
				<div class="playInfo">
					<div class="trackInfo">
						<a href="#" class="songName">漂洋过海来看你(Live)</a>
						-
						<a href="#" class="songPlayer">刘明湘</a>
						<div class="trackCon">
							<a href="#" class="tc1"></a>
							<a href="#" class="tc2"></a>
							<a href="#" class="tc3"></a>
						</div>
					</div>
					<div class="playerLength">
						<div class="position">00:00</div>
						<div class="progress">
							<div class="pro1"></div>
							<div class="pro2">
								<a href="#" class="dian"></a>
							</div> 
						</div>
						<div class="duration">03:35</div>
					</div>
				</div>
				<div class="vol">
					<a href="#" class="pinBtn"></a>
					<div class="volm">
						<div class="volSpeaker"></div>
						<div class="volControl">
							<a href="#" class="dian2"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">

</div>
</body>
</html>