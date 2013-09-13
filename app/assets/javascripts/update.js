$( document ).ready(function(){

  $('#button_update').on('click', function(){
    var ctx;
    var drawIntervalID;
    var spokes = 12;  // Number of spokes on the wheel
    function init() {
      var canvas = document.getElementById('loader');
      if (canvas.getContext){
        ctx = canvas.getContext('2d');
        ctx.translate(25,25); // Center the origin
        ctx.lineWidth = 1;
        ctx.lineCap = "round"
        drawIntervalID = setInterval(draw,100);
        return drawIntervalID;
      }
    }
    function draw(){
      ctx.clearRect(-75,-75,150,150);   // Clear the image
      ctx.rotate(Math.PI*2/spokes); // Rotate the origin
      for (var i=0; i<spokes; i++) {
        ctx.rotate(Math.PI*2/spokes); // Rotate the origin
        ctx.strokeStyle = "rgba(248,248,255,"+ i/spokes +")"; // Set transparency
        ctx.beginPath();
        ctx.moveTo(0,10);
        ctx.lineTo(0,5);
        ctx.stroke();
      }
    }
    init();
    $('#loading_bg').removeClass('hidden');

    $.post('update').done(function(){
      clearInterval(drawIntervalID);
      $('.loading_info').text('It\'s done! Thank you for your patience');
      $('.loading_info').append( "<a href='#' id='close' class='joyride-close-tip'>×</a>" )
      $('#close').on('click', function(){
        $('#loading_bg').addClass('hidden')
      });
    });
    });

});
