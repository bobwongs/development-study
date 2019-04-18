// components/custom/custom.js
Component({
  externalClasses: ['my-class'],
  /**
   * 组件的属性列表
   */
  properties: {
    name: {
      type: String,
      value: 'bob'
    }
  },

  /**
   * 组件的初始数据
   */
  data: {
    log: 'this is the log'
  },

  /**
   * 组件的方法列表
   */
  methods: {
    bindKeyInput(e) {
      console.log('bindKeyInput: ' + e)
    },

    bindconfirm(e) {
      let log = this.data.log + '+\n' + 'bindconfirm'
      this.setData({ log })
    },

    bindblur(e) {
      let log = this.data.log + '+\n' + 'bindblur'
      this.setData({ log })
    },

    tap() {
      this.triggerEvent('tap')
    }
  }
})
