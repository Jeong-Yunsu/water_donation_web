const wrapper = document.querySelector('.site_header');
const menu = document.querySelector('.menu');
const menuItem = Array.from(menu.querySelectorAll('li a'));


menu.addEventListener('click', (e) => {
    let target = e.target;
    menuItem.forEach((item) => item.classList.remove('active'));
    target.classList.add('active');
});