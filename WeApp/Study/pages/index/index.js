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

    myRange: [],

    pickerList: [],
    startHours: [],
    startMinutes: []
  },

  onLoad() {
    this.myMethod({
      success: (data) => {
        console.log(JSON.stringify(data))
      }
    })

    let startHours = []
    for (let i = 0; i < 24; i++) {
      startHours = [...startHours, i]
    }

    let startMinutes = []
    for (let i = 0; i < 60; i++) {
      startMinutes = [...startMinutes, i]
    }

    this.setData({ startHours, startMinutes })

    let text = '01'
    console.log('text: ' + Number(text))
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
  },

  selectAddress: function (e) {
    console.log('selectAddress')
    wx.chooseLocation({
      success: function(res) {},
      fail: function(res) {},
      complete: function(res) {},
    })
  },

  testTap (e) {
    console.log('test tap')
    console.log('e: \n' + JSON.stringify(e))

    this.myMethod()
  },

  myMethod () {
    console.log('my method')
  },

  tap0(e) {
    console.log('tap0: \n')
    console.log(JSON.stringify(e))
  },

  myTap(e) {
    console.log('myTap')
    console.log(JSON.stringify(e))
  },

  share() {
    console.log('share')
    wx.showShareMenu({
      withShareTicket: true,
      success: function(res) {},
      fail: function(res) {},
      complete: function(res) {},
    })
  },

  myMethod({success, fail}) {
    if (success) success({
      first: 'one',
      second: 'two'
    })
  },

  pickEnd(e) {
    console.log('pickEnd: ' + e.detail)
  },

  pickChange(e) {
    console.log('bindchange: ' + JSON.stringify(e.detail))
  },

  changePage() {
    wx.redirectTo({
      url: '/pages/logs/logs'
    })
  },

  onShareAppMessage() {
    console.log('my share')
  }
})
