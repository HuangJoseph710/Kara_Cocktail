/* 照片輪播 */
let sliderIdx = 0;
let slides = document.getElementsByClassName('slide');

//window.onload 讓照片在一進入網頁就有輪播功能
window.onload = function() {
  showSlide(sliderIdx);
  setAutoplay();
}

function showSlide(idx) {
  for (let i = 0; i < slides.length; i++) {
    slides[i].classList.remove('show');
  }
  slides[idx].classList.add('show');
}

function changeSlide(ctrl) {
  sliderIdx += ctrl;
  if (sliderIdx < 0) {
    sliderIdx = slides.length - 1;
  } else if (sliderIdx >= slides.length) {
    sliderIdx = 0;
  }
  showSlide(sliderIdx);
}

let autoplay;

function setAutoplay() {
  if (autoplay != undefined) {
    clearInterval(autoplay);
  }
  
  autoplay = setInterval(function() {
    changeSlide(1);
  }, 2000);
}


/* 切換版面按鈕 */
document.addEventListener('DOMContentLoaded', function() {
    const btnBestSeller = document.querySelector('input[value="0"]');
    const btnNewProducts = document.querySelector('input[value="1"]');
    const bestSeller = document.getElementById('BestSeller');
    const newProducts = document.getElementById('NewProducts');

    newProducts.style.display = 'none';

    btnBestSeller.addEventListener('click', function() {
        bestSeller.style.display = 'block';
        newProducts.style.display = 'none';
    });

    btnNewProducts.addEventListener('click', function() {
        bestSeller.style.display = 'none';
        newProducts.style.display = 'block';
    });
});


/* 關閉視窗按鈕 */
document.addEventListener('DOMContentLoaded', function() {
    var closeButton = document.querySelector('.close');
    closeButton.addEventListener('click', function() {
      var modal = document.querySelector('.IntroContent');
      modal.style.display = 'none';
    });
  });
// 按下按鈕彈出、關閉視窗
document.addEventListener('DOMContentLoaded', function() {
  const buttons = document.querySelectorAll('.btn');

  buttons.forEach(function(button) {
    const introduceId = button.dataset.introduce;
    const introduce = document.getElementById(introduceId);
    const close = introduce.querySelector('.close');

    button.addEventListener('click', function() {
      introduce.style.display = 'block';
    });

    close.addEventListener('click', function() {
      introduce.style.display = 'none';
    });
  });
});
