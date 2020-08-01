<!--
 * @Author: your name
 * @Date: 2020-04-19 21:11:49
 * @LastEditTime: 2020-05-01 17:13:36
 * @LastEditors: Please set LastEditors
 * @Description: In User Settingsinput
 * @FilePath: /fe/hybrid-h5/src/components/HelloWorld.vue
 -->
<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <button @click="onSendToNative">send msg to native</button>
    <h3>接收native回调：{{ callbackJsMsg }}</h3>
    {{ prompt }}
  </div>
</template>

<script>
import jsinvoke from '../jsapi/invoke'
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  },
  data() {
    return {
      callbackJsMsg: '',
      prompt: ''
    }
  },
  methods: {
    onSendToNative() {
      // js 发消息给 native,
      jsinvoke({
        cmd: 'showToast',
        data: {
          title: 'js拉起native',
          msg: 'js通知native打开原生提示'
        }
      }, (msg) => {
        console.log(window)
        this.callbackJsMsg = msg
      })
    },
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
