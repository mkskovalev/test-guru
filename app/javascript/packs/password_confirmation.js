document.addEventListener('turbolinks:load', function() {

  var passwordConfirmation = document.getElementById('user_password_confirmation')

  if (passwordConfirmation) { passwordConfirmation.addEventListener('input', checkPassword) }

})

function checkPassword() {

  var success = document.querySelector('.octicon-check-circle')
  var failure = document.querySelector('.octicon-alert')

  if (!this.value) {
    success.classList.add('hide')
    failure.classList.add('hide')
    return
  }

  if (document.getElementById('user_password').value == this.value) {
    success.classList.remove('hide')
    failure.classList.add('hide')
  } else {
    success.classList.add('hide')
    failure.classList.remove('hide')
  }
}

