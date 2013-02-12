$(document).ready(function(){
	//FLEXISLIDER
	jQuery('.flexslider').flexslider({
		animation: "slide",
		start: function(slider){
		  $('body').removeClass('loading');
		}
	});

	//JCAROUSEL
	jQuery('.first-and-second-carousel').jcarousel();


	//SLIDE TOGGLE
	jQuery(".minicart_link").toggle(function() {
		 $('.cart_drop').slideDown(300);
		 }, function(){
		 $('.cart_drop').slideUp(300);
	});

  //Codigo de select addtocart
	jQuery("#cart_0").toggle(function() {
		 $('#size_drop_0').slideDown(300);
		 }, function(){
		 $('#size_drop_0').slideUp(300);
	});

  $('#size_drop_0 li a').click(function(){
    $('html, body').animate({scrollTop:0}, 'slow');
    //$('.message.success').fadeIn(3000).delay(3000).fadeOut(3500);
    myid=$(this).attr('id');
    $('#form0 #product_1').val($(this).attr('id'));
    $('#form0').submit();
    return false;

  });

	jQuery("#cart_1").toggle(function() {
		 $('#size_drop_1').slideDown(300);
		 }, function(){
		 $('#size_drop_1').slideUp(300);
	});

  $('#size_drop_1 li a').click(function(){
    $('html, body').animate({scrollTop:0}, 'slow');
    //$('.message.success').fadeIn(3000).delay(3000).fadeOut(3500);
    myid=$(this).attr('id');
    $('#form1 #product_1').val($(this).attr('id'));
    $('#form1').submit();
    return true;

  });

	jQuery("#cart_2").toggle(function() {
		 $('#size_drop_2').slideDown(300);
		 }, function(){
		 $('#size_drop_2').slideUp(300);
	});

  $('#size_drop_2 li a').click(function(){
    $('html, body').animate({scrollTop:0}, 'slow');
    //$('.message.success').fadeIn(3000).delay(3000).fadeOut(3500);
    myid=$(this).attr('id');
    $('#form2 #product_1').val($(this).attr('id'));
    $('#form2').submit();
    return true;

  });

	//SUB MENU

	jQuery("ul.departments > li.menu_cont > a").toggle(function(){
		$(this).addClass('active');
		$(this).siblings('.side_sub_menu').slideDown(300);
		}, function(){
		$(this).removeClass('active');
		$(this).siblings('.side_sub_menu').slideUp(300);
	});

	//FORM ELEMENTS
	jQuery("select").uniform();


	//SHORTCODES
	//Toggle Box
	jQuery(".toggle_box > li:first-child .toggle_title, .toggle_box > li:first-child .toggle_content").addClass('active');
	jQuery(".toggle_box > li > a.toggle_title").toggle(function(){

		$(this).addClass('active');
		$(this).siblings('.toggle_content').slideDown(300);
		}, function(){
		$(this).removeClass('active');
		$(this).siblings('.toggle_content').slideUp(300);
	});

	//TWITTER FEED    //replace "rohithpaul" with your Twitter ID
	$('.twitter_feed').jTweetsAnywhere({
		username: 'rohithpaul',
		count: 1
	});



});
