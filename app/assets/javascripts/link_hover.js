// // .link-hover && data-link-hover-group=????
// //

// $(document).ready(function() {
//   $('.link-hover').hover(function() {
//     var selector = LinkHover.groupSelector(this);
//     $(selector).eq($(this).index()).trigger("mouseover");
//   }, function() {
//     var selector = LinkHover.groupSelector(this);
//     $(selector).eq($(this).index()).trigger("mouseout");
//   });
// });​

// window.LinkHover = LinkHover || (function() {
//   var _groupSelector = function(el) {
//     return ".link-hover[data-link-hover-group='"
//       + $(el).data('linkHoverGroup') + "']";
//   };

//   return {
//     groupSelector: _groupSelector
//   };
// })();
