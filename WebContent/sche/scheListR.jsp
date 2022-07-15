<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="scheListR.jsp">
<title>학사 관리 포털</title>
	<link href="${context}/css/fonts.css" rel="stylesheet">
	<link href="${context}/css/sass/jumbotronimg.css" rel="stylesheet">
    <link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<script src="${context}/js/jquery-1.9.1.js"></script>

    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

</head>

<script type="text/javascript">
	$(document).ready(function() {
	    $('#dataTables-example').dataTable();

	    $('#dataTables-example_filter').parent().remove();
	    $('#dataTables-example_length').parent().remove();


	});

	function fn_createSche(){
		location.href = "${context}/work/sche/createSche.do";
	}
</script>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
<div id="jumbotron" class="container">
		<div class="jumbotron jumbotron-info" style="background-color:">
			<h1><font color=""><strong>HakSa</strong>&nbsp;<span class="glyphicon glyphicon-blackboard"></span></font></h1>
			<p><font color="">학사 관리 포털에 오신 것을 환영합니다</font></p>
		</div>
		<div class="row">
			<div class="col-md-12">
			<c:if test="${sessionScope.grade == 'P'}">
				<div class="page-header" style="float: right;">
					  <button type="button" class="btn btn-danger btn-lg" onclick="fn_createSche()">일정쓰기</button>
				</div>
			</c:if>
			</div>
			<div class="col-md-12">
				    <div class="panel panel-default">
				        <!-- /.panel-heading -->
				        <div class="panel-body">
				            <div class="table-responsive">
				                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
				                    <thead>
				                        <tr>
				                        	<th style="text-align: left; vertical-align: middle; width: 30px;">Sche</th>
				                        </tr>
				                    </thead>
				                    <tbody>
				                    	<c:forEach items="${dsScheList}" var="dsScheList" varStatus="courseIdx">
				                         <tr>
				                         	<td style="vertical-align: middle;">
				                         		<div class="col-md-6"><a href ="${context}/work/sche/retrieveSche.do?scheNo=${dsScheList.SCHE_NO}"><font size="5px">${dsScheList.SCHE_TITLE}</font></a></div>
				                         		<div class="col-md-1"><span class="glyphicon glyphicon-eye-open fa-1x"></span><b>${dsScheList.SCHE_HITS}</b></div>
				                         		<div class="col-md-3"><b>${dsScheList.SCHE_START_DATE} ~ ${dsScheList.SCHE_END_DATE}</b></div>
												<div class="col-md-1"><img alt="User Pic" id="userImage" src="${context}/userImg/${dsScheList.USER_IMAGE}" height="21px" width="15px" class="img-circle">${dsScheList.USER_ID}</div>
												<div class="col-md-1" style="color: gray;"><small>${dsScheList.SCHE_TIMEAGO}</small></div>
				                         	</td>
				                         </tr>
					                    </c:forEach>
				                    </tbody>
				                </table>
				            </div>
				            <!-- /.table-responsive -->
				        </div>
				        <!-- /.panel-body -->
				    </div>
			    <!-- /.panel -->
			</div>
		</div>
	</div>
<jsp:include page="../common/foot.jsp"></jsp:include>



</body>
</html>