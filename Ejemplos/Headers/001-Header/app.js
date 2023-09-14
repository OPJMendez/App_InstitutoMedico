let htmlHeader = document.getElementById('Header');
window.addEventListener('scroll', () => {
  let scroll = window.scrollY;
  if (scroll > 10) {
    htmlHeader.style.backgroundColor = '#121212';
  } else {
    htmlHeader.style.backgroundColor = 'transparent';
  }
});
