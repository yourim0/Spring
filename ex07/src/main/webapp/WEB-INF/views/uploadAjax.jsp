<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3W//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd>
<html>

<style>
.uploadResult {
   width: 100%;
   background-color: gray;
}

.uploadResult ul {
   display: flex;
   flex-flow: row;
   justify-content: center;
   align-items: center;
}

.uploadResult ul li {
   list-style: none;
   padding: 10px;
}

.uploadResult ul li img {
   width: 100px;
}
</style>

<style>
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
</style>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<h1>Upload with Ajax</h1>

<div class="uploadDiv">
	<input type='file' name='uploadFile' multiple> 
</div>
 <!-- 파일이름 화면 출력 -->
<div class="uploadResult">
<ul>

</ul>
</div>

<button id = 'uploadBtn'>Upload</button>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
		//-----------------파일 확장자, 크기 사전처리--------------------
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); //정규표현식 사용
		var maxSize = 524280; //5mb
		
		function chechExtension(fileName,fileSize){ 
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드 할 수 없어요");
				return false;
			}
			return true;
		}
		
		var cloneObj=$(".uploadDiv").clone();
		
		$("#uploadBtn").on("click", function(e){
			var formData = new FormData(); //jquery 객체
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			console.log(files);
			
			//add filedata to formdata
			
			for(var i=0;i < files.length; i++){
				
				if(!chechExtension(files[i].name, files[i].size)){
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			
			
			//화면 파일 목록 출력
			var uploadResult = $(".uploadResult ul");
			function showUploadeFile(uploadResultArr){
				var str="";
				$(uploadResultArr).each(function(i, obj){
					if(!obj.image){
						str += "<li><img src='/resources/img/attach.png'>" + obj.fileName + "</li>";
					}else{
						//str += "<li>" + obj.fileName+"</li>";
						var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_" + obj.uuid+"_"+obj.fileName);
						str += "<li><img src='/display?fileName="+fileCallPath+"'><li>";
					}
					});
				uploadResult.append(str);
			}
			
			
			$.ajax({
				url:'uploadAjaxAction',
				processData:false,
				contentType:false,
				data:formData,
				type:'POST',
				dataType:'json',
				success:function(result){
					console.log(result)
					showUploadeFile(result);
					$(".uploadDiv").html(cloneObj.html()); //<input type="file"> 초기화
				}
			}); //$ajax
			
			
			
		});
	});
</script>
</body>
</html>