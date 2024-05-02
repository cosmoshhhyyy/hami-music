<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<html>
<head>
    <title>tx 音乐是生活的调味剂</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <script>

        var layer;

        $(function () {
            layui.use('layer', function(){
                layer = layui.layer;
            });
            $("#toggleSearch").click(function () {
                var flag =  $(this).attr("flag");
                if(flag == 1){
                    $("#find").show(500);
                    $(this).attr("flag",2);
                    $(this).html("收缩↑");
                }else{
                    $("#find").hide(500)
                    $(this).attr("flag",1);
                    $(this).html("展开↓");
                }
            });



            $("#search").click(function () {
                $("#pageNo").val(1);
                $("#txForm").submit();
            });

            /**
             * 用于控制上一页和下一页的可用的切换（可点不可点的代码）
             * @type {jQuery}
             */
            var pageNo = $("#pageNo").val();
            var totalPage = $("#totalPage").val();

            pageNo = parseInt(pageNo);
            totalPage = parseInt(totalPage);

            if(pageNo==1&&totalPage==pageNo){
                $("#prev").addClass("disabled");
                $("#next").addClass("disabled");
            }
            if(pageNo==1&&totalPage>pageNo){
                $("#prev").addClass("disabled");
                $("#next").removeClass("disabled");
            }
            if(pageNo>1&&totalPage>pageNo){
                $("#prev").removeClass("disabled");
                $("#next").removeClass("disabled");
            }
            if(pageNo>1&&totalPage==pageNo){
                $("#prev").removeClass("disabled");
                $("#next").addClass("disabled");
            }
            $("#prev").click(function () {
                $("#pageNo").val(--pageNo);
                $("#txForm").submit();
            })

            $("#next").click(function () {
                $("#pageNo").val(++pageNo);
                $("#txForm").submit();
            })

            $("a[pageNoButton]").click(function () {
                var pageNo=$(this).html();
                $("#pageNo").val(pageNo);
                $("#txForm").submit();
            })



            var pop;
            $("#addAlbum").click(function () {

                pop = layer.open({
                    type: 1,
                    area:[900, 650],
                    content: $('#albumPop'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
                    cancel: function(index, layero){
                        if(confirm('确定要关闭么')){ //只有当点击confirm框的确定时，该层才会关闭
                            layer.close(index)
                        }
                        return false;
                    }
                });

            })


            layui.use('laydate', function(){
                var laydate = layui.laydate;

                //执行一个laydate实例
                laydate.render({
                    elem: '#addPdate'
                });

                //执行一个laydate实例
                laydate.render({
                    elem: '#searchPdate'
                });



            });
            layui.use('form', function(){
                var form = layui.form;

                //监听提交
                form.on('submit(demo1)', function(data){
                    layer.msg(JSON.stringify(data.field));
                    //使用原生ajax来向数据库提交数据
                    $.ajax({
                        url:"/album/addAlbum",
                        type:"post",
                        data:data.field,
                        dataType:"text",
                        success:function (text) {
                            if(text=="success"){
                                layer.msg("添加成功");
                                layer.close(pop);
                            }
                        }
                    })
                    //阻止页面跳转的
                    return false;
                });
                form.verify({
                    aname: function(value, item){ //value：表单的值、item：表单的DOM对象
                        if(!new RegExp("^[a-zA-Z0-9\u4e00-\u9fa5]{1,20}$").test(value)){
                            return '必须是中英文或数字字符，长度1-20';
                        }
                        var flag = "false";
                        $.ajax({
                            url: "/album/isSname",
                            type: "post",
                            data: {
                                aname:value
                            },
                            async:false,
                            dataType: "text",
                            success: function (text) {
                                flag = text;
                            }
                        })
                        if(flag == "true"){
                            return "专辑名已存在";
                        }

                    },
                    //我们既支持上述函数式的方式，也支持下述数组的形式
                    //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
                    company: [/^[a-zA-Z0-9\u4e00-\u9fa5]{1,20}$/,'必须是中英文或数字字符，长度1-20'],
                    pdate: [/^.+$/,'请选择发现日期'],
                    pic: [/^.+$/,'亲不要忘记上传专辑封面喔'],
                    lang: [/^[\u4e00-\u9fa5]{1,10}$/,'请输入中文的语种']
                });
            });
            $(".btn-warning").click(function () {
                var aid = $(this).attr("aid");

                layer.confirm('是否确认删除?', {icon: 3, title:'提示'}, function(index){
                    $.ajax({
                        url: "/album/delAlbum",
                        type: "post",
                        data: {
                            aid:aid
                        },
                        dataType: "text",
                        success: function (text) {
                            if (text == "success") {
                                layer.msg("删除成功");
                                layer.close(index);
                                $("#txForm").submit();
                            }
                        }
                    })
                });
            })

        });
        function submitFile() {
            $('#location').val($('#i-file').val());  //图片的全路径
            $('#addAlbumForm').ajaxSubmit({
                url:"/upload/uploadFile",
                type:"post",
                //传输的数据
                data:{
                    //传输文件的类型
                    fileType:"pic"
                },
                //返回形式
                dataType:"json",
                success:function (json) {
                    $("#albuma").attr("href",json.realPath);
                    $("#albumImg").attr("src",json.realPath);
                    $("#lastImg").val(json.realPath);
                    $("#pic").val(json.relativePath);
                }

            });
        }


    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
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
<form id="txForm" action="/album/dofindAll" method="post" class="form-horizontal" >
    <div class="wrapper">

        <jsp:include page="menu.jsp"></jsp:include>

        <div class="page-content">
            <div class="content container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-title">歌曲列表 <small>favor song</small></h2>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="widget">
                            <div class="widget-header"> <i class="icon-list-ol"></i>
                                <h3>搜索条件</h3>
                            </div>
                            <div class="widget-content">

                                <fieldset id="find">
                                    <!--<legend class="section">Horizontal form</legend>-->
                                    <div class="control-group">
                                        <label for="aname" class="control-label">专辑名</label>
                                        <div class="controls form-group">
                                            <div class="input-group"> <span class="input-group-addon"><i class="icon-music"></i></span>
                                                <input type="text" value="${album.aname}"  placeholder="如：thriller" name="aname" id="aname" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label for="company" class="control-label">唱片公司</label>
                                        <div class="controls form-group">
                                            <div class="input-group"> <span class="input-group-addon"><i class="icon-user"></i></span>
                                                <input type="text" value="${album.company}" placeholder="如：史诗唱片" name="company" id="company" class="form-control" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label for="lang" class="control-label">语种</label>

                                        <div class="controls form-group">
                                            <div class="input-group"> <span class="input-group-addon"><i class="icon-user"></i></span>
                                                <input value="${album.lang}" type="text" placeholder="如：英语" name="lang" id="lang" class="form-control" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label for="searchPdate" class="control-label">日期</label>
                                        <div class="controls form-group">
                                            <div class="input-group"> <span class="input-group-addon"><i class="icon-reorder"></i></span>
                                                <input readonly id="searchPdate" value="<fmt:formatDate value='${album.pdate}' pattern='yyyy-MM-dd'/>" type="text" placeholder="如：1970-01-01" name="pdate"  class="form-control"/>
                                            </div>
                                        </div>



                                        <%--<label for="dtp_input2" class="col-md-2 control-label">发行时间</label>
                                        <div class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                            <input value="<f:formatDate value="${mq.pdate}" pattern="yyyy-MM-dd"></f:formatDate>"  name="pdate" class="form-control" size="16" type="text" value="" readonly>
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                        </div>
                                        <input type="hidden" id="dtp_input2" value="" /><br/>--%>
                                    </div>




                                </fieldset>
                                <div class="form-actions text-right">
                                    <div>
                                        <button id="search" class="btn btn-primary" type="submit">搜索</button>
                                        <button id="addAlbum" class="btn btn-primary" type="button" >添加歌曲</button>
                                        <button id="toggleSearch" flag = "2" class="btn btn-default" type="button">收缩↑</button>
                                    </div>
                                </div>


                            </div>
                            <div class="widget-content" >
                                <div class="body">
                                    <table class="table table-striped table-images" style="color: white;font-size: 14px">
                                        <thead>
                                        <tr>
                                            <th class="hidden-xs-portrait">序号</th>
                                            <th>封面</th>
                                            <th>专辑名字</th>
                                            <th class="hidden-xs-portrait">唱片公司</th>
                                            <th class="hidden-xs">发行时间</th>
                                            <th class="hidden-xs">语种</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%--第三方标签库  遍历结果集   EL表达式取值  注意点#和$的问题  $--%>
                                        <c:forEach items="${page.list}" var="album" varStatus="status">
                                            <tr>
                                                <td class="hidden-xs-portrait">${album.aid}</td>
                                                <td><img src="${filePath}${album.pic}" /></td>
                                                <td> ${album.aname} </td>
                                                <td class="hidden-xs-portrait">${album.company}</td>
                                                <%--JSTL第三方标签库实现时间格式展现--%>
                                                <td class="hidden-xs"> <p><strong><fmt:formatDate value="${album.pdate}" pattern="yyyy-MM-dd"></fmt:formatDate></strong></p> </td>
                                                <td class="hidden-xs">${album.lang}</td>
                                                <td>
                                                    <button class="btn btn-sm btn-primary" modify aid="${album.aid}"> 修改 </button>
                                                    <button data-toggle="button" class="btn btn-sm btn-warning" aid="${album.aid}"> 删除 </button>
                                                 </td>
                                            </tr>

                                        </c:forEach>

                                        </tbody>
                                    </table>
                                    <jsp:include page="pagination.jsp"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<div class="bottom-nav footer"> 青城博雅教育出品 </div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script>$("#album").addClass("current");</script>

<div id="albumPop" style="margin-right: 50px;margin-top: 50px; display: none">
    <form id="addAlbumForm" class="layui-form" method="post" action="/album/addAblum" lay-filter="example">
        <div class="layui-form-item" >
            <label class="layui-form-label" style="width:100px">专辑名字</label>
            <div class="layui-input-block">
                <input  type="text" name="aname" style="color: black; border-color: lightgray;background-color: white"  lay-verify="aname" autocomplete="off" placeholder="请输入专辑名" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item" >
            <label class="layui-form-label" style="width:100px">发行公司</label>
            <div class="layui-input-block">
                <input  type="text" name="company" style="color: black; border-color: lightgray;background-color: white"  lay-verify="company" autocomplete="off" placeholder="请输入公司名" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" >
            <label class="layui-form-label" style="width:100px">发行时间</label>
            <div class="layui-input-block">
                <input  type="text" id="addPdate"  name="pdate" style="color: black; border-color: lightgray;background-color: white"  lay-verify="pdate" autocomplete="off" placeholder="请输入发行时间" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label  class="layui-form-label" style="width:100px">图片</label>
            <div class="controls form-group">
                <div class="col-sm-4 col-md-2">
                    <div class="image-row">
                        <div class="image-set"> <a class="example-image-link" id="albuma" href="../../img/gallery-photo/image-3.jpg" data-lightbox="example-set" title="Click on the right side of the image to move forward.">
                            <img class="example-image" id="albumImg" src="../../img/gallery-photo/thumb-3.jpg" alt="Plants: image 1 0f 4 thumb" width="150" height="150" /></a> </div>
                    </div>
                </div>
            </div>
        </div>



        <div class="layui-form-item">
            <label for="i-file" class="layui-form-label" style="width:100px">选择文件</label>
            <!--<div class="col-sm-4 control-label">选择文件</div>-->
            <div id="examples" class="section examples-section">
                <div class="col-sm-6">
                    <div class="input-group">
                        <input id='location' class="form-control" onclick="$('#i-file').click();">
                        <label class="input-group-btn">
                            <input  type="button" id="i-check" value="选择封面" class="btn btn-primary" onclick="$('#i-file').click();">
                        </label>
                    </div>
                </div>
                <%--在选择一个文件的时候触发的事件onchange--%>
                <input type="hidden" id="pic" name="pic" lay-verify="pic">
                <input type="hidden" id="lastImg" name="lastImg">
                <input type="file" name="picFile" id='i-file'  accept=".jpg, .png" onchange="submitFile()" style="border-color: lightgray;background-color: lightgray;display: none">
            </div>
        </div>

        <div class="layui-form-item" >
            <label for="lang1" class="layui-form-label " style="width:100px">语种</label>
            <div class="layui-input-block">
                <input id="lang1"  type="text" name="lang" style="color: black; border-color: lightgray;background-color: white"  lay-verify="lang" autocomplete="off" placeholder="请输入语种" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn layui-btn-normal layui-btn-radius" lay-submit="" lay-filter="demo1">添加专辑</button>
            </div>
        </div>
    </form>
</div>

</body>
</html>







