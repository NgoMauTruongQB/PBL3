
window.addEventListener('scroll', function() {
    var menu = document.getElementById('header');
    if (window.pageYOffset > 50) { // Thay 100 bằng giá trị tùy chỉnh để kích hoạt hiệu ứng scroll
        menu.classList.add('fixed-menu');
    } else {
        menu.classList.remove('fixed-menu');
    }
});

