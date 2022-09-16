document.addEventListener('turbolinks:load', function() {
  var timerContainer = document.querySelector('.timer-container')

  if (!timerContainer) { return }

  var timestamp = timerContainer.dataset.endTime
  var endTime = new Date(timestamp * 1000)
  var TestPassageId = timerContainer.dataset.testPassageId

  var counter = setInterval(function() {

    let now = new Date().getTime()
    let remainingTime = endTime - now

    if (remainingTime >= 0) {

      let mins = Math.floor((remainingTime % (1000 * 60 * 60)) / (1000 * 60))
      let secs = Math.floor((remainingTime % (1000 * 60)) / 1000)

      document.getElementById("timer").innerHTML = ("0"+mins).slice(-2) + ":" + ("0"+secs).slice(-2)

    } else {

      window.location.replace("/test_passages/" + TestPassageId + "/result?status=faild_by_time")

    }

  }, 1000)

})
