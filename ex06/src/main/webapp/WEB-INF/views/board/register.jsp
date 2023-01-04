<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
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
            
<%@ include file="../includes/footer.jsp" %>