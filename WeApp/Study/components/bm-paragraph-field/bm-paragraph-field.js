// components/control/bm-paragraph-field/bm-paragraph-field.js
Component({
  /**
   * 组件的属性列表
   */
  properties: {
    title: String, // 标题
    showStar: { // 是否显示必填标识，默认：是
      type: Boolean,
      value: Boolean(true),
    },
    limitedLength: { // 输入文本的限制长度
      type: Number,
      value: 50
    },
    placeholder: {
      type: String,
      value: '请输入',
    },
    text: {
      type: String,
      value: '',
      observer: function (newVal) {
        let text = newVal ? newVal : ''
        this.setData({ inputedTextLength: text.length })
      }
    }
  },

  /**
   * 组件的初始数据
   */
  data: {
    inputedTextLength: 0,
  },

  /**
   * 组件的方法列表
   */
  methods: {
    inputText: function (e) {
      let text = e.detail.value
      let textLength = text.length, limitedLength = this.data.limitedLength
      if (textLength > limitedLength) {
        text = text.slice(0, limitedLength)
        this.setData({ 'text': text })
      } else {
        this.setData({ inputedTextLength: text.length })
      }
      this.triggerEvent('inputText', text)  // 传给外部做输入值记录
    }
  }
})
