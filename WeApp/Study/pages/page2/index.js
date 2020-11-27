// pages/page2/index.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    itemList: [1, 2, 3],
    imgList: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    let a = '123'
    let b = 'b: '
    console.log(b)
  },

  scanTest() {
    wx.navigateTo({
      url: 'path/index?key0=value0&key1=value1',
      complete: (res) => {},
      events: events,
      fail: (res) => {},
      success: (result) => {},
    })
    
    wx.scanCode({
      success: (res) => {
        // let { path } = res
        // console.log('path: ' + path)
        let content = JSON.stringify(res)
        wx.showModal({
          // title: 'path: ' + path,
          title: 'Content: ' + content,
        })
      },
    })
  },

  /** 裁剪都为0的小数点后的数字。示例：6.0 -> 6 */
  filterNumberToDisplay(number) {
    let toFilterNumber = Number(number)
    let formattedString = toFilterNumber.toFixed(2).toString()
    let splitedArray = formattedString.split('.')
    let decimalsString = splitedArray[1]
    if (Number(decimalsString) == 0) return splitedArray[0]

    return toFilterNumber.toString()
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

  },
  
  view30Tap() {
    wx.navigateTo({ url: '/pages/page3/index' })
  },
})