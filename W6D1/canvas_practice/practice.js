document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("mycanvas");
  canvas.height = 500;
  canvas.width = 500;
  const ctx = canvas.getContext('2d');

  ctx.fillStyle = 'pink';
  ctx.fillRect( 20, 20, 150, 150);

  ctx.beginPath();
  ctx.arc( 75, 220, 33, 0, 2*Math.PI);
  ctx.strokeStyle = 'blue';
  ctx.lineWidth = 3;
  ctx.stroke();

  ctx.fillStyle = 'teal';
  ctx.fill();

  ctx.beginPath();
  ctx.arc( 300, 300, 70, 0, 2*Math.PI);
  ctx.strokeStyle = 'black';
  ctx.lineWidth = 4;
  ctx.stroke();
  ctx.fillStyle = 'yellow';
  ctx.fill();

  ctx.beginPath();
  ctx.arc( 275, 275, 5, 0, 2*Math.PI);
  ctx. stroke();
  ctx.fillStyle = 'black';
  ctx.fill();

  ctx.beginPath();
  ctx.arc( 325, 275, 5, 0, 2*Math.PI);
  ctx. stroke();
  ctx.fillStyle = 'black';
  ctx.fill();

  ctx.beginPath();
  ctx.arc( 300, 310, 40, 0, Math.PI);
  ctx. stroke();
  ctx.fillStyle = 'black';
  ctx.fill();

});
