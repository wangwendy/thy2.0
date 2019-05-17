$(window).resize(function(){
	var w_width=$(this).width();
	if(w_width>1200){
		$('header').css('width','100%');
	}else{
		$('header').css('width','1200px');
	}
})
function eScrolltop(){
	$(window).scroll(function(){
		var scrollT=$(window).scrollTop();
		if(scrollT > 90){
			$(".header_con").delay(0).hide(0);
			$(".header_ccon").delay(0).show(0);
		}else{
			$(".header_ccon").delay(0).hide(0);
			$(".header_con").delay(0).show(0);
		}
	})
}
$(".menu li").click(function() {
      $(this).siblings('li').children("a:eq(0)").removeClass('onlink');  
      $(this).children("a:eq(0)").addClass('onlink');     

 });