<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<html>
<head>
    <title>音乐是生活的调味剂</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="../../style/screen.css" media="screen" />
    <link rel="stylesheet" href="../../style/lightbox.css" media="screen" />

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script>
        $(function () {
            $("#song").addClass("current");
        });

        function  submitFile(){
            $("#mp3loc").val($("#i1-file").val());
            $("#song-form").ajaxSubmit({
                url:"/upload/uploadFileMp3",
                data:{
                    fileType:"mp3"
                },
                dataType:"json",
                success:function (json) {
                    $("#lastMp3").val(json.realPath);
                    $("#mp3").val(json.relativePath);
                }
            })
        }
    </script>
</head>
<body>
<div class="container">
    <div class="top-navbar header b-b"> <a data-original-title="Toggle navigation" class="toggle-side-nav pull-left" href="#"><i class="icon-reorder"></i> </a>
        <div class="brand pull-left"> <a href="index.html"><img src="../../images/logo.png" width="147" height="33" /></a></div>
        <ul class="nav navbar-nav navbar-right  hidden-xs">
            <li class="dropdown"> <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <i class="icon-warning-sign"></i> <span class="badge">5</span> </a>
                <ul class="dropdown-menu extended notification">
                    <li class="title">
                        <p>You have 5 new notifications</p>
                    </li>
                    <li> <a href="#"> <span class="label label-success"><i class="icon-plus"></i></span> <span class="message">New user registration.</span> <span class="time">1 mins</span> </a> </li>
                    <li> <a href="#"> <span class="label label-danger"><i class="icon-warning-sign"></i></span> <span class="message">High CPU load on cluster #2.</span> <span class="time">5 mins</span> </a> </li>
                    <li> <a href="#"> <span class="label label-success"><i class="icon-plus"></i></span> <span class="message">New user registration.</span> <span class="time">10 mins</span> </a> </li>
                    <li> <a href="#"> <span class="label label-info"><i class="icon-bullhorn"></i></span> <span class="message">New items are in queue.</span> <span class="time">25 mins</span> </a> </li>
                    <li> <a href="#"> <span class="label label-warning"><i class="icon-bolt"></i></span> <span class="message">Disk space to 85% full.</span> <span class="time">35 mins</span> </a> </li>
                    <li class="footer"> <a href="#">View all notifications</a> </li>
                </ul>
            </li>
            <li class="dropdown"> <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <i class="icon-tasks"></i> <span class="badge">7</span> </a>
                <ul class="dropdown-menu extended notification">
                    <li class="title">
                        <p>You have 7 pending tasks</p>
                    </li>
                    <li> <a href="#"> <span class="task"> <span class="desc">Preparing new release</span> <span class="percent">30%</span> </span>
                        <div class="progress progress-small">
                            <div class="progress-bar progress-bar-info" style="width: 30%;"></div>
                        </div>
                    </a> </li>
                    <li> <a href="#"> <span class="task"> <span class="desc">Change management</span> <span class="percent">80%</span> </span>
                        <div class="progress progress-small progress-striped active">
                            <div class="progress-bar progress-bar-danger" style="width: 80%;"></div>
                        </div>
                    </a> </li>
                    <li> <a href="#"> <span class="task"> <span class="desc">Mobile development</span> <span class="percent">60%</span> </span>
                        <div class="progress progress-small">
                            <div class="progress-bar progress-bar-success" style="width: 60%;"></div>
                        </div>
                    </a> </li>
                    <li> <a href="#"> <span class="task"> <span class="desc">Database migration</span> <span class="percent">20%</span> </span>
                        <div class="progress progress-small">
                            <div class="progress-bar progress-bar-warning" style="width: 20%;"></div>
                        </div>
                    </a> </li>
                    <li class="footer"> <a href="#">View all tasks</a> </li>
                </ul>
            </li>
            <li class="dropdown"> <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <i class="icon-envelope"></i> <span class="badge">1</span> </a>
                <ul class="dropdown-menu extended notification">
                    <li class="title">
                        <p>You have 3 new messages</p>
                    </li>
                    <li> <a href="#"> <span class="photo"> <img src="../../images/profile.png" width="34" height="34" /></span> <span class="subject"> <span class="from">John Doe</span> <span class="time">Just Now</span> </span> <span class="text"> Consetetur sadipscing elitr... </span> </a> </li>
                    <li> <a href="#"> <span class="photo"><img src="../../images/profile.png" width="34" height="34" /></span> <span class="subject"> <span class="from">John Doe</span> <span class="time">35 mins</span> </span> <span class="text"> Sed diam nonumy... </span> </a> </li>
                    <li> <a href="#"> <span class="photo"><img src="../../images/profile.png" width="34" height="34" /></span> <span class="subject"> <span class="from">John Doe</span> <span class="time">5 hours</span> </span> <span class="text"> No sea takimata sanctus... </span> </a> </li>
                    <li class="footer"> <a href="#">View all messages</a> </li>
                </ul>
            </li>
            <li class="dropdown user  hidden-xs"> <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <i class="icon-male"></i> <span class="username">John Doe</span> <i class="icon-caret-down small"></i> </a>
                <ul class="dropdown-menu">
                    <li><a href="#"><i class="icon-user"></i> My Profile</a></li>
                    <li><a href="#"><i class="icon-calendar"></i> My Calendar</a></li>
                    <li><a href="#"><i class="icon-tasks"></i> My Tasks</a></li>
                    <li class="divider"></li>
                    <li><a href="#"><i class="icon-key"></i> Log Out</a></li>
                </ul>
            </li>
        </ul>
        <form role="search" class="navbar-form pull-right" id="search-form" />
        <input type="search" placeholder="Search..." class="search-query" id="search-input" />
        </form>
    </div>
