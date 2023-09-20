document.addEventListener('DOMContentLoaded', function () {
  // Obtén referencias a los elementos HTML
  var closeSession = document.getElementById('btn-Icon-User');
  var closeSessionWindow = document.getElementById('message-card');
  var closeMessage = document.getElementById('btn-CloseMessage');
  closeSession.addEventListener('click', function () {
    closeSessionWindow.style.display = 'block';
  });
  closeMessage.addEventListener('click', function () {
    closeSessionWindow.style.display = 'none';
  });
});
