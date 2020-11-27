// pages/page0/page0.js
const tool = require('../../utils/tool.js')

Page({

  /**
   * 页面的初始数据
   */
  data: {
    meTap: 'meTap',
    showControl0: 1
  },

  meTap() {
    console.log('me tap')
  },

  sayHi() {
    // console.log('say hi')
    let a = 1
    let b = '01'
    if (a == b) {
      console.log('=')
    } else {
      console.log('not =')
    }
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

    // let one
    // let obj = { first: one }
    // console.log(obj)
    // console.log(obj.value)

    // tool.sayHi()

    // let work = (a) => {
    //   let type = typeof(a)
    //   console.log('type: ' + type)
    //   if (a === false) {
    //     console.log('valid')
    //   } else {
    //     console.log('invalid')
    //   }
    // }

    // work()

    let text = ''
    if (text) {
      console.log('valid')
    } else {
      console.log('invalid')
    }

    // let text = null
    // if (text !== null && text.info == '1') {
    //   console.log('valid')
    // } else {
    //   console.log('invalid')
    // }

    // tool.user.getAccount()

    // this.sayHi(false)

    // wx.getSystemInfo({
    //   success: function(res) {
    //     console.log('res: ' + JSON.stringify(res))
    //   },
    //   fail: function(res) {},
    //   complete: function(res) {},
    // })


    // this.checkInfo()

    // let text = 120 / 10.0 + 'km'
    // console.log('text: ' + text)
  },

  testTap() {
    wx.showModal({
      title: 'hi',
      // content: 'yes',
      showCancel: false
    })
  },

  checkInfo() {
    let check = () => {
      // let { angelInfo, baseInfo, bankInfo, otherInfo, orgInfo } = this.data
      // let toCheckObj = [angelInfo, baseInfo, bankInfo, otherInfo, orgInfo]

      let obj0 = {
        first: 'one',
        second: 'two'
      }

      let obj1 = {
        frist1: 'one1',
        second: '1'
      }

      let toCheckObj = [obj0, obj1]
      for (let obj of toCheckObj) {
        for (let key in obj) {
          let value = obj[key]
          if (value == undefined || value == null || value.length === 0) {
            console.log('invalid key: ' + key)
            return 0
          }
          if (key == 'second' && value == '0') {
            console.log('invalid key and value: ' + key)
            return 0
          }
        }
      }
      return 1
    }
    
    let result = check()
    console.log('result: ' + result)
  },

  blurAction () {
    console.log('blurAction')
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow() {
    console.log('onShow')
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})