window.addEventListener('scroll', function() {
    var menu = document.getElementById('header');
    if (window.pageYOffset > 50) {
        menu.classList.add('fixed-menu');
    } else {
        menu.classList.remove('fixed-menu');
    }
});