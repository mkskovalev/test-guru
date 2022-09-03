document.addEventListener('turbolinks:load', function() {
  document.getElementById('user_password_confirmation').addEventListener('input', function() {
    if (document.getElementById('user_password').value == this.value) {
      document.querySelector('.octicon-check-circle').classList.remove('hide')
      document.querySelector('.octicon-alert').classList.add('hide')
    } else {
      document.querySelector('.octicon-check-circle').classList.add('hide')
      document.querySelector('.octicon-alert').classList.remove('hide')
    }
  })
})