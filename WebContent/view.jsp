<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1"><!-- viewport=화면상의 표시영역, content=모바일 장치들에 맞게 크기조정, initial=초기화면 배율 설정 -->
<link rel="stylesheet" href="css/bootstrap.css"><!-- 스타일시트로 css폴더의 bootstrap.css파일 사용 -->
<title>게시판!!</title>
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	int bbsID =0;
	if(request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if(bbsID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('有効ではない内容です！')");
		script.println("location href = 'bbs.jsp'");
		script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
%>
	<nav class="navbar navbar-inverse"> <!-- navbar-색상(inverse = 검은색, default = 색x) -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
				<!-- class="navbar-toggle collapsed"=>네비게이션의 화면 출력유무
				data-toggle="collapse" : 모바일 상태에서 클릭하면서 메뉴가 나오게 설정 -->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
					<!-- 아이콘 이미지 -->
			</button>
			<a class="navbar-brand" href="main.jsp">GYU & MIN HOMEPAGE</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav"> <!-- navbar-nav => 네비게이션 바의 메뉴 -->
				<li><a href="main.jsp">MAIN</a></li>
				<li class="active"><a href="bbs.jsp">LIST</a></li>
				<!-- 메뉴, 게시판의 main.jsp와 bbs.jsp의 파일로 각각 이동 -->
			</ul>
			<%
				if(userID == null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">ENTRANCE<span class="caret"></span></a>
						<!-- 임시의 주소링크 "#"을 기재한다. -->
						<!-- caret = creates a caret arrow icon (▼) -->
						<ul class="dropdown-menu">
							<!-- dropdown-menu : 버튼을 눌렀을때, 생성되는 메뉴(접속하기를 눌렀을때 로그인, 회원가입 메뉴 -->

							<li><a href="login.jsp">Login</a></li>
							<!-- active = 활성화 되었을때 로그인, 회원가입-->

							<li><a href="join.jsp">会員登録</a></li>

						</ul>
				</li>
			</ul>
			<%
				}else{
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">会員管理<span class="caret"></span></a>
						<!-- 임시의 주소링크 "#"을 기재한다. -->
						<!-- caret = creates a caret arrow icon (▼) -->
						<ul class="dropdown-menu">
							<!-- dropdown-menu : 버튼을 눌렀을때, 생성되는 메뉴(접속하기를 눌렀을때 로그인, 회원가입 메뉴 -->

							<li><a href="logoutAction.jsp">Logout</a></li>
						</ul>
				</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border:1px solid #dddddd" >
				<thead>
					<tr>
						<th colspan="3" style="background-color: #aaaaaa; text-align: center;">掲示板 内容
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">タイトル</td>
						<td colspan="2"><%=bbs.getBbsTitle() %></td>
					</tr>
					<tr>
						<td>作成者</td>
						<td colspan="2"><%=bbs.getUserID() %></td>
					</tr>
					<tr>
						<td>作成日</td>
						<td colspan="2"><%=bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11,13)+ "時" +
								bbs.getBbsDate().substring(14,16) + "分" %></td>
					</tr>
					<tr>
						<td>内容</td>
						<td colspan="2" style="min-height: 200px; text-align: center; left;">
						<%=bbs.getBbsContent().replace(" ", "&nbsp;").replace("<", "&lt;").replace(">", "&gt;").replace("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>

			<a href="bbs.jsp" class="btn btn-primary">目録</a>
			<%
				if(userID != null && userID.equals(bbs.getUserID()) ){
			%>
				<a href="update.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">修正</a>
				<a onclick="return confirm('削除していいですか？')"  href="deleteAction.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">削除</a>
			<%
				}
			%>

			<a href="write.jsp" class="btn btn-primary pull-right">作成画面へ</a>
			<!-- <input type="submit" class="btn btn-primary pull-right" value="作成"> -->
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>



