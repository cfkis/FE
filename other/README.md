* Vue对象脱离响应式
  ### 场景
  假设在data上存在formModel = { name: '', age: '', addr: '' } 通过v-model绑定在表单中
  随后我们去后台拉取数据填充formModel, 可能会这样操作【 this.formModel = response.data 】,咋一看没什么问题，
  除非response.data中有所有formModel中的字段，否则缺失的字段就会失去响应，
  比如 response.data = { name : '', age: '' }，此时formModel中的addr就失去响应。
  ### 解决办法
  这种问题开发中比较常见，接口返回并不总是预期那样。推荐使用Object.assign()。
  当然这会使得一些无用属性变得响应式，根据实际情况处理，这里主要想强调的是 <b>“不要被预期数据欺骗”</b>，因为数据不总是那样。