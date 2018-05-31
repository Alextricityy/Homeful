import "slick-carousel";


$(document).ready(function(){
  $('.cards-slick').slick({
    dots: true,
    arrows: true,
    infinite: true,
    slidesToShow: 3,
    slidesToScroll: 3
  });
$(".slick-dots").css({ postion: ''})
});
