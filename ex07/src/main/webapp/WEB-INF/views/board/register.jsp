<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

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


<!-- 12grid 로 나눔 -->
   <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Register</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
   
    <div class="row">
    	<div class="col-lg-12">
    		<div calss= "panel panel-default">
    			<div class="panel-heading">Board Register</div>
    			<div class="panel-body"></div>
    				<form role="form" action="/board/register" method="post">
    					<div class="form-group">
    						<label>Title</label> <input class="form-control" name="title">
    					</div>

						<div class="form-group">
							<label>Text area</label>
							<textarea class="form-control" rows="3" name="content"></textarea>
						</div>
						
						<div class="form-group">
							<label>Writer</label> <input class="form-control" name="writer">
						</div>    				
    					<button type="submit" class="btn btn-default">Submit Button</button>
    					<button type="reset" class="btn btn-default">Reset Button</button>
    				</form>
    		</div>
    	</div>
    </div>
    
    <div class="row">
    	<div class="col-lg-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">File Attach</div>
    			<div class="panel-body">
    				<div class="form-group uploadDiv">
    					<input type="file" name='uploadFile' multiple>
    				</div>
    				
    				<div class='uploadResult'>
    					<ul>
    					
    					</ul>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
            


<script>
$(document).ready(function(e){
	var formObj = $("form[role='form']");
	$("button[type='submit']").on("click", function(e){
		e.preventDefault();
		console.log("submit clicked");
	})
	
	//-----------------파일업로드--------------------
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
	
	$("input[type='file']").change(function(e){
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
				showUploadResult(result);
			}
		}); //$ajax
		
		});
	
		function showUploadResult(uploadeResultArr){
			
			if(!uploadResultArr || uploadResultArr.length == 0){return;}
			var uploadUL = $(".uploadResult ul");
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
		}
	});
	
	
	
	

</script>
<%@ include file="../includes/footer.jsp" %>