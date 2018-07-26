//index.js
//获取应用实例
const app = getApp()

Page({
  data: {
    motto: 'Hello World',
    userInfo: {},
    hasUserInfo: false,
    canIUse: wx.canIUse('button.open-type.getUserInfo')
  },

  //事件处理函数
  bindViewTap: function() {
    wx.navigateTo({
      url: '../logs/logs'
    })
  },

  operateArray: function (array) {
    array = [...array, 'new item']
  },

  onLoad: function () {
    
    let obj0 = {
      month: 0
    }
    let obj1 = {
      month: 1
    }
    let obj2 = {
      month: 2
    }

    function sortObj(a, b) {

    }
    
    let array0 = [obj1, obj2, obj0]
    console.log(array0.length)

    let array1 = array0.sort((a,b) => (a.month - b.month))
    console.log(array1)

    // let array = [1, 2, 3], array1 = [4, 5]
    // // array = [...array, ...array1]
    // // console.log(array)

    // let array2 = array
    // console.log('array2:' + array2)
    // array2.push('4')
    // console.log('array2:' + array2)
    // console.log('array:' + array)

    // this.operateArray(array2)
    // console.log('array2:' + array2)

  }
})
