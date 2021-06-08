<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.petnolja.common.model.vo.PageInfo, com.petnolja.member.model.vo.Member, java.util.ArrayList" %>    
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="resources/images/adFavicon.ico">
<title>펫놀자?관리자!</title>

<style>
    .outer {
        border: gray solid 1px;
        border-radius: 7px;
        width: 1200px;
        height: 800px;
        margin: auto;
        background-color: rgb(248, 248, 248);
        padding:10px;
    }

    #member-list {
        text-align: center;
        border: 1px solid gray;
        width: 100%;
        background-color: white;
        font-size: 13px;
    }

    #search {
        float: left;
    }

    #buttons {
        float: right;
    }

    #buttons>button, #search>button { font-size: 14px;}

    #member-list button {
        width: 90px !important;
        height:30px !important; 
        font-size: 12px !important; 
        line-height: 10px !important;
        }

    #paging-area>button {
        width:30px;
        height:30px;
        font-size: 12px;
        text-align: center;
        
    }

    #member-list p{margin: 0;}

</style>

</head>

<body>

<%@ include file="adminMenubar.jsp" %>

<div class="outer" align="center">
    <div class="top" id="search" align="left">
        <input type="search" id="member-search-box" class="form-control-sm" placeholder="고객ID" style="font-size: 14px;">
    </div>
    <div class="top" id="buttons" align="right">
        <button class="btn btn-dark btn-sm" onclick="blockMember();">차단</button>
        <button class="btn btn-success btn-sm" onclick="unblockMember();">해제</button>
        
        <button class="btn btn-warning btn-sm" onclick="deleteMember();">삭제</button>
    </div>

    <br><br>
    <table class="table" id="member-list">
        <thead>
            <tr class="table-info">
                <th width="60px">선택</th>
                <th width="90px">고객번호</th>
                <th width="100px">ID</th>
                <th width="80px">고객명</th>
                <th width="130px">전화번호</th>
                <th width="170px">이메일</th>
                <th width="330px">주소</th>
                <th width="120px">반려견정보</th>
                <th width="100px">블랙리스트</th>
            </tr>
        </thead>
        <tbody>
        
        <% if(list.isEmpty()){ %>
        	<tr>
        		<td colspan="9">회원이 존재하지 않습니다.</td>
        	</tr>
        <% } else { %>
        
        	<% for(Member m : list) { %>
        
            <tr>
                <td><input type="checkbox"></td>
                <td><%= m.getMemNo() %></td>
                <td>
                    <p class="rowColumn" contenteditable="false" data-default="<%= m.getMemId()%>"><%=m.getMemId()%></p>
                </td>
                <td>
                    <p class="rowColumn" contenteditable="false" data-default="<%=m.getMemName()%>"><%=m.getMemName()%></p>
                </td>
                <td>
                    <p class="rowColumn" contenteditable="false" data-default="<%=m.getMemTel()%>"><%=m.getMemTel()%></p>
                </td>
                <td>
                    <p class="rowColumn" contenteditable="false" data-default="<%=m.getMemEmail()%>"><%=m.getMemEmail()%></p>
                </td>
                <td>
                    <p class="rowColumn" contenteditable="false" data-default="<%=m.getMemAddress()%>"><%=m.getMemAddress()%></p>
                </td>
                <td align="center"><button class="btn btn-primary petDetail">상세조회</button></td>
                <td><%=m.getMemBlock()%></td>
            </tr>
        	<% } %>
        <% } %>
        
        </tbody>
    </table>

    <!-- 페이징바 -->
                    
    <div id="paging-area">
    
    
    	<% if(currentPage != 1){ %>
        <button onclick="location.href='<%=contextPath %>/memlist.ad?currentPage=<%=currentPage - 1 %>';" class="btn btn-outline-primary btn-sm">&lt;</button>
    	<% } %>
    	<% for(int p=startPage; p<endPage; p++) { %>
    		
    		<% if(p != currentPage) { %>
	    		<button onclick="location.href='<%=contextPath %>/memlist.ad?currentPage=<%=p %>';" class="btn btn-outline-primary btn-sm"><%= p %></button>
    			
    		<% } else { %>
    			<button disabled><%=p %></button>
    		<% } %>
    	<% } %>
        
        <% if(currentPage != maxPage && !list.isEmpty()) { %>
        	<button onclick="location.href='<%=contextPath%>/memlist.ad?currentPage=<%=currentPage + 1 %>';" class="btn btn-outline-primary btn-sm"> &gt; </button>
        <% } %>
    </div>
</div>

