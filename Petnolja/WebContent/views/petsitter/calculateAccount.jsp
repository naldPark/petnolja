<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.petnolja.petsitter.model.vo.Account, java.util.ArrayList" %>
<% ArrayList<Account> list = (ArrayList<Account>)request.getAttribute("list"); %>

  <!DOCTYPE html>
  <html>
  
  
<head>

    <style>
      .container {
        width: 1000px;
        margin: auto;
      }

      .middle-middle-1 {
        width: 1000px;
        height: 70px;
        background-color: #E1F0FA;
      }

      .account-list{
          width: 1000px;
          text-align: center;
          font-size: 14px;
          }

      .account-list>thead>tr {
        width: 100%;
        height: 70px;
        background-color: #E1F0FA;
      }
      .account-list td {border-bottom : 1px lightgrey solid;}



      .btn-sm{font-size: 12px !important;}


      #mark{
          background-color: lightseagreen;
          color: white;
          border: lightseagreen solid 1px;
          padding: 6px;
          border-radius: 30px;
          font-size: 13px;
      }
      
       .form-control{font-size: 13px !important;}

	
    </style>
    
    <script>
    </script>
  </head>

  <body>
      <%@ include file="../common/menubar.jsp" %>
      <div class="container">
       <br>
       <span style="font-size: 30px; font-weight:bold;">정산 계좌 관리</span><br><br>
       <span style="font-size: 15px; font-weight:bold;">정산 계좌는 최대 5개까지 등록 가능합니다.
       <span style="float:right; margin-right: 200px;">
       
       		<% if(list.size() < 5) {%>
       			<button id="addAcc" type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#AccModal">계좌등록</button>
       		<% } %>
       		
			  <!-- The Modal -->
			        
			  <div class="modal fade" id="AccModal">
			        <form  action="<%=contextPath %>/addAcc.sit" method="post">
			    <div class="modal-dialog modal-dialog-centered">
			      <div class="modal-content">
			      
			        <!-- Modal Header -->
			        <div class="modal-header">
			          <h6 class="modal-title">신규 계좌 등록</h6>
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			        </div>
			        
			        <!-- Modal body -->
			        <div class="modal-body">
	      		        <table id="insertAcc" align="center">
				            <tr>
				                <td><label class="word">은행</label></td>
				            </tr>
				            <tr>
				                <td>
				                    <select class="form-control" name="accBank" style="width: 300px;" required>
				                        <option value="국민">국민</option>
				                        <option value="신한">신한은행</option>
				                        <option value="하나">하나</option>
				                        <option value="우리">우리</option>
				                        <option value="기업">기업</option>
				                        <option value="농협">농협</option>
				                        <option value="수협">수협</option>
				                        <option value="카카오">카카오</option>
				                    </select>
				                </td>
				            </tr>
				            <tr>
				                <td><label class="word">계좌번호</label></td>
				            </tr>
				            <tr>
				                <td><input name="accNum" class="form-control" type="text" placeholder="숫자만 입력" style="width: 300px;" required></td>
				            </tr>
				        </table>
			        </div>
			        <!-- Modal footer -->
			        <div class="modal-footer">
			          <button type="submit" class="btn btn-warning btn-sm">등록하기</button>
			        </div>
			      </div>
			    </div>
			        </form>
			  </div>
       		
       </span>
    </span>
       
        
        <!-- MIDDLE -->
        <div class="middle">

            <table class="account-list">
                <thead >
                    <tr>
                        <th style="width: 15%;">은행</th>
                        <th style="width: 35%;">계좌번호</th>
                        <th style="width: 10%;"></th>
                        <th style="width: 30%;">관리</th>
                    </tr>
                </thead>
                <br>
                <tbody>
                
                <%if(list.isEmpty()) { %>
                	<tr>
                		<td colspan="5">등록된 계좌가 존재하지 않습니다.</td>
                	</tr>
                <% } else { %>
                	<%for(Account a : list) { %>
	                    <tr style="height: 70px;">
	                        <td><%=a.getAccBank() %></td>
	                        <td><%=a.getAccNumber() %> </td>
	                        <td>
	                        <% if(a.getAccRepresent().equals("Y")) { %>
		                        <label id="mark">대표계좌</label>
	                        <% } %>
	                        </td>
	                        <td>
	                        	<input type="hidden" value="<%= a.getAccNo()%>">
	                            <button class="btn btn-primary btn-sm representAcc">대표계좌설정</button>
	                            <button class="btn btn-danger btn-sm deleteAcc">삭제</button>
	                        </td>
	                    </tr>                	
                	<% } %>
                <% } %>
                

                </tbody>
            </table>
        </div>
        <br><br><br><br><br><br><br><br>

      </div><br>
      <%@ include file="../common/footer.jsp" %>
      
  </body>
  
  <script>
  		$(".deleteAcc").on("click", function(){
			if(confirm("계좌를 삭제하시겠습니까?")){
			  				
			  		var accno = $(this).siblings().eq(0).val();
			  		
			  		$.ajax({
			  			url:"deleteAcc.sit",
			  			type:"post",
			  			data:{accno:accno},
			  			success:function(result){
			  				if(result > 0){
				  				alert("계좌가 삭제되었습니다.");
				  				location.reload();
			  				} else {
			  					alert("계좌 삭제에 실패했습니다.");
			  				}
			  			}, error:function(){
			  				console.log("계좌삭제 ajax 통신 실패");
			  			}
			  		});
			  		
			  	}
  		});
  		
  		$(".representAcc").on("click", function(){
  			
  			if(confirm("선택한 계좌를 대표계좌로 지정하시겠습니까?")){
				var accno = $(this).siblings().eq(0).val();
				
		  		$.ajax({
		  			url:"representAcc.sit",
		  			type:"post",
		  			data:{accno:accno},
		  			success:function(result){
		  				if(result > 0){
			  				alert("대표계좌로 설정되었습니다.");
			  				location.reload();
		  				} else {
		  					alert("대표계좌 설정에 실패했습니다.");
		  				}
		  			}, error:function(){
		  				console.log("대표계좌 등록 ajax 통신 실패");
		  			}
		  		});
  			}
  		});
  		
  		
  	
  
  </script>
  
  
  
  </html>
  
  
  
  
  
  
  
  
  
  
  