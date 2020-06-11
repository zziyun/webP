<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- C 태그로 반복문 조건문 등을 사용 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 문자열, 날짜 등의 정보를 처리하기 위한 태그 -->
<!DOCTYPE html>
<%@ include file="../includes/header.jsp" %>

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Tables</h1>
          <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <!-- <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6> -->
            	<div class="panel-heading">Board List Page
					<button id='regBtn' type="button" class="btn btn-xs pullright" style=“float:right”>Register New Board</button>
				</div>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>#번호</th>
                      <th>제목</th>
                      <th>작성자</th>
                      <th>작성일</th>
                      <th>수정일</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${list}" var="board"> <!-- foreach는 loop -->
                	<tr>
                		<td> <c:out value="${board.bno}" /> </td>
                		<td> <c:out value="${board.title}" /> </td>
                		<td> <c:out value="${board.writer}" /> </td>
                		<td> <fmt:formatDate pattern="yyyy-MM-dd" value ="${board.regdate}" /> </td>
                		<td> <fmt:formatDate pattern="yyyy-MM-dd" value ="${board.updateDate}" /> </td>
                	</tr>
                	</c:forEach>
                  </tbody>
                </table>
                <!-- Modal 추가 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog“
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save changes</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->
        
<!-- 자바 스크립트 코드가 들어갈 영역임 -->
<script type="text/javascript">
	$(document).ready(function() {
		var result = '<c:out value="${result}"/>';
		//alert(result); // 자바 스크립트 문장
		
		checkModal(result); // 함수 호출
	
		// 함수 정의
		function checkModal(result) {
			if(result === '') { // result 값이 없으면
				return; // 모달 창을 띄우지 말고 리턴해라.
			}
			if(parseInt(result)>0) { // 생성된 게시물 번호가 있으면
				// class 속성이 modal-body인 엘레먼트를 선택하여 내용을 설정해라 
				$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
			}
			// id 속성 값이 myModal인 엘레먼트를 선택해서, 모달창을 show하라.
			$("#myModal").modal("show");
		}
		
		// 게시물 등록 버튼이 눌러지면, 등록 페이지로 이동해라.
		$("#regBtn").on("click", function() { // 이벤트 핸들러
			// 현재 웹페이지의 주소를 설정함
			self.location = "/board/register";
		});
	});
</script>

<%@ include file="../includes/footer.jsp" %>