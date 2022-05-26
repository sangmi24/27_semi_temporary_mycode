<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.na.user.review.model.vo.Review, com.na.template.model.vo.PageInfo"%>    
<%
   ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   
   
   // 페이징바 관련 변수
   int currentPage = pi.getCurrentPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage();
   int maxPage = pi.getMaxPage();
%>       
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
       /* content영역 */
       .content{
           /* border : 1px solid red; */
           width: 800px;
           height : 1000px;
           margin:auto;
       }
       .content_title{
           float:right;
           width:800px;
           height:50px;
           font-size: 20px;
           font-weight: 700;
           padding-left: 30px;
           margin-top: 20px;
         
           /* border:1px solid red; */
       }
        .content_detail{
            float:right;
            width:780px;
            height:600px;
            /* border:1px solid red; */

        }
        .cd_select{width:600px; height:60px;}
        .cd_select>div{
            display: inline-block;

        }
        .cd_select1{
            height:30px;
            width:100px;
        }
        .cd_select2{
            width:300px;
            height:25px;
        }
        .cd_select3{
            width:50px;
            height:30px;
            margin-top: 0px;
        }
        .cd_orderBy{ height:50px;}
        .cd_orderBy>a{
            text-decoration: none;
            color:black;
            font-size: 15px;
            font-weight: 700;
            
        }
        .cd_table{
            border-collapse: collapse;
            font-size: 18px;
            text-align: center;
        }
        .cd_table tr{border-bottom: 1px solid gray;}
        .cd_table_title{
            background-color: gainsboro;
        }
        .cd_button{
            float:right;
            width:50px;
            height:50px;
            margin-right: 70px;
            text-align: right;

        }
        .cd_button>input:hover{
            cursor:pointer;
            color: black;;
        }
        .cd_button>input{
            font-size: 20px;
            height: 30px;
            width:100px;
            background-color:rgba(24,189,234, 0.5);
            border:none;
            color: white;
            font-weight: 700;
            border-radius: 5px;

        }
        .cd_pagingBar{
            padding-top: 50px;
            margin: auto;
            text-align: center;
            width:500px;
            height:150px;
        }
        .cd_pagingBar>a{
            font-size: 20px;
            text-decoration: none;
            color:gray;
            background-color: gainsboro;
            display: inline-block;
            width:30px;
            height:30px;
        }
        .cd_pagingBar>a:hover{
            background-color:rgba(24,189,234, 0.5);
            color:white;   
        }

        /* 부트스트랩 테이블 */
        .table>thead>tr>th{
            text-align: center;
        }
        .table>tbody>tr td{
            border :1px solid white;
            text-align: center;
        }
        .table>tbody>tr:hover{
            background-color: lightgrey;
            cursor: pointer;
        }
</style>
</head>
<body>
<%@ include file="../common/header_admin.jsp" %>

       <div class="content">
           <div class="content_title">
                    후기 관리
                    <hr>
           </div>
            <div class="content_detail" >
                <div class="cd_orderBy" align="right">
                    <a href="">▼최신순</a>
                </div>
                <div class="cd_select" align="right"> 
                    <select class="cd_select1" name="category" id="">
                        <option name="category" value="작성자">작성자</option>
                        <option name="category" value="글제목">글제목</option>
                    </select>
                    <div><input class="cd_select2" type="text" placeholder="검색어를 입력하세요"></div>
                    <div> <button type="submit" class="cd_select3 btn btn-light btn-sm" style="opacity: 0.7; background-color: gray; color: white;">검색</button></div>
                </div>
                <table class="table table-hover" class="table">
                    <thead>
                        <tr class="cd_table_title">
                            <th width="100">글번호</th>
                            <th width="450">제목</th>
                            <th width="100">작성자</th>
                            <th width="150">작성일</th>
                        </tr>
                    </thead>
                    <tbody align="center" >
                    <% if(list.isEmpty()) { %>
			            <tr>
			              <td colspan="4">조회된 리스트가 없습니다.</td>
			            </tr>
			           <% } else { %>
			            <% for(Review r : list) {  %>
                        <tr>
                            
                            <td><%= r.getRevNo() %></td>
                            <td><%= r.getRevTitle() %></td>
                            <td><%= r.getUserId() %></td>
                            <td><%= r.getRevDate() %></td>
                        </tr>
                    <%}} %> 
                    </tbody>
                </table>
		      <script>
		         $(function(){
		             $(".table>tbody>tr").click(function(){
		                  location.href = "<%= contextPath %>/reviewadDetail.re?rno="+ $(this).children().eq(0).text();  
		             });
		         });   
		      </script>    
                <div id="page">
            
            <div id="pro_paging" class="page_nation" style="width:100%; margin:left; ">
                <ul class="pagination">
            <%if(currentPage==1){ %>
            <%}else{ %>
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/reviewadlist.re?currentPage=<%=currentPage - 1%>" style="color: black"><</a></li>
            <%} %>
			<%for(int p = startPage; p<=endPage; p++){ %>
				<%if(p!=currentPage){ %>
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/reviewadlist.re?currentPage=<%=p%>" style="color: black"><%=p %></a></li>
			<%} else {%>
                    <li class="page-item"><a class="page-link" href="" style="color: black"><%=p %></a></li>
				<%}} %>
            <%if(currentPage==maxPage){ %>
            <%}else{ %>				              			              
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/reviewadlist.re?currentPage=<%=currentPage + 1%>" style="color: black">></a></li>
            <%} %>
                    </ul>
            </div>
           
       </div>
<%@ include file="../common/footer.jsp" %>       
</body>
</html>