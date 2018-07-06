//app.js
App({
  onLaunch: function () {
    
    let obj0 = {first: 'one'}
    let obj1 = {...obj0, second: 'two'}
    console.log(obj1)

  },
  globalData: {
    userInfo: null
  }
})