</div>
<div class="wrapper">

    <jsp:include page="menu.jsp"></jsp:include>
    <div class="page-content">
        <div class="content container">
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-title">添加音乐<small> 上架新歌喽</small></h2>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="widget">
                        <div class="widget-header"> <i class="icon-user"></i>
                            <h3>User Profile</h3>
                        </div>
                        <div class="widget-content">
                            <div class="body">
                                <form data-validate="parsley" method="post" action="/song/add" novalidate="" class="form-horizontal label-left" id="song-form" >

                                <fieldset>
                                    <legend class="section">歌曲信息</legend>
                                    <div class="control-group">
                                        <label for="sname" class="control-label">歌名</label>
                                        <div class="controls form-group">
                                            <input type="text" class="col-sm-6 col-xs-12" name="sname" id="sname" />
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label for="srid" class="control-label">歌手<span class="required">*</span></label>
                                        <div class="controls form-group">
                                            <div data-toggle="buttons" class="btn-group col-sm-2" >
                                                <select id="srid" name="srid" class="form-control ">
                                                    <c:forEach items="${songers}" var="songer">
                                                        <option value="${songer.srid}">${songer.srname}</option>
                                                    </c:forEach>
                                                </select>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label for="aid" class="control-label">专辑<span class="required">*</span></label>
                                        <div class="controls form-group">
                                            <div data-toggle="buttons" class="btn-group col-sm-2" >
                                                <select id="aid" name="aid" class="form-control ">
                                                    <c:forEach items="${albums}" var="album">
                                                        <option value="${album.aid}">${album.aname}</option>
                                                    </c:forEach>
                                                </select>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label for="tid" class="control-label">流派<span class="required">*</span></label>
                                        <div class="controls form-group">
                                            <div data-toggle="buttons" class="btn-group col-sm-2" >
                                                <select id="tid" name="tid" class="form-control ">
                                                    <c:forEach items="${mtypes}" var="mtype">
                                                        <option value="${mtype.tid}">${mtype.tname}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label for="isNew" class="control-label">是否新歌<span class="required">*</span></label>
                                        <div class="controls form-group">
                                            <div data-toggle="buttons" class="btn-group col-sm-2" >
                                                <select id="isNew" name="isNew" class="form-control ">
                                                    <option value="1">是</option>
                                                    <option value="0">否</option>
                                                </select>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label for="isHot" class="control-label">是否热歌<span class="required">*</span></label>
                                        <div class="controls form-group">
                                            <div data-toggle="buttons" class="btn-group col-sm-2" >
                                                <select id="isHot" name="isHot" class="form-control ">
                                                    <option value="1">是</option>
                                                    <option value="0">否</option>
                                                </select>

                                            </div>
                                        </div>
                                    </div>




                                </fieldset>
                                <fieldset>
                                    <legend class="section">歌曲文件</legend>


                                    <div class="control-group">
                                        <label class="control-label" for="description">歌词</label>
                                        <div class="controls form-group">
                                            <textarea class="form-control" name="lrc" rows="3" id="description"></textarea>
                                            <span class="help-block">请入lrc格式歌词</span> </div>
                                    </div>
                                    <div class="control-group">
                                        <label for="i1-file" class="control-label">选择歌曲 <span class="required">*</span></label>
                                        <!--<div class="col-sm-4 control-label">选择文件</div>-->
                                        <div class="col-sm-6">
                                            <div class="input-group">
                                                <input id='mp3loc' class="form-control" onclick="$('#i-file').click();">
                                                <label class="input-group-btn">
                                                    <input type="button" id="i1-check" value="选择歌曲文件" class="btn btn-primary" onclick="$('#i1-file').click();">
                                                </label>
                                            </div>
                                        </div>
                                        <input type="hidden" id="mp3" name="mp3" lay-verify="pic">
                                        <input type="hidden" id="lastMp3" name="lastMp3">
                                        <input type="file" name="mp3file" id='i1-file'  accept=".mp3, .wma" onchange="submitFile()" style="display: none">

                                    </div>


                                </fieldset>
                                <div class="form-actions text-right">
                                    <button class="btn btn-primary" type="submit">提交歌曲</button>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
<div class="bottom-nav footer"> 青城博雅教育出品 </div>
<script>$("#song").addClass("current");</script>
<script src="../../javascript/lightbox-2.6.min.js"></script>
<script>
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-2196019-1']);
    _gaq.push(['_trackPageview']);

    (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
</script>

</body>
</html>

