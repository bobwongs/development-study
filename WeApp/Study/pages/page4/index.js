// pages/page4/index.js
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

    this.test()
    return

    let e
    if (e == null) {
      console.log('e is null')
      return
    } else {
      console.log('e is not null')
      return
    }

    let obj = {
      "communityShopInfo.storeCode": e.storeCode,
    }
    console.log(obj)
  },

  test(e) {
    console.log('test e:' + e)
    if (e == undefined || e == null) {
      console.log('test e: null')
    } else {
      console.log('test e: not null')
    }
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