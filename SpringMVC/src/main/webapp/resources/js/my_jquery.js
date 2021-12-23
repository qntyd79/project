$(document).ready(function() {
		
    // 메인슬라이드  
    $('.bxslider').bxSlider({
        //slideWidth: 1920,
        mode: 'fade',
        captions: true,
        auto: true,
		responsive:true
        //autoControls: true
    });

    // 푸터배너
    $('.banner-slider').bxSlider({
        slideWidth: 172,
        minSlides: 2,
        maxSlides: 10,
        moveSlides: 1,
        slideMargin: 9,
        autoControls: true,
        auto: true
    });

    // 2020.02.05

    // 상단고정 스크롤 시 메뉴 보이기/사라지기 / https://webdir.tistory.com/481
    var didScroll;
    var lastScrollTop = 0;
    var delta = 5;
    var navbarHeight = $('.header').outerHeight();

    $(window).scroll(function(event) {
        didScroll = true;
    });

    setInterval(function() {
        if (didScroll) {
            hasScrolled();
            didScroll = false;
        }
    }, 250);

    function hasScrolled() {
        var st = $(this).scrollTop();
        // Make sure they scroll more than delta 
        if (Math.abs(lastScrollTop - st) <= delta) return;
        // If they scrolled down and are past the navbar, add class .nav-up. 
        // This is necessary so you never see what is "behind" the navbar. 
        if (st > lastScrollTop && st > navbarHeight) {
            // Scroll Down 
            $('.header').removeClass('nav-down').addClass('nav-up');
        } else {
            // Scroll Up 
            if (st + $(window).height() < $(document).height()) { $('.header').removeClass('nav-up').addClass('nav-down'); }
        }

        lastScrollTop = st;
    }
 			
    // 버튼 클릭시 TOP으로 스크롤 이동 / 유튜브 바위처럼의 Ezweb
    $('html').append('<div id="toTop"><i class="fas fa-angle-double-up"></i></div>');

    $(window).scroll(function() {
        if ($(this).scrollTop() >= 450) {
            $('#toTop').fadeIn();
        } else {
            $('#toTop').fadeOut();
        }
    });

    $('#toTop').click(function(e) {
        e.preventDefault();
        $('html').stop().animate({ scrollTop: 0 }, 500);
    });
    
    // 스크롤 메뉴 클릭시 이미지 스크롤 변경 / 유튜브 바위처럼의 Ezweb
    var menu = $('.scroll li');
    var contents = $('.scroll-content');

    menu.click(function(e) {
        e.preventDefault();
        //menu.removeClass('active').css({ "color": "#fff", "background-color": "#333" });
        //$(this).addClass('active').css({ "color": "#F28900", "font-weight": "bold", "background-color": "#111" });
        //$(this).addClass('on').siblings().removeClass('on');
        var idx = $(this).index();
        var section = contents.eq(idx);
        var sectionDistance = section.offset().top;

        // A.scrollTop() 스크롤양 확인
        $('html').stop().animate({ scrollTop: sectionDistance });
    });

    $(window).scroll(function() {
        contents.each(function() {
            if ($(this).offset().top <= $(window).scrollTop()) {
                var idx = $(this).index();
                menu.removeClass('active').css({ "color": "#fff", "background-color": "#333" });
                menu.eq(idx).addClass('active').css({ "color": "#F28900", "font-weight": "bold", "background-color": "#111" });
            }
        });
    });


    // 이미지 캡션 애니메이션 / 유튜브 바위처럼의 Ezweb
    var image = $('.thumbnail');
    var duration = 300;
    //$(this)는 이벤트가 발생한 시점의 $image를 가리킴
    image.mouseover(function() {
            $(this).find('img').addClass('gray').css({ 'cursor': 'pointer' });
            $(this).find('figcaption').stop().animate({ opacity: 1, bottom: 0 }, duration);
        })
        .mouseout(function() {
            $(this).find('img').removeClass('gray').css({ 'cursor': 'pointer' });
            $(this).find('figcaption').stop().animate({ opacity: 1, bottom: '-40px' }, duration);
        });

    // 슬라이드 토글(메인) / 유튜브 바위처럼의 Ezweb
    var area = $('.toggle-box');
    slideToggle(area);


    // 슬라이드 토글(푸터) / 유튜브 바위처럼의 Ezweb
    var area = $('.footer-box');
    slideToggle(area);

    function slideToggle(str) {
        var area = str;
        var content = area.find('.toggle-content');
        var button = area.find('.toggle-btn');
		// 처음 로딩시 보여지는 부분(show/hide)
        content.hide();
        //$content.slideToggle(500);
        //$(this)는 이벤트가 발생한 시점의 $content를 가리킴
        button.click(function() {
            content.slideToggle("slow", function() {

                if ($(this).css('display') == 'none') {
                    button.html('<i class="fa fa-chevron-down" aria-hidden="true"></i>');
					//button.html('<i class="fa fa-chevron-down" aria-hidden="true"></i>');
                } else { 
	 				//button.html('<i class="fa fa-chevron-up" aria-hidden="true"></i>');                  
					button.html('<i class="fa fa-chevron-up" aria-hidden="true"></i>');
                }

                /*// 조건문에서만 사용 hasClass true/false
                if ($aside.hasClass('open')){
                    $aside.stop().animate({top:'0px'},$duration,'easeOutBack');
                    $button.attr('value','close');
                } else {
                    $aside.stop().animate({top:'-2000px'},$duration,'easeInBack');
                    $button.attr('value','open');
                }*/
            });
        });
    }

    // 슬라이드 토글(지도) / 유튜브 바위처럼의 Ezweb
    var area = $('#aside-wrap');
    var button = area.find('.toggle-btn');

    button.click(function() {
        if (area.hasClass('on')) { //on/off 로딩시 기본값 close
            area.stop().animate({ left: '0' }, 'slow').removeClass('on');
            //$('#aside-wrap').css({'display':'block','opacity':'1'});
            button.html('<i class="fa fa-chevron-left" aria-hidden="true"></i>');
        } else {
            area.stop().animate({ left: '-440px' }, 'slow').addClass('on');
            //$('#aside-wrap').css({'display':'none','transition':'opacity 1s ease-out','opacity':'0'});
            button.html('<i class="fa fa-chevron-right" aria-hidden="true"></i>');
        }
    });


    // 슬라이드 이미지 변경 / 유튜브 바위처럼의 Ezweb
    var slides = $('.slideshow img');
    var slideCount = slides.length;
    var currentIndex = 0;
    //console.log(slides); 

    // 해당시간이 지나면 한번만 할일 - var timer setTimeout(할일, 1000); clearTimeout(timer)
    // 일정시간 마다 할일 - var timer setInterval(할일, 시간); clearIntervar(timer);
    // jquery 집합개체(object)중 특정번쨰 요소를 선택 .eq(index번호)
    // 요소를 서서히 나타나도록 하는 효과 .fadeIn()
    // 요소를 서서히 사라지도록 하는 효과 .fadeOut()

    slides.eq(currentIndex).fadeIn();
    var timer = setInterval(showNextSlide, 3500);
    //clearIntervar(timer);

    function showNextSlide() {

        var nextIndex = (currentIndex + 1) % slideCount;

        slides.eq(currentIndex).fadeOut();
        slides.eq(nextIndex).fadeIn();
        currentIndex = nextIndex;
        //console.log(currentIndex);
    }

    function timerOn() {
        setInterval(showNextSlide, 3500);
    }

    function timerOff() {
        clearIntervar(timer);
    }

    slides.mouseover(function() {
        timerOff();
    }).mouseout(function() {
        timerOn();
    });


    // 슬라이드 좌우버튼 및 아래 이미지 수량 / 유튜브 바위처럼의 Ezweb
    var container = $('.slideshow'),
        slideGroup = container.find('.slideshow_slides'),
        slides = slideGroup.find('a'),
        nav = container.find('.slideshow_nav'),
        indicator = container.find('.indicator'),
        slideCount = slides.length,
        indicatorHtml = '',
        currentIndex = 0,
        duration = 500,
        easing = 'easeInOutExpo',
        interval = 3500,
        timer = '';

    // 슬라이드 가로로 배열
    // 슬라이드 마다 할일 , left 100%, 200%...
    slides.each(function(i) {
        var newLeft = i * 100 + '%';
        $(this).css({ left: newLeft });
        indicatiorHtml += "<a href=''>" + (i + 1) + "</a>";
        //console.log(indicatiorHtml);
    });
    // A.text(B) A요소의 B의 내용을 text 형태로 추가
    // A.html(B) A요소의 B의 내용을 html 형태로 추가
    indicator.html(indicatorHtml);

    // 슬라이드 이동 함수
    function goToSlide(index) {
        slideGroup.animate({ left: -100 * index + '%' }, duration, easing);
        currentIndex = index;
        //console.log(currentIndex);
        updateNav(); //처음인지 마지막인지 검사함수
    }

    // 처음인지 마지막인지 검사함수
    function updateNav() {
        var navPrev = nav.find('.prev');
        var navNext = nav.find('.next');

        if (currentIndex == 0) {
            navPrev.addClass('disabled');
        } else {
            navPrev.removeClass('disabled');
        }

        if (currentIndex == slideCount - 1) {
            navNext.addClass('disabled');
        } else {
            navNext.removeClass('disabled');
        }

        // 인티케이터 활성화  
        // 방법1  모든 요소에서 active를 뺴고 원하는 요소에만 actice추가
        //indicator.find('a').removeClass('active');
        //indicator.find('a').eq(currentIndex).addClass('active');

        // 방법2 원하는 요소에만 active를 추가하고 나머지들에서 active빼기
        indicator.find('a').eq(currentIndex).addClass('active').siblings().removeClass();
    }

    // 인디케이터로 이동하기
    indicator.find('a').click(function(e) {
        e.preventDefault();
        var idx = $(this).index();
        //console.log(idx);
        goToSlide(idx);
    });

    // 좌추버튼으로 이동하기 
    // 다음버튼 클릭 시 currentIndex+1 을 goToSlide(index)
    // 이전버튼 클릭 시 currentIndex-1 을 goToSlide(index)

    nav.find('a').click(function(e) {
        e.preventDefault();
        if ($(this).hasClass('prev')) {
            goToSlide(currentIndex - 1);
        } else {
            goToSlide(currentIndex + 1);
        }
    });

    updateNav();

    // 자동 슬라이드 함수
    function startTimer() {
        // 상단에 timer 변수 선언
        timer = setInterval(function() {
            var nextIndex = (currentIndex + 1) % slideCount;
            goToSlide(nextIndex);
        }, interval);
    }

    startTimer();

    function stopTimer() {
        clearIntervar(timer);
    }

    container.mouseenter(function() {
        stopTimer();
    });

    container.mouseleave(function() {
        startTimer()
    });


    // 탭메뉴 / 유튜브 바위처럼의 Ezweb
    // 1단탭  
    var tabAnchor = $('.tabs li');
    var tabPanel = $('.tab-content');
    tab(tabAnchor, tabPanel);

    // 2단탭
    var tabAnchor1 = $('.subtabs li');
    var tabPanel1 = $('.subtab-content');
    tab(tabAnchor1, tabPanel1);

    function tab(str1, str2) {
        var tabAnchor = str1;
        var tabPanel = str2;

        tabAnchor.click(function(e) {
            e.preventDefault();
            tabAnchor.removeClass('active').css({ "color": "#fff", "background-color": "#333" });
            $(this).addClass('active').css({ "color": "#F28900", "font-weight": "bold", "background-color": "#111" });
            //var NewLink = $(this).attr('href');
            tabPanel.hide();

            var activeTab = $(this).attr("rel");
            $("#" + activeTab).fadeIn('show');

        });

        tabAnchor.eq(0).trigger('click');
    }


    // 높이맞추기
    // placing objects inside variables
    var sidebarMenu = $('.aside-menu-box');
    var sidebar = $('.aside-box');
    var content = $('#map-wrap');
    var count = 0;
    var myTimer;
    var getContentHeight = content.outerHeight();
    var getSidebarHeight = sidebar.outerHeight();
    var getSidebarMenuHeight = sidebarMenu.outerHeight();

    function setEqualContainer() {
        if (getContentHeight > getSidebarHeight) {
            sidebar.css('min-height', getContentHeight);
        }
        if (getSidebarHeight > getContentHeight) {
            content.css('min-height', getSidebarHeight);
        }
        if (getContentHeight > getSidebarMenuHeight) {
            sidebarMenu.css('min-height', getContentHeight);
        }
    }

    myTimer = setInterval(function() {
        count++;

        if ($('#content-wrap').length == 0) {
            setEqualContainer();
        } else {
            setEqualContainer();
            clearInterval(myTimer);
        }

        if (count == 15) {
            clearInterval(myTimer);
        }
    }, 100);


    // 아코디언메뉴
    var accordion_content = $(".accordion-content");
    var accordion = $(".accordion");
    accordion_content.hide();
    accordion.click(function() {
        //$(this).next(".accordion-content").slideToggle(500);
        accordion_content.not($(this).next(".accordion-content").slideToggle(500)).slideUp();
        $(this).toggleClass("active"); //+,-아이콘토글
    });


    // 폼유효성검증 http://hellogk.tistory.com/48
    // IP Check
    $.validator.addMethod('validIP', function(value) {
        var split = value.split('.');
        if (split == '')
            return true;

        if (split.length != 4)
            return false;

        for (var i = 0; i < split.length; i++) {
            var s = split[i];
            if (s.length == 0 || isNaN(s) || s < 0 || s > 255)
                return false;
        }
        return true;
    }, 'Invalid IP Address');
	
	// 이메일 
	$.validator.addMethod("emailck", function(value, element) {
        return this.optional(element) || /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/.test(value);
    });

    // 영문만
    $.validator.addMethod("alpha", function(value, element) {
        return this.optional(element) || /^[a-zA-Z]+$/.test(value);
    });
    
    // 영문,숫자만
    $.validator.addMethod("alphanumeric", function(value, element) {
        return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value);
    });
    
    // 숫자만
    $.validator.addMethod("numeric", function(value, element) {
        return this.optional(element) || /^[0-9]+$/.test(value);
    });

    // 한글만
    $.validator.addMethod("hangle", function(value, element) {
        return this.optional(element) || /^[\uAC00-\uD7A3]+$/.test(value);
    });
    
    // 한글&영문 
    $.validator.addMethod("hanglealpha", function(value, element) {
        return this.optional(element) || /^[가-힣a-zA-Z]+$/.test(value);
    });

	// 날짜 
	$.validator.addMethod("anydate", function(value, element) {
        return this.optional(element) || /^(0?[1-9]|[12][0-9]|3[0-1])[/., -](0?[1-9]|1[0-2])[/., -](19|20)?\d{2}$/.test(value);
    });
    
    // 전화번호 000-0000-0000
    $.validator.addMethod("phoneck", function(value, element) {
        return this.optional(element) || /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/.test(value);
    });
  
    // 비밀번호 체크
    $.validator.addMethod("passwordck",  function(value, element ) {
    	return this.optional(element) ||  /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value);
    });
    
    // 도메인형식 체크(http:// https:// 포함안해도 되고 해도 되고)
    $.validator.addMethod("domain", function(value, element) {
    	return this.optional(element) || /^(((http(s?))\:\/\/)?)([0-9a-zA-Z\-]+\.)+[a-zA-Z]{2,6}(\:[0-9]+)?(\/\S*)?$/.test(value);
	});
    
    // 도메인형식 체크(http:// https:// 포함)
    $.validator.addMethod("domain2", function(value, element) {
    	return this.optional(element) || /^((http(s?))\:\/\/)([0-9a-zA-Z\-]+\.)+[a-zA-Z]{2,6}(\:[0-9]+)?(\/\S*)?$/.test(value);
	});
    
    // 도메인형식 체크(http:// https:// 미포함)
    $.validator.addMethod("domain3", function(value, element) {
    	return this.optional(element) || /^[^((http(s?))\:\/\/)]([0-9a-zA-Z\-]+\.)+[a-zA-Z]{2,6}(\:[0-9]+)?(\/\S*)?$/.test(value);
	});
    
    // 비교
    $.validator.addMethod("compare", function(value, element) {
        return (maxpoolsize.value >= minpoolsize.value)
    });    
	
	// Selectbox 
	$.validator.addMethod("selectck", function (value, element) {
        return (value != '0') ;
 	}, "선택해 주세요");
    	
	// content에 내용입력시 에러메세지 안보임처리 
	function ckeditor(){		
		CKEDITOR.instances.content.on('change', function() {    
			if(CKEDITOR.instances.content.getData().length >  0) {
			    $('label[for="content"]').hide();
			} else {
				$('label[for="content"]').show();
			}
		});			
	}
	
	// 셀렉트박스 메세지 사라짐 설정 		
	$('select').change(function(){ 
		$('select').valid();
		$('select').css('border-color','#e6e6e6');  
	})
	
	$("#writeForm").validate({
    	ignore : '*:not([name])',
        debug : false,
        onfocusout : false,
        // 규칙설정
        rules: {
            userid: {
                required: true,
                rangelength: [4,15],
                alphanumeric: true
                /*
                remote : {
                    url :  "/check_id.jsp",
                    type : "post",
                    data : {
                        userid : function() {
                            return $("#userid").val();
                        }
                    }
                }
                */
            },
            name: {
                required: true,
                minlength: 2
            },
            pass: {
                required: true,
                rangelength: [4,15],
                passwordck: true
            },
            email: {
                required: true,				
                emailck: true,
				minlength: 2
            },
			toemail: {
                required: true,				
                emailck: true,
				minlength: 2
            },
			sendemail: {
                required: true,				
                emailck: true,
				minlength: 2
            },
 			homepage: {
                required: true,
				domain: true
            },
			sdate: {
                required: true,
				date: true
            },
			edate: {
                required: true,
				date: true
            },
            title: {
                required : true,
                minlength: 2
            },          
            content: {
            	//https://dzone.com/articles/using-jquery-validate-plugin 참고사이트
                required: function(textarea) {
                	CKEDITOR.instances[textarea.id].updateElement(); // update textarea
			        var editorcontent = textarea.value.replace(/<[^>]*>/gi, ''); // strip tags					
			        return editorcontent.length === 0;
                },
                minlength: 5
            },
			answer: {
				required : true,
				numeric : true,
				maxlength : 6
			}          
        },
        messages: { //규칙체크 실패시 출력될 메시지 설정
            userid: {
                required: "아이디를 입력하세요.",
                rangelength: $.validator.format("아이디는 최소{0}글자 이상 {1}글자 이하로 입력하세요."),
                alphanumeric: "알파벳과 숫자만 사용 가능합니다.",
                remote: "존재하는 아이디입니다."
            },
            name: {
                required: "이름을 입력하세요.",
                minlength: $.validator.format("이름은 최소{0}글자 이상 입력하세요.")
            },
            pass: {
                required: "비밀번호를 입력하세요.",
                rangelength: $.validator.format("패스워드는 최소{0}글자 이상 {1}글자 이하로 입력하세요."),
                passwordck: "비밀번호는 영문대소문자,숫자,특수문자를 반드시 입력해주시기 바랍니다."
            },
            email: {
                required: "이메일을 입력하세요.",
                minlength: $.validator.format("이메일은 최소{0}글자 이상 입력하세요."),
                emailck: "올바른 이메일 주소가 아닙니다."
            },
			toemail: {
                required: "받는사람 이메일을 입력하세요.",
                minlength: $.validator.format("이메일은 최소{0}글자 이상 입력하세요."),
                emailck: "올바른 이메일 주소가 아닙니다."
            },
			sendemail: {
                required: "보내는사람 이메일을 입력하세요.",
                minlength: $.validator.format("이메일은 최소{0}글자 이상 입력하세요."),
                emailck: "올바른 이메일 주소가 아닙니다."
            },
			homepage: {
                required: "홈페이지 주소를 입력하세요.",
                domain: "올바른 홈페이지 주소가 아닙니다."
            },
			sdate: {
                required: "시작일을 입력하세요."
            },
			edate: {
                required: "종료일을 입력하세요."
            },
            title: {
                required: "제목을 입력하세요.",
                minlength: $.validator.format("제목은 최소{0}글자 이상 입력하세요.")
            },
            content: {
				required: "내용을 입력하세요.",
                minlength: $.validator.format("내용은 최소{0}글자 이상 입력하세요.")
            },
			answer: {
				required: "자동등록방지를 입력하세요.",
				numeric: $.validator.format("자동등록방지는 숫자만 입력하세요.")
			}
        },
		// 달력옆에 메세지 출력 
        errorPlacement: function(error, element) {
            var trigger = element.next('.ui-datepicker-trigger');
                error.insertAfter(trigger.length > 0 ? trigger : element);
			// 함수적용 
			ckeditor();
        }, 
		// 에러메세지 표시 설정 : 주석처리하면 에러메세지 보여짐 
		/* errorPlacement: function(error, element) {
           $(element).removeClass('error');
        }, */
        invalidHandler: function(form, validator) {
            var errors = validator.numberOfInvalids();
            if (errors) {
            	// 팝업알림처리 
                // alert(validator.errorList[0].message);
				// 필드아래처리 
                // validator.errorList[0].element.focus();
            }
        },
        submitHandler: function(form) {  
					
            form.submit(); 
       }
    });	
	
	// 카테고리폼 
	$("#categoryForm").validate({
    	ignore : '*:not([name])',
        debug : false,
        onfocusout : false,
        // 규칙설정
        rules: {            
            name: {
                required: true,
                minlength: 2
            },
            pass: {
                required: true,
                rangelength: [4,15],
                passwordck: true
            },  
			kind: {
                required: true
            },          
            title: {
                required : true,
                minlength: 2
            },
			answer: {
				required : true,
				numeric : true,
				maxlength : 6
			}          
        },
        messages: { //규칙체크 실패시 출력될 메시지 설정            
            name: {
                required: "이름을 입력하세요.",
                minlength: $.validator.format("이름은 최소{0}글자 이상 입력하세요.")
            },
            pass: {
                required: "비밀번호를 입력하세요.",
                rangelength: $.validator.format("패스워드는 최소{0}글자 이상 {1}글자 이하로 입력하세요."),
                passwordck: "비밀번호는 영문대소문자,숫자,특수문자를 반드시 입력해주시기 바랍니다."
            },            
            kind: {
				required: "분류를 추가할 항목을 선택해주세요."
            },           
            title: {
                required: "제목을 입력하세요.",
                minlength: $.validator.format("제목은 최소{0}글자 이상 입력하세요.")
            },           
			answer: {
				required: "자동등록방지를 입력하세요.",
				numeric: $.validator.format("자동등록방지는 숫자만 입력하세요.")
			}
        },		
		// 에러메세지 표시 설정 : 주석처리하면 에러메세지 보여짐 
        invalidHandler: function(form, validator) {
            var errors = validator.numberOfInvalids();
            if (errors) {
            	// 팝업알림처리 
                // alert(validator.errorList[0].message);
				// 필드아래처리 
                // validator.errorList[0].element.focus();
            }
        },
        submitHandler: function(form) {   	
           form.submit();
           
        }
    });	
		
    // 검색폼 
    $("#searchForm").validate({
    	ignore : '*:not([name])',
        debug : false,
        onfocusout : false,
        rules: {
        	keyWord: {
                required: true,
                minlength: 2
            }
        },
        messages: {
        	keyWord: {
                required: '검색어를 입력해주세요.',
                minlength: $.validator.format('검색어는 최소{0}글자 이상 입력하세요.')
            }
        },
		// 에러메세지 표시 설정 : 주석처리하면 에러메세지 보여짐 
       	errorPlacement: function(error, element) {
          // $(element).removeClass('error');
        },           
        invalidHandler: function(form, validator) {
            var errors = validator.numberOfInvalids();
            if (errors) {
            	// 팝업알림처리 
                alert(validator.errorList[0].message);
	            validator.errorList[0].element.focus();
            }
        },
        submitHandler: function(form) {
           form.submit();
        }
    });
	
	// 삭제폼 
    $('#deleteForm').validate({
    	ignore : '*:not([name])',
        debug: false,
        onfocusout: false,
        rules: {
            pass: {
                required: true,
                rangelength: [4,15],
                passwordck: true
            }
        },
        messages: {
             pass: {
                required: "비밀번호를 입력하세요.",
                rangelength: $.validator.format("패스워드는 최소{0}글자 이상 {1}글자 이하로 입력하세요."),
                passwordck: "비밀번호는 영문대소문자,숫자,특수문자를 반드시 입력해주시기 바랍니다."
            }
        },		        
        invalidHandler: function(form, validator) {
            var errors = validator.numberOfInvalids();
            if (errors) {
            	// 팝업알림처리 
                //alert(validator.errorList[0].message);
                validator.errorList[0].element.focus();
            }
        },
        submitHandler: function(form) {   	
            form.submit();
        }
    });
	
	// 회원가입폼
	$("#memberForm").validate({
    	ignore : '*:not([name])',
        debug : false,
        onfocusout : false,
        // 규칙설정
        rules: {
            userid: {
                required: true,
                rangelength: [4,15],
                alphanumeric: true
				/*
                remote : {
                    url : "${path}/modules/member/idCheck.do",
                    type : "post",
                    data : {
                        userid : function() {
                            return $("#userid").val();
                        }
                    }
                }
				*/
            },
			pass: {
                required: true,
                rangelength: [4,15],
                passwordck: true
            },
			pass_ask: {
                required: true,
				selectck : true
            },
			pass_account: {
                required: true
            },
            name: {
                required: true,
                minlength: 2
            },            
            email: {
                required: true,				
                emailck: true,
				minlength: 2
            },
			zipcode: {
                required: true,
				numeric : true,
				maxlength : 5			
            },
		    address: {
                required: true	
            },
			detailaddress: {
                required: true			
            },
 			phone: {
                required: true,
				phoneck: true
            },
			hphone: {
                required: true,
				phoneck: true
            },
			mail_check: {
				required: true
			},
			answer: {
				required : true,
				numeric : true,
				maxlength : 6
			}     
        },
        messages: { //규칙체크 실패시 출력될 메시지 설정
            userid: {
                required: "아이디를 입력하세요.",
                rangelength: $.validator.format("아이디는 최소{0}글자 이상 {1}글자 이하로 입력하세요."),
                alphanumeric: "알파벳과 숫자만 사용 가능합니다.",
                remote: "이미 존재하는 아이디입니다."
            },            
            pass: {
                required: "비밀번호를 입력하세요.",
                rangelength: $.validator.format("패스워드는 최소{0}글자 이상 {1}글자 이하로 입력하세요."),
                passwordck: "비밀번호는 영문대소문자,숫자,특수문자를 반드시 입력해주시기 바랍니다."
            },
			pass_ask: {
                required: "비밀번호 분실시 질문을 선택하세요."

            },
			pass_account: {
                required: "비밀번호 분실시 답변을 입력하세요."
            },
			name: {
                required: "이름을 입력하세요.",
                minlength: $.validator.format("이름은 최소{0}글자 이상 입력하세요.")
            },
            email: {
                required: "이메일을 입력하세요.",
                minlength: $.validator.format("이메일은 최소{0}글자 이상 입력하세요."),
                emailck: "올바른 이메일 주소가 아닙니다."
            },
			zipcode: {
                required: "우편번호찾기를 클릭하세요."
            },
			address: {
                required: "주소를 입력하세요."
            },
			detailaddress: {
                required: "상세주소를 입력하세요."
            },
			phone: {
                required: "전화번호를 입력하세요.",
				phoneck:"올바른 전화번호가 아닙니다."
            },
			hphone: {
                required: "핸드폰번호를 입력하세요.",
				phoneck:"올바른 휴대폰번호가 아닙니다."
            }, 
			mail_check: {
				required: "메일수신여부를 선택하세요."
			},        
			answer: {
				required: "자동등록방지를 입력하세요.",
				numeric: $.validator.format("자동등록방지는 숫자만 입력하세요.")
			}
        },
		// 아이디중복버튼 옆에 메세지 출력 
        errorPlacement: function(error, element) {
			if (element.is(":radio")) {
                error.appendTo(element.parents('.container') );
            } else { // This is the default behavior 
                var trigger = element.next('input[type=button]');
                error.insertAfter(trigger.length > 0 ? trigger : element);
            }		
			if (element.is("select")){
				$(element).css('border-color','red');  
			}					
        }, 				
        invalidHandler: function(form, validator) {
            var errors = validator.numberOfInvalids();
            if (errors) {
            	// 팝업알림처리 
                // alert(validaor.errorList[0].message);
				// 필드아래처리 
                // validator.errorList[0].element.focus();
            }
        },
        submitHandler: function(form) {  

			if ($("#me_id_yn").val() != "Y") {			
				alert("아이디 중복체크를 눌러주세요.");		
				return false;			
			}  
					
			form.submit();
        }
    });

	// 회원로그인폼 
	$("#loginForm").validate({
    	ignore : '*:not([name])',
        debug : false,
        onfocusout : false,
        // 규칙설정
        rules: {
            userid: {
                required: true,
                rangelength: [4,15],
                alphanumeric: true        
            },			
			pass: {
                required: true,
                rangelength: [4,15],
                passwordck: true
            },
			name: {
                required: true,
                minlength: 2
            },
			email: {
                required: true,				
                emailck: true,
				minlength: 2
            }        
        },
        messages: { //규칙체크 실패시 출력될 메시지 설정
            userid: {
                required: "아이디를 입력하세요.",
                rangelength: $.validator.format("아이디는 최소{0}글자 이상 {1}글자 이하로 입력하세요."),
                alphanumeric: "알파벳과 숫자만 사용 가능합니다.",
            },            
            pass: {
                required: "비밀번호를 입력하세요.",
                rangelength: $.validator.format("패스워드는 최소{0}글자 이상 {1}글자 이하로 입력하세요."),
                passwordck: "비밀번호는 영문대소문자,숫자,특수문자를 반드시 입력해주시기 바랍니다."
            },
			name: {
                required: "이름을 입력하세요.",
                minlength: $.validator.format("이름은 최소{0}글자 이상 입력하세요.")
            },
			email: {
                required: "이메일을 입력하세요.",
                minlength: $.validator.format("이메일은 최소{0}글자 이상 입력하세요."),
                emailck: "올바른 이메일 주소가 아닙니다."
            }
        },
		// 아이디중복버튼 옆에 메세지 출력 
        errorPlacement: function(error, element) {
			if (element.is(":radio")) {
                error.appendTo(element.parents('.container') );
            } else { // This is the default behavior 
                var trigger = element.next('input[type=button]');
                error.insertAfter(trigger.length > 0 ? trigger : element);
            }		
			if (element.is("select")){
				$(element).css('border-color','red');  
			}
        }, 				
        invalidHandler: function(form, validator) {
            var errors = validator.numberOfInvalids();
            if (errors) {
            	// 팝업알림처리 
                // alert(validaor.errorList[0].message);
				// 필드아래처리 
                // validator.errorList[0].element.focus();
            }
        },
        submitHandler: function(form) {   	
           form.submit();
        }
    });
    /*

	$('#form').validate({
    	ignore : '*:not([name])',
        debug : false,
        onfocusout : false,
		onkeyup : false,
        rules: {
            pass: {
                required: true,
                rangelength: [4,15],
                passwordCk: true
            }
        },
        messages: {
             pass: {
                required: "비밀번호를 입력하세요",
                rangelength: $.validator.format("패스워드는 최소{0}글자 이상 {1}글자 이하로 입력하세요."),
                passwordCk: "비밀번호는 영문대소문자,숫자,특수문자를 반드시 입력해주시기 바랍니다."
            }
        },
        errorElement: "em",
        errorPlacement: function ( error, element ) {
            // Add the `help-block` class to the error element
            error.addClass( "help-block" );
                if ( element.prop( "type" ) === "checkbox" ) {
                error.insertAfter( element.parent( "label" ) );
            } else {
                error.insertAfter( element );
            }
        },
        highlight: function ( element, errorClass, validClass ) {
            $( element ).parents( ".col-sm-5" ).addClass( "has-error" ).removeClass( "has-success" );
        },
        unhighlight: function (element, errorClass, validClass) {
            $( element ).parents( ".col-sm-5" ).addClass( "has-success" ).removeClass( "has-error" );
        },
        
        errorPlacement: function (error, element) {
            // $(element).removeClass('error');
            // do nothing;
        }, invalidHandler: function (form, validator) {
            var errors = validator.numberOfInvalids();
            if (errors) {
                alert(validator.errorList[0].message);
                validator.errorList[0].element.focus();
            }
        }, submitHandler: function (form) {
            $.ajax({
                type: "POST",
                url: "/sample/ajax/ajaxJson.do",
                data: $(form).serialize(),
                dataType: "json",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                success: function (data) {
                    if (data.code == '0') {
                        alert('code:' + data.code + '\n' + 'msg:' + data.msg);
                    }
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(failMsg + ' ' + textStatus.msg);
                }
            });
        }
  	});
    */


    //팝업레이어 http://webclub.tistory.com/189
    $('.popupBtn').click(function() {
        var $href = $(this).attr('value');
        layer_popup($href);
    });

    function layer_popup(el) {
        //레이어의 id를 $el 변수에 저장
        var temp = $(el);

        //dimmed 레이어를 감지하기 위한 boolean 변수
        var bg = temp.prev().hasClass('bg');
        if (bg) {
            $('.layer').fadeIn();
            temp.fadeIn();
        }

        // 화면의 중앙에 레이어를 띄운다. 
        if (temp.outerHeight() < $(document).height()) temp.css('margin-top', '-' + temp.outerHeight() / 2 + 'px');
        else temp.css('top', '0px');
        if (temp.outerWidth() < $(document).width()) temp.css('margin-left', '-' + temp.outerWidth() / 2 + 'px');
        else temp.css('left', '0px');

        // 닫기 버튼을 클릭하면 레이어가 닫힌다.
        temp.find('a.cbtn').click(function(e) {
            if (bg) {
                $('.layer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다.  
            } else {
                temp.fadeOut();
            }
            return false;
        });

        $('.layer .bg').click(function() { //배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러 
            $('.layer').fadeOut();
            return false;
        });
    }


    // 반응형 모달창
    function modalCenter() {
        var modal_w = $('.modal-box').width() / 2;
        $('.modal-box').css('margin-left', -modal_w);
        var modal_h = $('.modal-box').height() / 2;
        $('.modal-box').css('margin-top', -modal_h);
    }

    modalCenter();

    $(window).resize(function() {
        modalCenter();
    });    

    $('.modal-open-btn').click(function() {
        modalOn();
    });

    $('.modal-close-btn').click(function() {
        modalOff();
    });

    $('.modal-back').click(function() {
        modalOff();
    });

    // modal on/off
    function modalOn() {
        $('.modal-box').addClass('modal-on');
        $('.modal-back').addClass('back-on');
        $('body').addClass('body-lock');
    }

    function modalOff() {
        $('.modal-box').removeClass('modal-on');
        $('.modal-back').removeClass('back-on');
        $('body').removeClass('body-lock');
    }

    // 달력 기본 설정 
    $('.datePicker').datepicker({
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        weekHeadder: 'Wk',
        dateFormat: "yy-mm-dd",
        autoSize: true,
        changeMonth: true,
        changeYear: true,
        showMonthAfterYear: true,
        showButtonPanel: true,
        buttonText: '달력',
        buttonImageOnly: true,
        buttonImage:"../../resources/images/icon/calendar.gif",
        showOn: "both",
        yearRange: 'c-100:c+10,',
		currentText:'오늘',
		closeText: '닫기',
		onClose:function(){
			$("form").validate().element("#sdate");
			$("form").validate().element("#edate");
		}
    });
	
	$('.datePicker').datepicker( "getDate" );
    $("#ui-datepicker-div").hide();
	
	
  	// 일반파일폼 
	var fileTarget = $('.filebox .upload-hidden'); 
	fileTarget.on('change', function(){ 
		// 값이 변경되면 
		if(window.FileReader){
			var filename = $(this)[0].files[0].name;
		} else { 
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
		} // 추출한 파일명 삽입 
		$(this).siblings('.upload-name').val(filename);
	});


  	// 동적파일폼 추가
    var formcount = 1;
    var current_count = $("input[type='file']").length;

    $("#addItemBtn").click(function() {

        // 파일업로수 갯수 제한설정 10개
        var now_count = $("input[type='file']").length;

        if (now_count == 5) {
            alert("파일폼 추가는 최대 5개입니다.");
            return;
        }

        var html = "";
        
        html += "<li style='margin-bottom:3px;'>";
        html += "<input class='upload-name' id='item_" + formcount + "' disabled='disabled'> ";
        html += "<label for='ex_filename_" + formcount + "'>업로드</label> ";
        html += "<input type='file' name='attach' id='ex_filename_" + formcount + "' class='upload-hidden_" + formcount + "'> ";
        html += "<input type='button' value='삭제' id='delItemBtn" + formcount + "'/> ";
        /*html += "<input type='button' value='파일폼추가' id='addItemBtn' />";*/
        html += "</li>";

        $("#example").append(html); //attach + 1    

        // 동적추가 파일폼 내 파일명추출 및 변경
        var xid = "item_" + formcount;
        $(document).on("change", ".upload-hidden_" + formcount, function() {

            var files = $(this);
            var fileName = files[0].files[0].name;
            //alert(fileName); //파일이름

            // 파일사이즈 및 확장자 체크
            var check1 = fileSizeCheck(files);
            var check2 = fileExtCheck(files);

            // 파일명추출
            if (check1 == true && check2 == true) {
                if (window.FileReader) {
                    var filename = files[0].files[0].name;
                } else {
                    var filename = files.val().split('/').pop().split('\\').pop();
                }
                files.siblings("#" + xid).val(filename);
            } else {
                files.val('');
            }

            // 파일목록출력
            var count = formcount - 1;
            //alert("파일목록 카운터 " +" " + count);
            var filesArrLen = files.length;

            for (var i = 0; i < filesArrLen; i++) {
            	
                var html = "";
                
                html +="<tr class='itemt_" + count + "'>";
                html +="<td>" + filesArrLen++ + "</td>";
                html +="<td>" + files[i].files[0].name + "</td>";
                html +="<td>" + fileUnitCheck(files[i].files[0].size) + "</td>";
                //html +="<td>" + files[i].files[0].type + "</td>";
				html +="<td>" + fileExt(files[i].files[0].name) + "</td>";
				html +="<td>등록일</td>";
				html +="<td><input type='button' id='delItemBtn1' value='삭제'/></td>";
                html +="</tr>";
         	
                /*html += "<li style='margin-bottom:5px;'class='itemt_" + count + "'>";
                html += "파일명 : " + files[i].files[0].name + " / 파일사이즈 : " + fileUnitCheck(files[i].files[0].size) + " / 파일타입 : " + files[i].files[0].type;
                //html += " <input type='button' id='delItemBtn1' value='삭제'/>";
                html += "</li>";*/

                $("#filelist").append(html);
            }

            $("#filelist").find(".itemt_" + count).attr("id", "delItemBtn" + count);
        });

        // 동적추가 파일폼 내 삭제버튼 이벤트 처리
        var xidt = "delItemBtn" + formcount
        $(document).on("click", "#delItemBtn" + formcount, function() {

            $("#filelist>table>tr").remove("#" + xidt);
            $(this).parent().remove();
        });


        formcount++;

        // 체크박스 처리 삭제버튼 이벤트 처리
        $(document).on("click", "#del", function() {

            if ($("input").is(":checked") == true) { //체크된 요소가 있으면               
                var i = $("input:checked").parents("tr");
                var e = i.next("tr");
                i.remove();
                e.remove();

            } else {
                alert("삭제할 항목을 선택해주세요!")
            }
        });

    });

    // 동적파일폼 삭제 
    $(document).on("click", "#delItemBtn", function() {
        var now_count = $("#example input[type='file']").length;

        if (now_count == 1) {
            alert("기본제공 첨부파일폼입니다.");
            return;
        }

        $("#example li:last").remove();
        $("#filelist li:last").remove();
    });

    // 파일사이즈 체크
    function fileSizeCheck(val) {
        var check = false;
        var fileName = val;
        //var fileSize = fileName[0].files[0].size;
        var maxSize = 5 * 1024 * 1024;

        if (window.ActiveXObject) { //IE용인데 IE8이하는 안됨... 
            var fso = new ActiveXObject("Scripting.FileSystemObject");
            var filepath = obj[0].value;
            var thefile = fso.getFile(filepath);
            fileSize = thefile.size;
        } else {
            //IE 외 //sizeinbytes = document.getElementById(obj).files[0].size; 
            fileSize = fileName[0].files[0].size;
        }

        var str = fileUnitCheck(fileSize);

        if (fileSize > maxSize) {
            alert("5MB 이하 파일만 등록할 수 있습니다.\n" + "현재파일 용량 : " + str);
            check = false;
        } else {
            check = true;
        }
        // console.log("파일사이즈 체크함수" + check);
        return check;
    }


    // 파일사이즈 단위환산
    function fileUnitCheck(fileSize) {

        var str;

        var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
        if (fileSize == 0) return '0 Byte';
        var i = parseInt(Math.floor(Math.log(fileSize) / Math.log(1024)));

        str = Math.round(fileSize / Math.pow(1024, i), 2) + ' ' + sizes[i];

        return str;
    }

    // 파일확장자 체크
    function fileExtCheck(val) {
        var check = false;
        var fileName = val;
        var fileExt = fileName.val().split('.').pop().toLowerCase();
        var imageAllowType = ['gif', 'png', 'jpg', 'jpeg', 'doc', 'docx', 'xls', 'xlsx', 'hwp', 'ppt', 'pptx', 'pdf'];

        if ($.inArray(fileExt, imageAllowType) == -1) {
            alert("등록 할수 없는 파일형식입니다.\n" + imageAllowType + " 파일형식만 가능합니다.");
            check = false;
        } else {
            check = true;
        }
        //console.log("파일확장자 체크함수" + check);
        return check;
    }

	// 파일확장자
	function fileExt(filename) {

        var fileLen = filename.length; 
	    /** 
	     * lastIndexOf('.') 
	     * 뒤에서부터 '.'의 위치를 찾기위한 함수
	     * 검색 문자의 위치를 반환한다.
	     * 파일 이름에 '.'이 포함되는 경우가 있기 때문에 lastIndexOf() 사용
	     */
	    var lastDot = filename.lastIndexOf('.')+1;
	 
	    // 확장자 명만 추출한 후 소문자로 변경
	    var fileExt = filename.substring(lastDot,fileLen).toUpperCase();
	 
	    return fileExt;
    }

    // 파일 삭제 <input name="files" id="fileupload" type="file" multiple />
    function deleteFile(eventParam, orderParam) {
        filesTempArr.splice(orderParam, 1);
        var filesTempArrLen = filesTempArr.length;

        for (var i = 0; i < filesTempArrLen; i++) {

            var Temphtml = "";
            
            Temphtml += "<li style='margin-bottom:5px;'>";
            Temphtml += "파일명 : " + filesTempArr[i].name;
            Temphtml += " <input type='button' value='삭제' onclick='deleteFile(event, " + i + ");'/>";
            Temphtml += "</li>";
        }

        $("#filelist").html(Temphtml);
    }

    // 파일미리보기
    function preview(arr) {
        arr.forEach(function(f) {

            //파일명이 길면 파일명...으로 처리 
            var fileName = f.name;
            if (fileName.length > 10) {
                fileName = fileName.substring(0, 7) + "...";
            }

            //div에 이미지 추가
            var str = '<div style="display: inline-flex; padding: 10px;"><li>';
            str += '<span>' + fileName + '</span><br>';

            //이미지 파일 미리보기
            if (f.type.match('image.*')) {
                var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
                reader.onload = function(e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러

                    str += '<img src="' + e.target.result + '" title="' + f.name + '" width=100 height=100 />';
                    str += '</li></div>';
                    $(str).appendTo('#preview');
                }
                reader.readAsDataURL(f);
            } else {
                str += '<img src="/resources/img/fileImg.png" title="' + f.name + '" width=100 height=100 />';
                $(str).appendTo('#preview');
            }
        }); //arr.forEach
    }

    // 출처: https: //start0.tistory.com/59 [아는 것이 좋은 것이다.]
    function readURL(input) {
        if (input.files && input.files[0]) {

            var reader = new FileReader();

            reader.onload = function(e) {
                $('#blah').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#imgInp").change(function() {
        alert(this.value);
        readURL(this);
    });
    
    // 체크박스 전체선택/해제 토글 
    var checkTopValue = $("input[name=allCheck]:checkbox");
    var checkValue = $("input[name=check]:checkbox");
    $(".allCheck").on("click", function() {   
        if ($(this).prop("checked")) {
        	checkValue.prop("checked", function(i, val){ return !val });
        } else {
        	checkValue.prop("checked", function(i, val){ return !val });
        }
    });
    
    $(".btnallCheck").on("click", function() {   
    	checkTopValue.prop("checked", function(i, val){ return !val });
    	checkValue.prop("checked", function(i, val){ return !val });     
    });
    
    $(".unallCheck").on("click", function() {
    	checkTopValue.prop("checked", false);     
    	checkValue.prop("checked", false);        
    });
    
    $(".reversalallCheck").on("click", function() {
    	checkTopValue.prop("checked", function(i, val){ return !val });
    	checkValue.prop("checked", function(i, val){ return !val });      
    });
    
    // 검색어
    $("#searchBtn").on("click", function() {
    	e.preventDefault();
        self.location = "list.do" +
            '${pageMaker.makeQuery(1)}' +
            "&searchField=" + $('#searchField').val() +
            "&keyWord=" + $('#keyWord').val();
    });
    
    // 모달창 닫히면서 새로고침
    $(".cbtn").on("click", function(){
    	$(".layer").hide();
    	parent.document.location.reload(); 
    });

    // 파일업로드 ajax
    $(".filedrop").on("dragenter dragover", function(e) {
        e.preventDefault();
    });

    $(".filedrop").on("drop", function(e) {
        e.preventDefault();

        var files = e.originalEvent.dataTransfer.files;

		for(var i=0; i < files.length; i++){
	        var file = files[i];
	
	        console.log(file);
	
	        var formData = new FormData(); // HTML5 지원
	        formData.append("file", file);
	
	        $.ajax({
	            url: 'upload.do',
	            data: formData,
	            dataType: 'text',
	            processData: false,
	            contentType: false,
	            type: 'POST',
	            success: function(data) {
	                //alert(data);
	
	                //이미지 인경우 썸네일을 보여준다.
	                if (checkImageType(data)) {
	                    str = "<div>" +
	                        "<a href='display?fileName=" + getImageLink(data) + "'>" +
	                        "<img src='display?fileName=" + data + "'/>" +
	                        "</a>" +
	                        "<small data-src='" + data + "'>X</small></div>";
	                } else {
	                    str = "<div>" +
	                        "<a href='display?fileName=" + data + "'>" +
	                        getOriginalName(data) + "</a>" +
	                        "<small data-src='" + data + "'>X</small></div>";
	                }
	
	                $(".uploadlist").append(str);
	            },
	        });
		}
    });


    /* 컨트롤러로 부터 전송받은 파일이 이미지 파일인지 확인하는 함수 */
    function checkImageType(fileName) {
        var pattern = /jpg$|gif$|png$|jpeg$/i;

        return fileName.match(pattern);
    }

    //파일 이름 처리 : UUID 가짜 이름 제거
    function getOriginalName(fileName) {
        if (checkImageType(fileName)) {
            return;
        }

        var idx = fileName.indexOf("_") + 1;

        return fileName.substr(idx);
    }

    //이미지 원본 링크 제공
    function getImageLink(fileName) {

        if (!checkImageType(fileName)) {
            return;
        } 

        var front = fileName.substr(0, 12);
        var end = fileName.substr(14);

        return front + end;
    }

    // 업로드 파일 삭제 처리
    $(".uploadlist").on("click", "small", function(event) {

        var that = $(this);
        alert($(this).attr("data-src"));

        $.ajax({
            url: "delete",
            type: "post",
            data: { fileName: $(this).attr("data-src") },
            dataType: "text",
            success: function(result) {
                if (result == 'deleted') {
                    //alert("deleted");
                    that.parent("div").remove();
                } //
            },
        });
    });
    
    // 전화번호 자동입력 정규식
    // https://m.blog.naver.com/pcgun70/221722361301
    $(document).on("keyup", ".phoneNumber", function() { 
    	$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--", "-") ); 
    	// copy from https://cublip.tistory.com/326
        //﻿ 원본과 class 명만 바뀐 상태다.
    });
    
    // 사업자번호 자동입력 정규식
    $(document).on("keyup", ".co_num", function() { 
    	$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/([0-9]{3})([0-9]{2})([0-9]+)?/,"$1-$2-$3").replace("--", "-") ); 
    });
    
    // 1588-xxxx
    $(document).on("keyup", ".non_phoneNumber", function() { 
    	$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/([0-9]{2})([0-9]+)?([0-9]{4})/,"$1$2-$3").replace(/^-/, "") ); 
	});
    
    
    //이메일 직접입력, select 선택입력 출처: https: //start0.tistory.com/98 [아는 것이 좋은 것이다.]
    $('#selectEmail').change(function() {
        $("#selectEmail option:selected").each(function() {

            if ($(this).val() == '1') { //직접입력일 경우
                $("#str_email02").val(''); //값 초기화 
                $("#str_email02").attr("readonly", false); //활성화
            } else { //직접입력이 아닐경우 
                $("#str_email02").val($(this).text()); //선택값 입력 
                $("#str_email02").attr("readonly", true).css("background-color","#f0f0f0"); //비활성화
            }
        });
    });

    // simplecaptcha 보안코드 적용
    // https://rwd337.tistory.com/122
    $("#audio").on("click", function() {
        var rand = Math.random();
        var url = 'captchaAudio.do';
        $.ajax({
            url:url,
            type:'post',
            dataType:'text',
            data: 'rand=' + rand,
            success:function(resp){
                var uAgent = navigator.userAgent;
                var soundUrl = 'captchaAudio.do?rand=' + rand;

                if(uAgent.indexOf('Trident') > -1 || uAgent.indexOf('MSIE') > -1) {
                    winPlayer(soundUrl);
                } else if(!!document.createElement('audio').canPlayType){
                    try {
                        new Audio(soundUrl).play();
                    } catch(e) {
                        winPlayer(soundUrl);
                    }
                } else {
                    window.open(soundUrl,'','width=1, height=1');
                }
            }
        });
    });

    
	$("#refreshBtn").on("click", function() {
        var rand = Math.random();
        var url = "captchaImg.do?rand=" + rand;
        $('#captchaImg').attr("src", url);
    });

    function winPlayer(objUrl) {
        $('#captchaAudio').hmtl('<bgsound src=" ' + objUrl + '">');
    }
    
	
	// 회원가입 동의 체크박스 전체 선택
	$(document).on("click", "#allagree", function () {
	    $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
			
		// 버튼 활성화
 		var tmpp = $(this).prop('checked'); 
	
	    if(tmpp){
	    	$("#agreeBtn").css({"backgroundColor":"#d2201d","cursor":"pointer","color":"#fff"}).prop("disabled",false);
	    } else {
	        $("#agreeBtn").css({"backgroundColor":"#cbcbcb","cursor":"auto","color":"#303033"}).prop("disabled",true);
	    }
	});

	// 회원가입 동의 체크박스 개별 선택
	$(document).on("click", ".normal", function() {
	    var is_checked = true;

	    $(".checkbox_group .normal").each(function(){
	        is_checked = is_checked && $(this).is(":checked");
	    });

	    $("#allagree").prop("checked", is_checked);	
		
		// 버튼 활성화 
		var tmpp = $(this).prop('checked'); 
		
		if(tmpp && is_checked){
	    	$("#agreeBtn").css({"backgroundColor":"#d2201d","cursor":"pointer","color":"#fff"}).prop("disabled",false);
	    } else {
	        $("#agreeBtn").css({"backgroundColor":"#cbcbcb","cursor":"auto","color":"#303033"}).prop("disabled",true);
	    }		
	});	
				
	$("#agreeBtn").on("click", function() {	
						
		// 경고창 뛰우기
		if(!$("#agree1").is(":checked")) {
			alert("회원약관에 동의하셔야 합니다.");
			$('#agree1').focus();
			return;
		}
		
		if(!$("#agree2").is(":checked")){
			alert("개인정보보호정책에 동의하셔야 합니다.");
			$('#agree2').focus();
			return;
		}
		
		if(!$("#agree3").is(":checked")){
			alert("제3자 정보제공에 동의하셔야 합니다.");
			$('#agree3').focus();
			return;
		}
		
		$(this.form).submit();
		
	});

            
});