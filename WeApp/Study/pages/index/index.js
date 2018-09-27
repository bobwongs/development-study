//index.js
//获取应用实例
const app = getApp()

const test = () => ('test')

Page({
  data: {
    motto: 'Hello World',
    userInfo: {},
    hasUserInfo: false,
    canIUse: wx.canIUse('button.open-type.getUserInfo'),

    info: {
      first: 'section one',
      second: 'section two'
    },
    array: [
      '1', '2', '3'
    ],


    region: [],

    myRange: []
  },

  onLoad() {
    let count = '0', num = '2'
    switch (count) {
      case '0': {
        console.log('0')
        switch (num) {
          
        }
        break
      }
      case '1': {
        console.log('1')
        break
      }
      case '2': {
        console.log('2')
        break
      }
    }
  },

  //事件处理函数
  bindViewTap: function() {
    wx.navigateTo({
      url: '../logs/logs'
    })
  },

  test: function (e) {
    let key = 'info.first'
    let toSetObject = { [key]: 'New First' }
    // let toSetObject = {'info.first': 'New First 2'}
    console.log(toSetObject)

    this.setData(toSetObject)
  },

  bindRegionChange: function (e) {
    console.log('picker发送选择改变，携带值为', e.detail.value)
    this.setData({
      region: e.detail.value
    })

    console.log(this.data.myRange)
  },

  bindColumnChange: function (e) {
    console.log('picker change', e.detail.value)
  },

  bindScroll: function (e) {
    console.log('bindScroll')
  }

})
