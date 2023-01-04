<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

    
<%@ include file="../includes/header.jsp" %>


            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Read</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                    
                        <div class="panel-heading"> Board Read Page</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
                        <div class="form-group">
                        <label>Bno</label><input class="form-control" name="bno" value="<c:out value='${board.bno }' />" readonly="readonly">
                        </div>
                        
                         <div class="form-group">
                        <label>Title</label><input class="form-control" name="title" value="<c:out value='${board.title }' />" readonly="readonly">
                        </div>
                        
                         <div class="form-group">
                        <label>Textarea</label><input class="form-control" name="content" value="<c:out value='${board.content }' />" readonly="readonly">
                        </div>
                        
                         <div class="form-group">
                        <label>Writer</label><input class="form-control" name="writer" value="<c:out value='${board.writer }' />" readonly="readonly">
                        </div>
                        
                        <button data-oper="modify" class="btn btn-default">Modify</button>
                        <button data-oper="list" class="btn btn-info">List</button>
                        
                        <form id='operForm' action="/board/modify" method="get">
	                        <input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno }" />'>
	                        <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
	                        <input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
	                        <input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
	                        <input type="hidden" name="type" value='<c:out value="${cri.type }"/>'>
                        </form>
                        </div>
                      </div>
                    </div>
           
                  
                  <div class='row'>
                  	<div class="col-lg-12">
                  	 <!-- /.panel -->
                  	 <!-- <div class="panel-heading">
                  	 	<i class="fa fa-comments fa-fw"></i> Reply
                  	 </div> -->
                  	 
                  	 <div class="panel-heading">
                  	 <i class="fa fa-comments fa-fw"></i> Reply
                  	 	<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
                  	 </div>
                  	
                  	<!-- /.pannel-heading -->
                  	<div class="panel-body">
                  		<ul class="chat">
                  		<!-- start reply -->
                  		<li class="left clearfix" data-rno='12'>
                  			<div>
                  				<div class="header">
                  					<strong class="primary-font">user00</strong>
                  					<small class="pull-right text-muted">2018-01-01 13:13</small>
                  				</div>
                  				<p>Good job!</p>
                  			</div>
                  			</li>
                  			<!-- end reply -->
                  		</ul>
                  		<!-- end ul -->
                  	</div>
                  	<!-- /.panel.chat-panel -->
                  	</div>
                  </div>
                  <!-- endrow -->
                 </div>
                  

			 <!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			   aria-labelledby="myModalLabel" aria-hidden="true">
			   <div class="modal-dialog">
			      <div class="modal-content">
			         <div class="modal-header">
			            <button type="button" class="close" data-dismiss="modal"
			               aria-hidden="true">&times;</button>
			            <h4 class="modal-title" id="myModalLabel">Reply Modal</h4>
			         </div>
			         <div class="modal-body">
			            <div class="form-group">
			               <label>Reply</label>
			               <input class="form-control" name="reply" value='New Reply!!!'>
			            </div>
			            <div class="form-group">
			               <label>Replyer</label>
			               <input class="form-control" name="replyer" value='New Replyer!!!'>
			            </div>
			            <div class="form-group">
			               <label>Reply Date</label>
			               <input class="form-control" name="replyDate" value=''>
			            </div>
			         </div>
			         <div class="modal-footer">
			            <button id = 'modalModBtn' type="button" class="btn btn-warning"> Modify </button>
			            <button id = 'modalRemoveBtn' type="button" class="btn btn-danger"> Remove </button>
			            <button id = 'modalRegisterBtn' type="button" class="btn btn-primary"> Register</button>
			            <button id = 'modalCloseBtn' type="button" class="btn btn-default"> Close </button>
			            
			         </div>
			      </div>
			      <!-- /.modal-content -->
			   </div>
			   <!-- /.modal-dialog -->
			</div>
                  
                  
 <%@ include file="../includes/footer.jsp" %>
 <script type="text/javascript" src="/resources/js/reply.js"></script>
 <script>
 $(document).ready(function(){
		console.log("replyService"+replyService);
	});

 //console.log("===========");
 //console.log("JSTEST");
 
 var bnoValue='<c:out value="${board.bno}" />';
 var replyUL = $(".chat");

 showList(1);
 function showList(page){
	 replyService.getList({bno:bnoValue, page:page||1}, function(list){
		 var str="";
		 if(list == null || list.length == 0){
			 replyUL.html("");
			 
			 return;
		 }
		 for(var i=0, len=list.length || 0; i<len ; i++){
			 str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
			 str += " <div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
			 str += " <small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
			 str += "<p>"+list[i].reply+"</p></div></li>";
		 }
		 replyUL.html(str);
	 });//end function
 }//end showList
 
	 var modal = $(".modal");
	 var modalInputReply = modal.find("input[name='reply']");
	 var modalInputReplyer = modal.find("input[name='replyer']");
	 var modalInputReplyDate = modal.find("input[name='replyDate']");
	 
	 var modalModBtn = $("#modalModBtn");
	 var modalRemoveBtn = $("#modalRemoveBtn");
	 var modalRegisterBtn = $("#modalRegisterBtn");
	 var modalCloseBtn = $("#modalCloseBtn");
	 
	 $("#addReplyBtn").on("click" , function(e){
	    modal.find("input").val("");
	    modalInputReplyDate.closest("div").hide();
	    modal.find("button[id != 'modalCloseBtn']").hide();
	    
	    modalRegisterBtn.show();
	    
	    $(".modal").modal("show");
	 });
	 
	 modalRegisterBtn.on("click",function(e){
		 var reply={
				 reply:modalInputReply.val(),
				 replyer:modalInputReplyer.val(),
				 bno:bnoValue
		 };
		 replyService.add(reply, function(result){
			 alert(result);
			 modal.find("input").val("");
			 modal.modal("hide");
		 })
	 });
	 
	 modalCloseBtn.on("click",function(e){
		 modal.modal("hide");
	 })

	//댓글조회 클릭이벤트
	 $(".chat").on("click", "li", function(e){
		 var rno = $(this).data("rno"); //this -> li
		 
		 replyService.get(rno, function(reply){
			modalInputReply.val(reply.reply);
		 	modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
		 	modal.data("rno", reply.rno);
		 	
		 	modal.find("button[id != 'modalCloseBtn']").hide();
			modalModBtn.show();
		 	modalRemoveBtn.show();
		 	
		 	$(".modal").modal("show");
		 });
		 
		 console.log(rno);
	 });
 
	 //수정버튼
	 modalModBtn.on("click", function(e){
		 var reply={rno:modal.data("rno"), reply:modalInputReply.val()};
		 replyService.update(reply, function(result){
			alert(result);
		 	modal.modal("hide");
		 	showList(1);
		 })
	 })
	 
	 //삭제
	 modalRemoveBtn.on("click", function(e){
		 var rno = modal.data("rno");
		 replyService.remove(rno, function(result){
			alert(result);
			modal.modal("hide");
			showList(1);
		 })
	 })
 
 //replyService.getList({bno:bnoValue, page:1}, function(list){
//	 for(var i=0, len = list.length||0; i < len; i++){
//		 		 console.log(list[i]);
//	 }
//});
 </script>
 
 <script>
//replyService.add(
//		 {reply:"JS Test", replyer:"tester", bno:bnoValue},
//		 function(result){
//		 alert("RESULT: " + result);
//		 }
//	);
</script>
 <script>
//replyService.remove(27, function(count){
//	console.log("count"+count);
//	if(count === "success"){
//		alert("REMOVED");
//	}
//	}, function(err){
//		alert('ERROR');
//	});
</script>

<script>
//replyService.update({
//	rno : 23,
//	bno : bnoValue,
//	reply : "Modify Reply.."
//}, function(result){
//	alert("수정완료");
//});
</script>


<script>
//replyService.get(23, function(data){
//	console.log(data);
//})
</script> 
 <script>
 
$(document).ready(function(){
	 var operForm = $("#operForm");
$("button[data-oper='modify']").on("click", function(e){
	operForm.attr("action","/board/modify").submit();
});

$("button[data-oper='list']").on("click", function(e){
	operForm.find("#bno").remove();
	operForm.attr("action","/board/list");
	operForm.submit();
})
 })
 </script>
