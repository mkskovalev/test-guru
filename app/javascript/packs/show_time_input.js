document.addEventListener('turbolinks:load', function() {
  var checkbox = document.querySelector('.with-timer')
  var timeInputContainer = document.querySelector('.time')

  checkbox.addEventListener('change', function() {

    if (this.checked) {

      var label = document.createElement("label")
      label.classList.add("form-label")
      label.innerHTML = "Time in minutes"
      timeInputContainer.appendChild(label)

      var input = document.createElement("input")
      input.type = "number"
      input.name = "test[time]"
      input.classList.add("form-control")
      timeInputContainer.appendChild(input)

    } else {

      while (timeInputContainer.hasChildNodes()) {
        timeInputContainer.removeChild(timeInputContainer.lastChild);
      }

    }
  })
})
