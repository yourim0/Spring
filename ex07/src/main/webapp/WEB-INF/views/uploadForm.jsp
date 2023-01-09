<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="uploadFormAction" method="post" enctype="multipart/form-data" >
<input type='file' name='uploadFile' multiple> <!-- multiple: 한번에 여러개 파일 업로드 -->
<button>Submit</button> 
</form>
</body>
</html>