const base = document.querySelectorAll('.toothbrush-card');
const clickedHeart = [];

let i = 0;
  base.forEach (function(element) {
    clickedHeart[i]  = element.addEventListener('click', function(event) {
      i++;
      let fr = event.currentTarget.querySelector(".fa-heart");
      if (fr.classList.contains("far")) {
        fr.classList.remove('far');
        fr.classList.add('fas');
      }
      else {
        fr.classList.remove('fas');
        fr.classList.add('far');
      };
    });
  });
