<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="recipe_stpe_detail">
            <br>
            <div class="row">
               <div class="step_div" id="step_div1">
                  <p>Step1</p>
                  <div id="step_div_text1">
                  <textarea name="step_text[]" class="form-control step_cont" placeholder="예) 소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요."></textarea>
                  </div>
                  <div id="step_div_photo1">
                     <img class="stepDivPhoto">
                       <input type="file" name="fileUpload" class="fileUpload" id="fileUpload1" style="display: none;">
                    </div>
               </div>
               <br>
               <br>
               <div class="step_div" id="step_div2">   
                  <p>Step2</p>
                  <textarea name="step_text[]" id="step_div_text2" class="form-control step_cont" placeholder="예) 소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요."></textarea>
                  <img id="step_div_photo2" class="stepDivPhoto">
                  
                  <input type="file" name="fileUpload" class="fileUpload" id="fileUpload2" style="display: none;">
                <%
                $(function(){
                	  $('.stepDivPhoto').on('click', function(){
                		    $(this).siblings('.fileUpload').click();
                		  });

                		  $('.fileUpload').on('change', function(){
                		    var file = this.files[0];
                		    if(file){
                		      var reader = new FileReader();
                		      var img_tag = $(this).siblings('img');
                		      reader.onload = function(event){
                		        img_tag.attr('src', event.target.result);
                		        img_tag.show();
                		      };
                		      reader.readAsDataURL(file);
                		    }
                		  });
                		}); 
                		%>
               </div>
            </div>
         </div>
</body>
</html>