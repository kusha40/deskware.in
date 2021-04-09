var $ = jQuery.noConflict();
var screenWidth = $(window).width();
// alert(screenWidth);

$('.mobileNav').on('click',function(){
	$('#mainNav').slideToggle();
	$('.mobileNav .fa').toggleClass('fa-times').toggleClass('fa-bars');
})


$('.pressIcons').slick({
	infinite: true,
	arrows: true
});

$('.slides').slick({
	infinite: false,
	arrows: true,
	dots: true,
});

if (screenWidth < 768) {
	$('nav .page_item_has_children > a, nav .menu-item-has-children > a').each(
		function() {
			$(this).after('<i class="fa fa-angle-down"></i>');
			$(this).next('i').on('click', 
				function() {
				$(this).toggleClass('fa-angle-down fa-angle-up').next('ul').toggle();
	        	$(this).parents('.menu-navigation-container:first').find('i.fa.fa-angle-up').not($(this)).each(function(){$(this).toggleClass('fa-angle-down fa-angle-up').next('ul').hide();});
				}
			);
		}
	);
};

// Accreditations Accordian

$('.accordionButton').click(function() {

	$('.accordionButton').removeClass('on');
	$('.accordionButton .fa').removeClass('fa-caret-up');

	$('.accordionContent').slideUp('normal');

	if($(this).next().is(':hidden') == true) {
		$(this).addClass('on');
		$(this).find('.fa:first').addClass('fa-caret-up'); 

		$(this).next().slideDown('normal');
	 } 
	  
});

$('.accordionContent').hide();


// News Gallery Popup
$('.newsGallery').each(function() {
    $(this).magnificPopup({
        delegate: 'a', 
        type: 'image',
        gallery: {
          enabled:true
        },
        zoom: {
		    enabled: true,
		    duration: 150,
		    easing: 'ease-in-out',
		    opener: function(openerElement) {
		    	return openerElement.is('img') ? openerElement : openerElement.find('img');
		    }
		}
	});
});

$('.famousGallery').each(function() {
    $(this).magnificPopup({
        delegate: 'a', 
        type: 'image',
        titleSrc: 'title',
        gallery: {
          enabled:true
        },
        zoom: {
		    enabled: true,
		    duration: 150,
		    easing: 'ease-in-out',
		    opener: function(openerElement) {
		    	return openerElement.is('img') ? openerElement : openerElement.find('img');
		    }
		}
	});
});

// Video Popup
$('.videoPopup').magnificPopup({
	disableOn: 700,
	type: 'iframe',
	mainClass: 'mfp-fade',
	removalDelay: 160,
	preloader: false,
	fixedContentPos: true
});

// Video Popup
$('.popupBasic').magnificPopup({
	disableOn: 0,
	type: 'image',
	mainClass: 'mfp-fade',
	removalDelay: 160,
	preloader: false,
	fixedContentPos: true
});

// Home Case Study Popup
$('.op3').magnificPopup({
	disableOn: 0,
	delegate: 'a',
	type: 'image',
	mainClass: 'mfp-fade',
	removalDelay: 160,
	preloader: false,
	fixedContentPos: true
});


// Top Header


// var header = $("header");
// $(window).scroll(function() {
//     var scroll = $(window).scrollTop();

//     if (scroll >= 150) {
//         header.addClass("fixed");
//     } else {
//         header.removeClass("fixed");
//     }
// });


// var waypoint = new Waypoint({
//   element: document.getElementById('homePageIntro'),
//   handler: function(direction) {
//     $(this).toggleClass( "hover" );
//   },
//   offset: 'bottom-in-view'
// });

// $('.homePageIntro').waypoint(function(direction) {
// 	if (direction == 'down') {
// 		// $('.homePageIntro').toggleClass( "visible" );
// 		$('.homePageIntro').addClass( "fadeInUp" );
// 	}
// }, { offset: '80%' });

// $('.singleTestimonial').waypoint(function(direction) {
// 	if (direction == 'down') {
// 		// $('.homePageIntro').toggleClass( "visible" );
// 		$('.singleTestimonial').addClass( "visible" );
// 	}
// }, { offset: '80%' });