<br><br><br><br><br>

    <script>
    
    	//블랙리스트 등록 (방법1. for문 방법)
    	function blockMember(){
    		//console.log("되나?");

    		var memNoArr = [];
    		$("input[type=checkbox]:checked").each(function(){
    		    memNoArr.push($(this).parent().siblings().eq(0).text());
    		});
    		
    	    var memNoList = memNoArr.join(",");

    		
    		//console.log(memNoArr);  체크된 회원 번호
    		
			if(confirm("선택한 회원을 차단하시겠습니까?")){
				
				$.ajax({
					url:"memblock.ad",
					data:{memNoList:memNoList},
					type:"post",
					success:function(result){
						
						if(result == memNoArr.length){
							alert("성공적으로 처리되었습니다.");
						
							$("input[type=checkbox]:checked").each(function(){
								$(this).parent().siblings().eq(7).html('Y');
								$(":checkbox").prop("checked", false);
							});
						} else {
							alert("회원 차단에 실패했습니다.");
						}
						
					}, error:function(){
						console.log("블랙리스트 등록 ajax통신 실패");
					}
				});
			} else {
				$(":checkbox").prop("checked", false);
			} 		
    	}
    	
    	
    	// 블랙리스트 해제 (방법2. 동적 sql방법)
    	function unblockMember(){

    		var memNoArr = [];
    		$("input[type=checkbox]:checked").each(function(){
    		    memNoArr.push($(this).parent().siblings().eq(0).text());
    		});
    		
    	    var memNoList = memNoArr.join(",");
    		
			if(confirm("선택한 회원의 차단을 해제하시겠습니까?")){
				
				$.ajax({
					url:"memunblock.ad",
					data:{memNoList:memNoList},
					type:"post",
					success:function(result){
						
						if(result == memNoArr.length){
							alert("성공적으로 처리되었습니다.");
						
							$("input[type=checkbox]:checked").each(function(){
								$(this).parent().siblings().eq(7).html('N');
								$(":checkbox").prop("checked", false);
							});
						} else {
							alert("회원 차단 해제를 실패했습니다.");
						}
						
					}, error:function(){
						console.log("블랙리스트 해제 ajax통신 실패");
					}
				});
			} else {
				$(":checkbox").prop("checked", false);
			} 		
    	}

    	// 회원 삭제
    	function deleteMember(){

    		var memNoArr = [];
    		$("input[type=checkbox]:checked").each(function(){
    		    memNoArr.push($(this).parent().siblings().eq(0).text());
    		});
    		
    	    var memNoList = memNoArr.join(",");
    		
			if(confirm("선택한 회원을 삭제하시겠습니까?")){
				
				$.ajax({
					url:"memdelete.ad",
					data:{memNoList:memNoList},
					type:"post",
					success:function(result){
						if(result == memNoArr.length){
							alert("성공적으로 처리되었습니다.");
							location.reload();
						} else {
							alert("회원 삭제에 실패했습니다.");
						}
						
					}, error:function(){
						console.log("블랙리스트 해제 ajax통신 실패");
					}
				});
			} else {
				$(":checkbox").prop("checked", false);
			} 		
    	}

    	
    	// 펫 상세정보 보기
    	$(".petDetail").on("click", function(){
    		
    		var mno = $(this).parent().siblings().eq(1).text();
    		//var mname = $(this).parent().siblings().eq(3).children().text();
    		    		
    		location.href = "<%=contextPath%>/mempet.ad?mno=" + mno;
    	});
    	
    </script>


