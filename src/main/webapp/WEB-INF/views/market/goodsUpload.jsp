<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.inputArea { margin:10px 0; }
select { width:100px; }
label { display:inline-block; width:70px; padding:5px; }
label[for='gdsDes'] { display:block; }
input { width:150px; }
textarea#gdsDes { width:400px; height:180px; }
</style>
</head>
<body>
<form action="#" method="post">

<div class="inputArea"> 
 <label>1차 분류</label>
 <select name="g_category_large" class="category1">
  <option value="아우터">아우터</option>
  <option value="상의">상의<option>
  <option value="하의">하의</option>
 </select>

 <label>2차 분류</label>
 <select name="g_category_small" class="category2" name="cateCode">
  <option value="후드집업">후드집업</option>
  <option value="가디건">가디건</option>
  <option value="패딩">패딩</option>
 </select>
</div>

<div>
 <label for="g_name">상품명</label>
 <input type="text" id="g_name" name="g_name" />
</div>


<label>사이즈</label>
 <select name="g_size">
  <option value="XL">XL</option>
  <option value="L">L<option>
  <option value="M">M</option>
 </select>

<div>
 <label for="g_amount">상품수량</label>
 <input type="text" id="g_amount" name="g_amount" />
</div>

<div>
 <label for="g_price">상품가격</label>
 <input id="g_price" name="g_price"/>
</div>

<div>
 <label for="gdsDes">상품소개</label>
 <textarea rows="5" cols="50" id="g_content" name="g_content"></textarea>
</div>

<div>
 <button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
</div>

</form>

</body>
</html>