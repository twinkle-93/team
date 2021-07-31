<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	
	<!-- 21/07/14 관리자 권한 -->
		
        <c:choose>
			<c:when test="${empty login && empty admin}">
				<!-- 로그인/관리자 로그인 둘다 안된 상태 -->
				<li>
					<a href="/member/insert"><i class="fas fa-sign-in-alt"></i>
					회원가입
					</a>
				</li>
				
				<li>
					<a href="/member/loginGet"><i class="fas fa-sign-in-alt"></i>
					로그인
					</a>
				</li>
				
				<li>
					<a href="/admin/loginGet"><i class="fas fa-sign-in-alt"></i>
					관리자 로그인
					</a>
				</li>
				
			</c:when>
			
			<c:otherwise>
				<!-- 로그인 상태 -->
				<c:if test="${!empty login}">
					<li>
						<a href="/member/read/${login.m_id}"><i class="glyphicon glyphicon-user"></i>
						${login.m_name}(일반회원)
						</a>
					</li>
					
					<li>
						<a href="/orders/listById/${login.m_id}"><i class="fas fa-clipboard-list"></i>
						주문목록
						</a>
					</li>
					
					<li>
						<a href="/cart/list"><i class="fas fa-shopping-cart"></i>
						장바구니
						</a>
					</li>
					
					<li>
						<a href="/member/logout"><i class="fas fa-sign-in-alt"></i>
						로그아웃
						</a>
					</li>
					
					
				</c:if>
				
		  		<!-- 로그인(관리자) 상태 -->
				<c:if test="${!empty admin}">
					<li>
						<a href="/goods/admin"><i class="fas fa-crown"></i> 
							${admin.a_name}모드
						</a>
					</li>
					
					<li>
						<a href="/admin/logout"><i class="fas fa-sign-in-alt"></i>
						로그아웃
						</a>
					</li>
					
				</c:if>
				
			</c:otherwise>
		</c:choose>
	
