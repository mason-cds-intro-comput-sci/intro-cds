$(function() {
  /* Lets the user click on the images to view them in full resolution. */
  /* Source: https://gist.github.com/stephenturner/52c34309bf54703a6c9ad9fd59c0b27f */
  $("div.click-img img").wrap(function() {
    var link = $('<a/>');
    link.attr('href', $(this).attr('src'));
    link.attr('title', $(this).attr('alt'));
    link.attr('target', '_blank');
    return link;
  });
});
