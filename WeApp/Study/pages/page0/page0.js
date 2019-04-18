// pages/page0/page0.js
Page({

  /**
   * 页面的初始数据
   */
  data: {

  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    // wx.getSystemInfo({
    //   success: function(res) {
    //     console.log('res: ' + JSON.stringify(res))
    //   },
    //   fail: function(res) {},
    //   complete: function(res) {},
    // })


    // this.checkInfo()

    let text = 120 / 10.0 + 'km'
    console.log('text: ' + text)
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
  onShow: function () {

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