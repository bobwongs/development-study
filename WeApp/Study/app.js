//app.js
App({
  onLaunch: function () {
    let result = Math.abs(~2020)
    console.log('result: ' + result)
  },
  globalData: {
    userInfo: null
  }
})