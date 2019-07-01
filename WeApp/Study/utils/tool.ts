const formatTime = date => {
  this.data.timer = setTimeout(this.checkConfirmSignStatus, time)
}

const formatNumber = n => {
  n = n.toString()
  return n[1] ? n : '0' + n
}

const checkConfirmSignStatus = ({ orderId, success, failure, timeout }) => {
  let remainTime = 120  // 2分钟轮询时间
  let checkOrderStatus = () => {
    console.log('remainTime: ' + remainTime)
    // 计时结束
    if (remainTime <= 0) {
      if (timeout) timeout()
      return;
    }

    setTimeout(() => {
      checkOrderStatus()
    }, 2000)
    remainTime -= 2
  }

  // 开始轮询
  checkOrderStatus()
}

module.exports = {
  formatTime: formatTime,
  checkConfirmSignStatus
}