<script type="text/javascript">



    // @breif contenteditable 속성을 가진경우

    contents = document.getElementsByClassName("rowColumn");

    document.addEventListener("DOMContentLoaded", function () {


        // @breif rowColumn 클래스의 갯수 만큼 반복문을 실행한다.
        Array.from(contents).forEach(function (content) {

            // @breif 마우스로 해당영역을 더블클릭 한경우
            content.addEventListener("dblclick", function (event) {



                // @breif 전체 테이블 컬럼( td > p )에서 현재 사용중인 값의 존재여부를 확인한다.
                Array.from(contents).forEach(function (defaultVal) {

                    // @details 저장하지 않은 내용이라고 판단하여 data 태그의 기본값으로 되돌린다.
                    defaultVal.textContent = defaultVal.dataset.default;

                    // @breif 수정 불가 상태로 되돌린다.

                    defaultVal.contentEditable = false;

                    defaultVal.style.border = "0px";

                });



                if (content.isContentEditable == false) {

                    // @details 편집 가능 상태로 변경
                    content.contentEditable = true;
                    // @details CSS 효과 추가
                    content.style.border = "1px solid #FFB6C1";
                    // @details 포커스 지정
                    content.focus();

                }

            });



            // @breif 키보드 입력이 방생한 경우 실행
            content.addEventListener("keypress", function (event) {


                // @breif Enter키 입력시 실행
                if (event.keyCode == "13") {

                    if (confirm("저장하시겠습니까?")) {


                        // @details 입력된 값이 빈값( null )인지 체크한다.
                        if (

                            content.textContent == ""
                            || content.textContent == null
                            || content.textContent == undefined
                            || (content.textContent != null

                                && typeof content.textContent == "object"
                                && !Object.keys(content.textContent).length == "")) {


                            // @details 내용이 존재하지 않다면 data 태그의 기본값으로 되돌린다.
                            content.textContent = content.dataset.default;

                        } else {



                            // @details 내용의 수정이 완료되었다면 data 태그의 기본값도 바꿔준다.
                            content.dataset.default = content.textContent;

                        }

                        // @breif 수정 불가 상태로 되돌린다.
                        content.contentEditable = false;

                        content.style.border = "0px";

                        var memNo = $(this).parent().siblings().eq(1).text();
                        var updateValue = content.dataset.default;
                        var updateCol = "";

                        switch ($(this).parent().index()) {
                            case 2: updateCol = "MEM_ID"; break;
                            case 3: updateCol = "MEM_NAME"; break;
                            case 4: updateCol = "MEM_TEL"; break;
                            case 5: updateCol = "MEM_EMAIL"; break;
                            case 6: updateCol = "MEM_ADDRESS"; break;
                        }

						// controller에 넘기는 값들 확인용
                        //console.log(memNo);         // 변경이 발생한 고객의 고객번호
                        //console.log(updateValue);   // 변경된 값
                        //console.log(updateCol);     // 변경이 발생한 컬럼

                        //location.href = "update.me?mno="+memNo+"&"+updateCol+"="+updateValue;
                        // 이렇게 서블릿 호출해서 값 넘기면 되지 않을까? -- ajax쓰라고 하심ㅎ 공부해야디..
                        // 화면 우측 상단 저장 버튼은 없애야 함. (-- 없앴음)
                        // 근데 엔터키 두개 중에서 하나만 먹힘. 왜그럴까,,,? -- 보람샘이 코드상 문제 없다고 하셨음! 그냥 진행ㄱㄱ
                        
                        
                        // 회원정보 수정 함수
                    	/*function adminUpdateMember(){*/
                        	
                        	$.ajax({
                        		url:"memupdate.ad",
                        		data:{
                        			memNo:memNo,
                        			updateCol:updateCol,
                        			updateVal:updateValue
                        		},
                        		type:"post",
                        		success:function(result){
                        			if(result > 0){
                        				
                        				var val = '<td><p class="rowColumn" contenteditable="false" data-default="' + updateValue + '">' + updateValue + '</p></td>'
                        				
                        				$(this).parent().html(val);
                        			}
                        			
                        		}, error:function(){
                        			console.log("회원정보 수정 ajax통신 실패");
                        		}
                        	});
                        
                    	
                    	// 일케하면 안됨*^ㅁ^*
                    	/*}
                        
                        adminUpdateMeber();
                        
                       // 갱신된 회원정보 조회하는 함수
                        /*function selectNewMemList(){
                        	
                        	$.ajax({
                        		url:"newmemlist.ad",
                        		type:"post",
                        		success:function(list){
                        			
                        			var result = "";
                        			
                        			for(var i in list){
                        				result += '<tr>'
		                                        + '<td><input type="checkbox"></td>'
		                                        + '<td>' + list[i].memNo + '</td>'
		                                        + '<td><p class="rowColumn" contenteditable="false" data-default="' + list[i].memId + '">' + list[i].memId + '</p></td>'
		                                        + '<td><p class="rowColumn" contenteditable="false" data-default="' + list[i].memName + '">' + list[i].memName + '</p></td>'
		                                        + '<td><p class="rowColumn" contenteditable="false" data-default="' + list[i].memTel + '">' + list[i].memTel + '</p></td>'
		                                        + '<td><p class="rowColumn" contenteditable="false" data-default="' + list[i].memEmail + '">' + list[i].memEmail + '</p></td>'
		                                        + '<td><p class="rowColumn" contenteditable="false" data-default="' + list[i].memAddress + '">' + list[i].memAddress + '</p></td>'
		                                        + '<td align="center"><button class="btn btn-primary">상세조회</button></td>'
		                                        + '<td>' + list[i].memBlock + '</td>'
		                                        + '</tr>';
                        			}
                        			$("#member-list tbody").html(result);
                        		}, error:function(){
                        			console.log("ajax통신 실패");
                        		}
                        		
                        	})
                        }*/
                        

                    } else {
                        content.textContent = content.dataset.default;
                        content.contentEditable = false;
                        content.style.border = "0px";
                    }
                }
            });
        });
    });
    

    // 아이디로 검색
    $(document).ready(function () {
        $("#member-search-box").on("keyup", function () {
        	
        	if(event.keyCode == "13") {
        		var keyword = $(this).val().toLowerCase();
        		location.href = "<%=contextPath%>/memlist.ad?currentPage=1&key=" + keyword;
        	}
        });
    });
</script>


</body>
</html>