<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/include/header.jsp"/>
<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
            <div class="content-full-img01"></div>
            <div class="content-full-bg01-hidden">
                <section class="content">
                   <%@ include file="../include/content_header.jsp"%>
                    <article>
                        <h2>화면 중앙정렬 6가지 방법</h2>
                        <h3>1. position:absolute와 margin 마이너스값을 이용한 중앙정렬</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <ul class="list">
                                    <li>ie7 이상 모든 브라우저에서 지원 가능합니다.</li>
                                    <li>width와 height값이 고정사이즈인 상태에서만 사용할 수 있습니다.</li>
                                </ul>
                                <div class="div-center-box">
                                    <div class="div-center01">
                                        div-center01
                                        <!-- <ul class="list" class="content-data-2">
                                            <li>
                                                <div class="panel">
                                                    <p class="img-box"><img src="/innomaps/images/logo.png" width="120px" /></p>
                                                    <div class="form-group first-child">
                                                        <label for="name"> 회원아이디</label>
                                                        <input type="text" id="name" name="name" class="btn-block" placeholder="아이디를 입력해주세요"/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="pw"> 비밀번호 </label>
                                                        <input type="password" id="pass" name="pass" class="btn-block" placeholder="비밀번호를 입력해주세요"/>
                                                    </div>
                                                    <p class="text-left"><input type="checkbox" name="state" value="1" id="state"> 로그인 상태 유지</p>
                                                    <p class="btn-group">
                                                        <input type="button" value="로그인" onclick="location.href='../../modul class="list"es/login/member_login.html'" class="btn-block danger"/>
                                                    </p>
                                                    <div class="social-icons">
                                                        <a href="#" class="fa fa-facebook"></a>
                                                        <a href="#" class="fa fa-twitter"></a>
                                                        <a href="#" class="fa fa-google"></a>
                                                        <a href="#" class="fa fa-linkedin"></a>
                                                        <a href="#" class="fa fa-youtube"></a>
                                                        <a href="#" class="fa fa-instagram"></a>
                                                        <a href="#" class="fa fa-pinterest"></a>
                                                    </div>
                                                    
                                                    <p class="btn-group">
                                                        <input type="button" value="회원가입" onclick="location.href='../../modul class="list"es/member/member_agree.html'"/>
                                                        <input type="button" value="아이디찾기" onclick="location.href='../../modul class="list"es/login/member_find.html'"/>
                                                        <input type="button" value="비밀번호찾기" onclick="location.href='../../modul class="list"es/login/member_find.html'"/>
                                                    </p>
                                                </div>
                                            </li>                                       
                                        </ul> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h3>2. position:absolute와 inline-block을 이용한 중앙정렬</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <ul class="list">
                                    <li>ie7 이상 모든 브라우저에서 지원 가능합니다.</li>
                                    <li>layer 안의 content 영역이 고정값이 아니라 가변이어도 자동으로 중앙정렬이 됩니다.</li>
                                    <li>불필요한 span 태그가 하나더 필요합니다. (모바일에선 :after로 대체 가능)</li>
                                </ul>
                                <div class="div-center-box">
                                    <div class="div-center02">
                                        <div class="content">div-center02</div>
                                        <div class="blank"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h3>3. position:absolute와 tabel-cell을 이용한 중앙정렬</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <ul class="list">
                                    <li>ie8 이상 모든 브라우저에서 지원 가능합니다.</li>
                                    <li>layer 안의 content 영역이 고정값이 아니라 가변이어도 자동으로 중앙정렬이 됩니다.</li>
                                    <li>코드 중첩이 여러번 되어야 합니다.</li>
                                </ul>
                                <div class="div-center-box">
                                    <div class="div-center03">
                                        <div class="inner">
                                            <div class="content">div-center03</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h3>4. position:absolute와 transform을 이용한 중앙정렬</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <ul class="list">
                                    <li>ie9 이상 모든 브라우저에서 지원 가능합니다. (모바일 작업시 적합)</li>
                                    <li>layer 안의 content 영역이 고정값이 아니라 가변이어도 자동으로 중앙정렬이 됩니다.</li>
                                    <li>transform 속성은 GPU가속이 가능해서 속도향상에 도움이 됩니다.</li>
                                    <li>짧은 소스로 간결하게 만들수 있습니다.</li>
                                    <li>모바일에서 사용시 기기별로 버그가 생길 가능성이 있습니다.</li>
                                </ul>
                                <div class="div-center-box">
                                    <div class="div-center04">div-center04</div>
                                </div>
                            </div>
                        </div>
                        <h3>5. position:absolute와 flex를 이용한 중앙정렬</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <ul class="list">
                                    <li>ie10 이상 모든 브라우저에서 지원 가능합니다. (모바일 작업시 적합)</li>
                                    <li>layer 안의 content 영역이 고정값이 아니라 가변이어도 자동으로 중앙정렬이 됩니다.</li>
                                    <li>짧은 소스로 간결하게 만들수 있습니다.</li>
                                    <li>구버전 브라우저에서는 display:box와 병행해야 합니다.</li>
                                </ul>
                                <div class="div-center-box">
                                    <div class="div-center05">
                                        <span class="content">div-center05</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h3>6. position:absolute와 box를 이용한 중앙정렬</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <ul class="list">
                                    <li>기본 적인 내용은 위에 설명한 flex와 같습니다. 브라우저 구버전을 대응하기 위해서 box를 같이 적용해 보았습니다.</li>
                                    <li>구버전 브라우저에서는 display:box와 병행해야 합니다.</li>
                                </ul>
                                <div class="div-center-box">
                                    <div class="div-center06">
                                        <div class="inner">
                                            <div class="content">div-center06</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h2>가로 가운데 정렬</h2>
                        <h3>1. 가변폭일 경우 중앙 정렬</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <ul class="list">
                                    <li>너비가 고정되어 있지 않는 콘텐츠를 가운데 정렬하는 방법입니다.</li>
                                    <li>가운데 정렬이 되는 것은 item 클래스의 요소이다. 인라인 요소도 가능</li>
                                </ul>
                                <div class="div-center-box">
                                    <div class="centered01">
                                        <div class="item" style="display:block">centered01</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h3>2. 포지션이 absolute일때 고정폭일 경우 중앙 정렬</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <ul class="list">
                                    <li>left의 값을 50% 으로 잡기</li>
                                    <li>margin-left의 값을 정렬하려는 div등의 넓이값/2 나누고 음수(-)값을 입력</li>
                                    <li>ex. div width:400px면 400/2 = 200을 마진값으로 설정 margin-left:-200px</li>
                                </ul>
                                <div class="div-center-box">
                                    <div class="centered02">centered02</div>
                                </div>
                            </div>
                        </div>
                        <h3>3. 포지션이 absolute일때 가변폭일 경우 중앙 정렬</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <ul class="list">
                                    <li>transform 속성을 활용하여 요소의 너비의 절반만큼을 이동시킬 수 있다.</li>
                                </ul>
                                <div class="div-center-box">
                                    <div class="centered03">centered03</div>
                                </div>
                            </div>
                        </div>
                        <h3>4. 포지션이 absolute일때 가로 세로 중앙 정렬</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <p>IE7 이하 버전은 왼쪽 맞추기와 오른쪽 맞추기를 동시에 지원하지 않고 상단 맞추기와 하단 맞추기를 동시에 지원하지 않으므로 이 패턴이 적용되지 않는다.</p>
                                <div class="div-center-box">
                                    <div class="centered04">
                                        <p id="cm" class="hc vc">centered04</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h2>세로 가운데 정렬 방법</h2>
                        <h3>1. absolute 속성을 이용하는 방법</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <p>이번에는 absolute 속성을 이용하여 top 속성에 50%를 주어 콘텐츠를 내리고 margin을 이용하여 콘텐츠 높이의 절반을 margin-top:-120px;이와같이 음수값을 이용한다. 그럼으로써 높이를 고정시킬 수 있다. 이것은 요소의 높이를 CSS에서 지정해야 한다는 걸 의미한다. <br>
                                    높이를 지정해 두기 때문에, 내용이 넘치면 div 밖으로 튀어나간다. 대신에 스크롤바가 생기도록 콘텐츠 div에 overflow: auto를 주고 싶을 것이다.</p>
                                <ul class="list">
                                    <li>모든 브라우저에서 작동한다.</li>
                                    <li>태그가 깊이 들어가지 않는다.</li>
                                    <li>충분한 공간이 없으면 내용이 잘린다(div가 body 밑에 있고, 사용자가 브라우저 창을 줄이면, 스크롤바가 나타나지 않는다).</li>
                                </ul>
                                <h4>포지션이 absolute일때 높이가 고정될 경우</h4>
                                <div class="div-center-box">
                                    <div id="centered05">centered05</div>
                                </div>
                                <h4>포지션이 absolute일때 높이가 고정되지 않은 경우</h4>
                                <div class="div-center-box">
                                    <div class="centered06">centered06</div>
                                </div>
                            </div>
                        </div>
                        <h3>2. float 속성을 이용하는 방법</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <p>이 방법은 내용 요소 위에 div를 두는 방법이다. 이 div는 height: 50%;, margin-bottom:-content높이의절반 이렇게 설정한다. content엔 clear 속성을 줘서 float된 div 밑으로 오게 하면 content가 가운데 오게 된다.</p>
                                <ul class="list">
                                    <li>모든 브라우저에서 작동한다.</li>
                                    <li>충분한 공간이 없을 때 (예컨대 윈도우 사이즈를 줄일 때) 콘텐츠가 잘리고 스크롤바가 나타난다.</li>
                                    <li>내가 생각할 수 있는 유일한 단점은, 빈 요소가 사용된다는 점이다(그렇게 나쁜 건 아니다. 이것 역시 주관적인 부분이다).</li>
                                </ul>
                                <div class="div-center-box">
                                    <div id="centered07"></div>
                                    <div id="centered07-content">centered07</div>
                                </div>
                            </div>
                        </div>
                        <h3>3. line-height 속성을 이용하는 방법</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <ul class="list">
                                    <li>모든 브라우저에서 작동한다.</li>
                                    <li>공간이 없어도 잘리지 않는다.</li>
                                    <li>오직 텍스트에서만 작동한다(블럭 요소에선 작동하지 않는다).</li>
                                    <li>한 줄 이상이 되면 (즉, 두 줄이 되면), 보기 싫게 깨진다.</li>
                                </ul>
                                <div class="div-center-box">
                                    <div id="centered08">centered08</div>
                                </div>
                            </div>
                        </div>
                        <h3>4. 이미지를 가운데 정렬 시키는 방법</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <p>ie에서도 적용되는 예제이다.</p>
                                <div class="div-center-box">
                                    <div class="centered09">
                                        <div class="a">
                                            <a href="#"> <img src="/jhbbs/images/clients/pages_0001.jpg" /> </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h3>5. :before 를 이용한 가운데 정렬</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <p>가상선택자인 :before를 정렬할 요소의 부모에 컨테이너에 추가해 그것의 높이를 100%로 지정하고 그것의 세로 정렬의 값을 middle로 설정해 이후 등장하는 요소가 세로 중앙정렬 되도록 하는 것이다.</p>
                                <div class="div-center-box">
                                    <div class="centered10">
                                        <div class="centered1-content">centered10</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>
                </section>
            </div>
        </div>
    </div>
</div>
<c:import url="/WEB-INF/views/include/footer.jsp"/>