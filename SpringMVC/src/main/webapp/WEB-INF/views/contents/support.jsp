<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/include/header.jsp"/>
<div class="video-box">
    <video muted autoplay loop id="video-full-bg">
        <!--  <source src="/jhbbs/images/wingtra.mp4" type="video/mp4"> -->
    </video>
</div>
<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
            <div class="content-full-img01"></div>
            <div class="content-full-bg01-hidden">
                <section class="content">
                   <%@ include file="../include/content_header.jsp"%>
                    <article>
                        <h2>Support</h2>
                        <div class="lead">궁긍한 문의사항이 있으면 온라인 문의사항 게시판을 이용해 주세요</div>
                    </article>
                    <article>
                         <div class="row">
                            <div class="col-md-12">        
                              	<article>
			                        <div class="row">
			                            <div class="col-md-12">
			                            <div class="search-form">
			                                <dl>
			                                    <dt class="padding">지역선택</dt>
			                                    <dd>
			                                    	<select id="sido_code" name="sido_code">
														<option value="">선택해주세요</option>
													</select>
													<select id="sigoon_code" name="sigoon_code">
														<option value="">선택해주세요</option>
													</select>
													<select id="dong_code" name="dong_code">
														<option>선택해주세요</option>
													</select>
													<select id="lee_code" name="lee_code">
														<option>선택해주세요</option>
													</select>
												</dd>
			                                    <dt class="padding">기간선택</dt>
			                                    <dd>	
			                                    	<select id="year" name="year">
														<option value="">선택해주세요</option>
													</select>
													<select id="month" name="month">
														<option value="">선택해주세요</option>
													</select>
													<select id="day" name="day">
														<option value="">선택해주세요</option>
													</select>
													<!-- <input type="search" id="dealymd" name="dealymd" placeholder="ex)202201" onfocus="this.placeholder = ''" onblur="this.placeholder = 'ex)202201'" maxlength="6" oninput="numberMaxLength(this);" title="<spring:message code="button.search"/>" onKeyup="$(this).val($(this).val().replace(/[^0-9]/gi,''));"/> -->
													<input type="button" id="searchbtn" value="조회"/>
			                                    </dd>			                                    
			                                </dl>
			                            </div>
			                            </div>
			                        </div>
			                    </article>
                                <div class="articles">
                                    전체글 : <span>10</span> 개 | 공지글 : <span>5</span> | 현재페이지 : <span>1</span> | 총페이지 : <span>10</span>
                                </div>
                                <form>
                                    <fieldset>
                                        <legend>Board List Form</legend>
                                        <table summary="기본게시판 보여주고 있습니다." class="table">
                                            <caption>등록일 : 2017년08월24일 기준</caption>
                                            <colgroup>
                                                <col width="5%" />
                                                <col width="5%" />
                                                <col width="10%" />
                                                <col width="40%" />
                                                <col width="10%" />
                                                <col width="10%" />
                                                <col width="5%" />
                                                <col width="5%" />
                                                <col width="5%" />
                                                <col width="5%" />
                                            </colgroup>
                                            <thead>
                                                <tr class="tline">
                                                    <th scope="col"><label><input type="checkbox" id="allCheck" /></label></th>
                                                    <th scope="col">N</th>
                                                    <th scope="col">분류</th>
                                                    <th scope="col">제목</th>
                                                    <th scope="col">작성자</th>
                                                    <th scope="col">등록일</th>
                                                    <th scope="col">파일</th>
                                                    <th scope="col">추천</th>
                                                    <th scope="col">조회</th>
                                                    <th scope="col">D</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><label><input type="checkbox" name="check" /></label></td>
                                                    <td>1</td>
                                                    <td>일반</td>
                                                    <td class="text-left"><a href="./board_view.html">제목이 나오는 곳입니다. <span class="hit">HIT</span></a></td>
                                                    <td>작성자</td>
                                                    <td>2012-02-21</td>
                                                    <td>filecnt</td>
                                                    <td>vote</td>
                                                    <td>hit</td>
                                                    <td>D</td>
                                                </tr>
                                                <tr>
                                                    <td><label><input type="checkbox" name="check" /></label></td>
                                                    <td>1</td>
                                                    <td>일반</td>
                                                    <td class="text-left"><a href="./board_view.html">제목이 나오는 곳입니다. <span class="hit">HIT</span></a></td>
                                                    <td>작성자</td>
                                                    <td>2012-02-21</td>
                                                    <td>filecnt</td>
                                                    <td>vote</td>
                                                    <td>hit</td>
                                                    <td>D</td>
                                                </tr>
                                                <tr>
                                                    <td><label><input type="checkbox" name="check" /></label></td>
                                                    <td>1</td>
                                                    <td>일반</td>
                                                    <td class="text-left"><a href="./board_view.html">제목이 나오는 곳입니다. <span class="hit">HIT</span></a></td>
                                                    <td>작성자</td>
                                                    <td>2012-02-21</td>
                                                    <td>filecnt</td>
                                                    <td>vote</td>
                                                    <td>hit</td>
                                                    <td>D</td>
                                                </tr>
                                                <tr>
                                                    <td><label><input type="checkbox" name="check" /></label></td>
                                                    <td>1</td>
                                                    <td>일반</td>
                                                    <td class="text-left"><a href="./board_view.html">제목이 나오는 곳입니다. <span class="hit">HIT</span></a></td>
                                                    <td>작성자</td>
                                                    <td>2012-02-21</td>
                                                    <td>filecnt</td>
                                                    <td>vote</td>
                                                    <td>hit</td>
                                                    <td>D</td>
                                                </tr>
                                                <tr>
                                                    <td><label><input type="checkbox" name="check" /></label></td>
                                                    <td>1</td>
                                                    <td>일반</td>
                                                    <td class="text-left"><a href="./board_view.html">제목이 나오는 곳입니다. <span class="hit">HIT</span></a></td>
                                                    <td>작성자</td>
                                                    <td>2012-02-21</td>
                                                    <td>filecnt</td>
                                                    <td>vote</td>
                                                    <td>hit</td>
                                                    <td>D</td>
                                                </tr>
                                                <tr>
                                                    <td><label><input type="checkbox" name="check" /></label></td>
                                                    <td>1</td>
                                                    <td>일반</td>
                                                    <td class="text-left"><a href="./board_view.html">제목이 나오는 곳입니다. <span class="hit">HIT</span></a></td>
                                                    <td>작성자</td>
                                                    <td>2012-02-21</td>
                                                    <td>filecnt</td>
                                                    <td>vote</td>
                                                    <td>hit</td>
                                                    <td>D</td>
                                                </tr>
                                                <tr>
                                                    <td><label><input type="checkbox" name="check" /></label></td>
                                                    <td>1</td>
                                                    <td>일반</td>
                                                    <td class="text-left"><a href="./board_view.html">제목이 나오는 곳입니다. <span class="hit">HIT</span></a></td>
                                                    <td>작성자</td>
                                                    <td>2012-02-21</td>
                                                    <td>filecnt</td>
                                                    <td>vote</td>
                                                    <td>hit</td>
                                                    <td>D</td>
                                                </tr>
                                                <tr>
                                                    <td><label><input type="checkbox" name="check" /></label></td>
                                                    <td>1</td>
                                                    <td>일반</td>
                                                    <td class="text-left"><a href="./board_view.html">제목이 나오는 곳입니다. <span class="hit">HIT</span></a></td>
                                                    <td>작성자</td>
                                                    <td>2012-02-21</td>
                                                    <td>filecnt</td>
                                                    <td>vote</td>
                                                    <td>hit</td>
                                                    <td>D</td>
                                                </tr>
                                                <tr>
                                                    <td><label><input type="checkbox" name="check" /></label></td>
                                                    <td>1</td>
                                                    <td>일반</td>
                                                    <td class="text-left"><a href="./board_view.html">제목이 나오는 곳입니다. <span class="hit">HIT</span></a></td>
                                                    <td>작성자</td>
                                                    <td>2012-02-21</td>
                                                    <td>filecnt</td>
                                                    <td>vote</td>
                                                    <td>hit</td>
                                                    <td>D</td>
                                                </tr>
                                                <tr>
                                                    <td><label><input type="checkbox" name="check" /></label></td>
                                                    <td>1</td>
                                                    <td>일반</td>
                                                    <td class="text-left"><a href="./board_view.html">제목이 나오는 곳입니다. <span class="hit">HIT</span></a></td>
                                                    <td>작성자</td>
                                                    <td>2012-02-21</td>
                                                    <td>filecnt</td>
                                                    <td>vote</td>
                                                    <td>hit</td>
                                                    <td>D</td>
                                                </tr>
                                                <tr>
                                                    <td><label><input type="checkbox" name="check" /></label></td>
                                                    <td>1</td>
                                                    <td>일반</td>
                                                    <td class="text-left"><a href="./board_view.html">제목이 나오는 곳입니다. <span class="hit">HIT</span></a></td>
                                                    <td>작성자</td>
                                                    <td>2012-02-21</td>
                                                    <td>filecnt</td>
                                                    <td>vote</td>
                                                    <td>hit</td>
                                                    <td>D</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="10">
                                                        <label>등록된 글이 없습니다.</label>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <form>
	                                    <div class="search-form" style="float:right; margin:10px 0;">
	                                        <fieldset>
	                                            <select name="category_idx" id="category_idx" form="categoryForm" onChange="this.form.submit();">
	                                                <option value="0">전체목록</option>
	                                                <option value="1">일반</option>
	                                            </select>
	                                            <select id="sam001" title="검색카테고리선택" name="type">
	                                                <option value="all">전체</option>
	                                                <option value="title">제목</option>
	                                                <option value="content">내용</option>
	                                                <option value="name">이름</option>
	                                            </select>
	                                            <input type="search" value="" name="key" title="검색어입력" placeholder="Search.."/>
	                                            <a href="delete.php">
	                                                <input type="button" value="검색" />
	                                                <input type="button" value="초기화" onClick="window.location='#'" />
	                                            </a>
	                                        </fieldset>
	                                    </div>
                                		</form>
                                        <nav class="paging-group">
                                            <ul>
                                                <li><a href="#"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
                                                <li><a href="#" class="active">1</a></li>
                                                <li><a href="#">2</a></li>
                                                <li><a href="#">3</a></li>
                                                <li><a href="#">4</a></li>
                                                <li><a href="#">5</a></li>
                                                <li><a href="#">6</a></li>
                                                <li><a href="#">7</a></li>
                                                <li><a href="#">8</a></li>
                                                <li><a href="#">9</a></li>
                                                <li><a href="#">10</a></li>
                                                <li><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
                                            </ul>
                                        </nav>                                        
                                        <nav class="btn-group">
                                            <ul>
                                                <li>
                                                    <input type="button" value="글목록" onclick="location.href='./board_list.html'">
                                                </li>
                                                <li>
                                                    <input type="button" value="글등록" onclick="location.href='./board_write.html'">
                                                </li>
                                                <li>
                                                    <input type="button" value="전체선택" id="allCheck">
                                                </li>
                                                <li>
                                                    <input type="button" value="선택삭제" onClick="window.location='write.do'">
                                                </li>
                                            </ul>
                                        </nav>
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </article>
                </section>
            </div>
        </div>
    </div>
</div>
<c:import url="/WEB-INF/views/include/footer.jsp"/>