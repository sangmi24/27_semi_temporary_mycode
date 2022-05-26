<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">
    
    <title>공지사항</title>
    <style>
     div{
          box-sizing: border-box;
         /*  border: 1px solid red; */
          height : 200px;
      }
      
      body{
        font-family: "Sofia", sans-serif;
       }
     
       /* footer상세 영역 */
        .footer>table{
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

    </style>
</head>
   <body>

     <!-- <hr style="border: solid 0.5px rgba(73, 71, 71, 0.1)"> -->
       <!-- 하단(푸터)정렬 -->
       <div class="footer">
        <table>
            <tr>
               <td><hr style="border: solid 0.5px rgba(73, 71, 71, 0.1); width: 1000px; "></td>  
            </tr>
            <tr>
                <td id="ft1">
                    @content by all right
                  
                </td>
                
            </tr>
          
        </table>
       </div>
  
</body>
</html>