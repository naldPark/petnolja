<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.petnolja.pet.model.vo.PetLogList, com.petnolja.common.model.vo.PageInfo"%>
<%   
   ArrayList<PetLogList> list = (ArrayList<PetLogList>)request.getAttribute("dailyLog");
   String startDate = (String)request.getAttribute("startDate");
   String endDate = (String)request.getAttribute("endDate");
   PageInfo pi = (PageInfo)request.getAttribute("pi");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width:1000px;
        /* height:1100px; */
        font-family:'Noto Sans KR', sans-serif !important;
        position:relative;
        margin:auto;
        margin-top:50px;
        border:1px solid lightgray;
        padding:20px;
    }
    .dogImg{
            position: absolute;
            margin: auto;
            }
</style>
</head>
<body>
   <%@ include file="../common/menubar.jsp" %>

    <div class="outer">

            <br>

            <h3>반려동물일지</h3>
            조회기간
            <br><br>
            <!--조회기능-->
            <form action="<%=contextPath%>/dailyLogList.me" method="post">
                    <div class="input-group mb-3 input-group-sm">
                        <button type="button" class="btn btn-outline-info btn-sm searchBtn" id="findAll">전체</button>
                        <button type="button" class="btn btn-outline-info btn-sm searchBtn" id="1">최근1개월</button>
                        <button type="button" class="btn btn-outline-info btn-sm searchBtn" id="3">최근3개월</button>
                    <div class="input-group-prepend">
                        <span class="input-group-text" style="background-color: white; border: hidden; padding-right: 100px;"></span>
                    <span class="input-group-text">상세검색</span>
                    </div>   
                    <input type="date" class="form-control" id="startDate" name="startDate" style="height:36px;">
                    <span class="input-group-text" style="background-color: white; border: hidden;">~</span>
                    <input type="date" class="form-control" id="endDate" name="endDate" style="height:36px; margin-right: 20px;">
                    <input type="hidden" name="searchPage" required value="1" id="searchPage">
                    <button type="submit" id="searchSubmitBtn" class="btn btn-primary btn-sm">&nbsp;조회&nbsp;</button>
                </div> 
            </form>
        <script>
            $(document).ready(function(){
                
                <% if(startDate!=null && endDate!=null){ %>
                $("#startDate").val("<%=startDate%>");     
                $("#endDate").val("<%=endDate%>");  
        <%}%>
        })
            $(".searchBtn").click(function(){
    
                    var temp=0;
                    if($(this).attr('id')==$("#findAll").attr('id')){
                        $("#startDate").val(null);  
                        $("#endDate").val(null); 
                    } else{
                        var months =$(this).attr("id");
                        temp= new Date(new Date().setMonth(new Date().getMonth()-months));
                        // temp Date타입!!!! 
                        temp=temp.toISOString().substring(0,10);
                        $("#startDate").val(temp);          
                        $("#endDate").val(new Date().toISOString().substring(0,10));
                    }
                    $("#searchSubmitBtn").click();
                });   
            
        </script>
        <!-- 여기까지 검색조회기능 -->
        <hr>
        
        <!--예약된 리스트 글-->
        <% if(list.isEmpty()) { %>
            <br>조회된 리스트가 없습니다.<br><br><br>
            
            <% }else{ %>
                <% for(PetLogList pl : list) { %>
                <div style="margin-bottom:30px; padding-top:15px; background-color:rgb(224, 224, 255); height:230px;">
                    <div class="dogImg" style="padding-left:550px;"><img src="<%=contextPath%>/<%=pl.getPath() %>" style="height:180px; width:300px;"></div>
                    <div style="float:left; padding-left:70px;">
                        <br>
                        <h6><b><%=pl.getSitterName()%></b></h6><br>
                        <span><b><%=pl.getLogTime()%></b></span><br><br>
                        <span>
                            <%=pl.getLogContent() %> <br>
                        </span>
                    </div>
                </div>
            <% } %>
            <hr>

	<!-- 페이지 목록 시작 -->
             <ul class="pagination justify-content-center">
             <% if(pi.getCurrentPage() != 1){ %>
                <li class="page-item"><a class="page-link">&lt;</a></li>
           	 <% } %>
           	 <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
           	 
           		 <% if(p != pi.getCurrentPage()){ %>
               		 <li class="page-item"><a class="page-link"><%= p %></a></li>
	             <% }else { %>
	            	 <li class="page-item" ><a class="page-link" style="background:rgb(194, 227, 238)"><%= p %></a></li>
            	 <% } %>
             <% } %>
     

			<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
            	<li class="page-item"><a class="page-link"> &gt;</a></li>
			<% } %>
              </ul>
     <!-- 페이지 목록 끝 -->
       <% } %>
	
    </div>
      
<br>
	
  <script>
  	    $(".page-link").click(function(){
		      var page = $(this).text();
		      if(page =="<"){
		          $("#searchPage").val(<%=pi.getCurrentPage()-1%>);
		      } else if(page==" >"){
		        $("#searchPage").val(<%=pi.getCurrentPage()+1%>);
		      } else {
		        $("#searchPage").val(page);
		      }
		      $("#searchSubmitBtn").click();
	    })
   </script>
<% %>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>