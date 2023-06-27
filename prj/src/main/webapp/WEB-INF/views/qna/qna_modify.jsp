<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="dto" value="${Modify }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[${dto.qna_head }] ${dto.qna_title } : TODO Q&A</title>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/qna.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
	<%@include file="../include/header04.jsp"%>
	<div id="container">
		<div class="header1"><h2>1:1 문의 수정하기</h2></div>
		<div class="header2">카테고리를 지정하여 문의글을 수정해주세요. 답변이 달리기까지 3~5일 정도의 시간이 소요될 수 있습니다.</div>
		<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/qna_modify_ok.do">
			<input type="hidden" name="qna_num" value="${dto.qna_num }">
			<input type="hidden" name="page" value="${Page }">			
			<div id="writingContent">
				<table>
					<tr>
						<th>CATEGORY</th>
						<td>
							<c:if test="${empty ManagerId }">
								<select name="qna_head" class="qna_head inputBox" onchange="showSearchUser(this)">
									<option value="회원 가입 및 계정 관리">회원 가입 및 계정 관리</option>
									<option value="사용자 신고">사용자 신고</option>
									<option value="포인트 관련">포인트 관련</option>
									<option value="사이트 사용법">사이트 사용법</option>
									<option value="커뮤니티">커뮤니티</option>
									<option value="기타">기타</option>
								</select>
								<div id="qna_password_check">※ 카테고리를 다시 지정해주세요. 사용자 신고의 경우, 닉네임을 다시 검색해주시길 바랍니다.</div>
							</c:if>
							<div class="row searchUserWrap" style="display: none;">
								<span>
									<input type="text" id="searchBox" class="inputBox" name="qna_reportedUser" placeholder="신고하실 사용자의 닉네임을 검색해주세요." onkeyup="searchUser()">
								</span>
								<div class="userList"></div>
								<h3 class="selected"></h3>
							</div>
						</td>
					</tr>
					<tr>
						<th>TITLE</th>
						<td><input name="qna_title" id="qna_title" class="inputBox" placeholder="Q&A 제목을 입력하세요." value="${dto.qna_title }"></td>
					</tr>
					<tr>
						<th>WRITER</th>
						<td>
							<c:if test="${!empty UserId }">
								<input name="qna_writer" class="inputBox" value="${dto.qna_writer }">
							</c:if>
							<c:if test="${empty UserId }">
								<input name="qna_writer" class="inputBox" id="qna_writer" placeholder="닉네임을 입력하세요." onblur="checkNick()" value="${dto.qna_writer }">
								<div id="qna_writer_check"></div>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>PASSWORD</th>
						<td>
							<input name="qna_password" id="qna_password" class="inputBox" type="password" placeholder="비밀번호를 입력하세요." value="${dto.qna_password }">
							<div id="qna_password_check">※ 경고: 문의글에 설정된 비밀번호는 비밀번호 찾기가 불가능합니다.</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea name="qna_content" id="qna_content">${dto.qna_content }</textarea>
						</td>
					</tr>
					<tr>
						<th>IMAGE</th>
						<td>
							<div class="writingFile">
								<input type="file" name="file" id="file_input_hidden">
								<label class="file_label" for="file_input_hidden">파일선택</label>
								<span id="fileName">${dto.qna_file }</span>
							</div>
							<img id="preview" style="display: none; height: 200px;"  src="<%=request.getContextPath()%>/resources/upload/qna/${dto.qna_file }" />
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<%@include file="../include/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/qna.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/summernote.js"></script>
	<script type="text/javascript">
		$('#qna_content').summernote('editor.insertText', ' ');
	</script>
</body>
</html>