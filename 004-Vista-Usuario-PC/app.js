document.addEventListener('DOMContentLoaded', function () {
  // Obtén referencias a los elementos HTML
  var showMessage = document.getElementById('btn-ShowMessage');
  var messageCard = document.getElementById('message-card');
  var closeMessage = document.getElementById('btn-CloseMessage');
  showMessage.addEventListener('click', function () {
    messageCard.style.display = 'block';
  });
  closeMessage.addEventListener('click', function () {
    messageCard.style.display = 'none';
  });
});
