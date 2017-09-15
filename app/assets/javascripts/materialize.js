$(document).ready(function() {
  $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15, // Creates a dropdown of 15 years to control year,
    today: 'Today',
    clear: 'Clear',
    close: 'Ok',
    closeOnSelect: false // Close upon selecting a date,
  });

  $('.timepicker').pickatime({
    default: 'now', // Set default time: 'now', '1:30AM', '16:30'
    fromnow: 0,       // set default time to * milliseconds from now (using with default = 'now')
    twelvehour: true, // Use AM/PM or 24-hour format
    donetext: 'OK', // text for done-button
    cleartext: 'Clear', // text for clear-button
    canceltext: 'Cancel', // Text for cancel-button
    autoclose: false, // automatic close timepicker
    ampmclickable: true, // make AM PM clickable
    aftershow: function(){} //Function for after opening timepicker
  });
  $('.carousel.carousel-slider').carousel({fullWidth: true});
  // Next slide
  //
  //
  // function autoplay() {
  //   $('.carousel').carousel('next');
  //   setTimeout(autoplay, 4500);
  // // }
  // $('.carousel').carousel();
  setInterval(function() {
    $('.carousel').carousel('next');
  }, 2005)
  // $('.carousel').carousel({
  //         full_width:true,
  //         time_constant: 100
  //       });
  //
  //       var carouselAutoplay = setInterval(function(){
  //             $('.fa-angle-right').click();
  //           }, 7000);
  //
  //       $('.fa-angle-right').click(function(){
  //         $('.carousel').carousel('next');
  //         clearInterval(carouselAutoplay);
  //         carouselAutoplay = setInterval(function(){
  //             $('.fa-angle-right').click();
  //           }, 7000);
  //       });
  //       $('.fa-angle-left').click(function(){
  //         $('.carousel').carousel('prev');
  //         clearInterval(carouselAutoplay);
  //         carouselAutoplay = setInterval(function(){
  //             $('.fa-angle-right').click();
  //           }, 7000);
  //     });


})
