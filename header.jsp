<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.na.user.member.model.vo.Member" %>    
<% 
   // context root 값 알아오기
   String contextPath = request.getContextPath();
   // 로그인한 사용자의 정보 뽑기 (세션으로 부터)
   Member loginUser = (Member)session.getAttribute("loginUser");
   // 세션으로 부터 알람메세지 뽑아내기 
   String alertMsg = (String)session.getAttribute("alertMsg");
%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NUTRIENTS ALMIGHTY</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">

    <style>
      div{
          box-sizing: border-box;
          /* border: 1px solid red; */
          /*가이드라인 */
      }

      /* 크게 네가지 영역 */
       /* .wrap>div{ width: 100%; } */

       #header,#footer{
            height: 205px;
            width:1000px;
            margin:auto;
        }
       #navigator { height: 41px;  font-family: 'Noto Sans KR', sans-serif; width: 1000px; margin:auto;}

       /* 각각의 상세 영역 */
       #header>div{
           height: 100%;
           float: left;
       }

       #header_1{ width: 15%;}
       #header_2{ width: 70%;}
       #header_3{ width: 15%;}
       

       #footer{
          width: 1000px;
          height: 200px;  
      }
       
       #icon1{height: 20%;}
       #icon2{height: 20%;}
       #icon3{height: 0%;}

      /*1.로고 스타일*/
      #header_2{
          position: relative;
      }
      #logo{
          margin: auto;
          position: absolute;
          top: 0px;
          bottom: 0px;
          left: 0px;    
          right: 0px;
      }
        /*3.메뉴바 */
         /* #navi에 대한 스타일 적용 */
         #navi{
          /* border: 1px solid blue; */
           list-style-type: none;
           text-align: center;
           margin: auto; 
           padding: 0px;
           background-color: rgba(24,189,234, 0.5);
           height: 100%;
       }
       /* 메인메뉴에 대한 스타일 적용*/
       #navi>li {
          /* border: 1px solid green; */
           display:inline-block;
           width: 15%;
           height: 100%;
           text-align: center;
       }

       /* 공통적인 메뉴 글씨에 대해서 스타일 적용 */
       #navi a { /*a태그는 인라인 요소 */
          /*  border: 1px solid blue; */
           text-decoration: none;
           color: white;
           font-size: 16px;
           font-weight: 900;
           width: 100%;
           height: 100%;
           display : block;
           line-height: 35px;   
       }
       #navi a:hover{
           color: steelblue;
           font-size: 18px;
           transform : scale(1); /* 1배 확대 */
       }
       /* 서브메뉴에 대한 스타일 적용*/
       #navi>li>ul{
           list-style-type: none;
           padding: 0px;
           display: none; 
       }
       #navi>li>a:hover+ul {
           display: block; 
       }
       #navi>li>ul:hover{
           display: block; 
       }

       /* 서브메뉴 글씨 조절 */
       #navi>li>ul a { font-size: 10px; }
       #navi>li>ul a:hover{ font-size: 13px;} 

       /*오른쪽에 장바구니, 로그인 아이콘*/
       #icon1, #icon2{
           width: 19%;
           height: 14%;
           display: inline-block;
           float: right;
           margin-top: 20px;
           margin-right: 15px;
       }
       #cart_icon>img, #login_icon>img{
           width: 100%;
           height: 100%;
           float: right;
       }

        /* footer상세 영역 */
     #footer>table{
        margin: auto;
        margin-top: 5px;
     }
      #ft1 {
          float: left;
          margin-right: 320px;
      }
      #ft1>a{
        padding: 0px;
        margin: 0px;
      }
      #ft2 {
        float: right; 
      }
      #ft3 {
        font-family: 'Noto Sans KR', sans-serif;
          float: left;
          font-size: 10px;
      }
      #ft4 {
         font-family: 'Noto Sans KR', sans-serif;
          font-size: 10px;
          text-align: right;
          float: right; 
          margin-left: auto;
      }
      #ft1>a, #ft2>a {
        font-family: 'Noto Sans KR', sans-serif;
          text-decoration: none;
          color: black;
          font-size: 110%;
          font-weight: 600;
          margin: 15px;     
          vertical-align: middle; 
      }

      #ft5{
        font-size: 10px;
        font-family: 'Noto Sans KR', sans-serif;
        color: rgba(73, 71, 71, 0.5);
      }

      #ft5{
        text-align: right;
      }




    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<script>
      // script태그 내에서 스크립틀릿과 같은 jsp 요소들을 사용할 수 있다. 
		var msg = "<%=alertMsg%>"; // "성공적으로 로그인이 되었습니다." / "null"
		if(msg != "null") {
			alert(msg);
			// 알림창 띄우며 해당 세션의 해당 키-밸류를 지워줘야 연속해서 안뜬다.
			<% session.removeAttribute("alertMsg"); %>
		}
</script>
       <div id="header">
           <div id="header_1"></div>
           <div id="header_2">
            <a href="" target="_self">
                <img src="/na/resources/image/상호이미지.png" id="logo">
            </a>
           </div>
           <div id="header_3">
               <div id="icon1">
                    <a id="cart_icon" href="" target="">
                      <img src="/na/resources/image/장바구니.png">
                     </a>
                   </div>        
                <div id="icon2">
                <!-- 두가지 화면이 선택적으로 보여지게끔(로그인하고, 로그인안하고) -->
                   <% if (loginUser == null) { %> <!-- 로그인 전에 -->
                    <a id="login_icon" href="<%= contextPath %>/beforeLog.me" >
                        <img src="/na/resources/image/로그인.png">
                    </a>
                    <!--회원가입 페이지 이동  -->
                    
                    
                  <% } %> <!-- 로그인 성공후  else=>마이페이지, 로그아웃 -->
                  
                  
               </div>
               <div id="icon3"></div>
           </div>
       </div>
       <div id="navigator">
        <ul id="navi">
            <li><a href="">제품보기</a></li>
            <li><a href="">건강매거진</a></li>
            <li>
                <a href="">고객후기</a>
            </li>
            <li>
                <a href="">고객센터</a>
            </li>
        </ul>
       </div> 

    
    

</body>
</html>