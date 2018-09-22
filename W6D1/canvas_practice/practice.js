document.addEventListener("DOMContentLoaded", function(){
  const myCanvas = document.getElementById("myCanvas");
  myCanvas.width = 500;
  myCanvas.height = 500;
  let ctx = myCanvas.getContext('2d');

  ctx.fillStyle = 'green';
  ctx.fillRect(10, 10, 55, 50);

});
