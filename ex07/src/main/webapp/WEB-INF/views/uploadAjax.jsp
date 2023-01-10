<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3W//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd>
<html>

<div class='bigPictureWrapper'>
	<div class='bigPicture'>
	</div>
</div>

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

.bigPicture img{
width:600px;
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

	//썸네일 클릭시 원본이미지 보여줌
	function showImage(fileCallPath){
		//alert(fileCallPath);
		$(".bigPictureWrapper").css("display","flex").show();
		$(".bigPicture")
		.html("<img src='/display?fileName=" + encodeURI(fileCallPath)+"'>")
		.animate({width:'100%', height:'100%'}, 1000);
	}
	
	$(".bigPictureWrapper").on("click", function(e){
		$(".bigPicture").animate({width:'0%', height:'0%'},1000);
		setTimeout(function(){
			$('.bigPictureWrapper').hide();
		},1000);
	})

	
		//------------------------파일삭제------------------------------
	
	$(".uploadResult").on("click","span", function(e){
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		console.log(targetFile);
	
	$.ajax({
		url:'/deleteFile',
		data : {fileName:targetFile, type:type},
		dataType:'text',
		type:'POST',
		success:function(result){
			alert(result);
		}
	}); //ajax
	});
	
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
		
			//화면 파일 목록 출력
			var uploadResult = $(".uploadResult ul");
			function showUploadeFile(uploadResultArr){
				var str="";
				$(uploadResultArr).each(function(i, obj){
					if(!obj.image){
						var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
						
						var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
						
						str += "<li><div><a href='/download?fileName="+fileCallPath+"'>"
								+"<img src='/resources/img/attach.png'>" + obj.fileName +"</a>"+"<span data-file=\'"+fileCallPath+"\' data-type='file'> x </span>" + "</div></li>"
					}else{
						//str += "<li>" + obj.fileName+"</li>";
						var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_" + obj.uuid+"_"+obj.fileName);	
						
						var originPath = obj.uploadPath+"\\"+obj.uuid + "_"+obj.fileName;
						originPath = originPath.replace(new RegExp(/\\/g),"/"); //이게 뭐여 도대체 승질나게
						
						str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\"><img src='/display?fileName="+fileCallPath+"'></a>"
								+ "<span data-file=\'"+ fileCallPath+"\' data-type='image'> x </span>"+"</li>";
					}
					});
				uploadResult.append(str);
			}
	});
	
	

	
</script>
</body>
</html>