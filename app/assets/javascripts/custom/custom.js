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

  $(".section_container").click(function() {
      $('.cart_drop').slideUp(300);
  });

  //Codigo de select addtocart
  $('li').each(function(index){
    $("#cart_" + index).toggle(function() {
      $('#size_drop_' + index).slideDown(300);
    }, function(){
      $('body' + index).slideUp(300);
    });

    $('#size_drop_' + index + ' li a').click(function(){
      $('html, body').animate({scrollTop:0}, 'slow');
      myid=$(this).attr('id');
      $('#form' + index + ' #product_1').val($(this).attr('id'));
      $('#form' + index).submit();
      return false;
    });

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
