var Links={
  setcolor:function(color){
  // var alist=document.querySelectorAll('a');
  // var i=0;
  // while(i<alist.length){
  //  alist[i].style.color=color;
  //  i=i+1;
  // }
  $('a').css('color',color);
}
}
var Body={
  setcolor:function(color){
$('body').css('color',color);
},
setbackgroundColor:function(color){
$('body').css('backgroundColor', color)
}
}
function nihgt_day_handler(self){
  var tar_a=  document.querySelector('a');
  var tar_ol=  document.querySelector('ol');
  if (self.value==='night'){
    Links.setcolor('powderblue');
  Body.setcolor('white');
  Body.setbackgroundColor('black');
  self.value='day';
}
  else{
    Links.setcolor('black');
    Body.setbackgroundColor('white');
    Body.setcolor('black');
    self.value='night';
    }
  }
