<!--
 * @Author: your name
 * @Date: 2020-04-19 21:11:49
 * @LastEditTime: 2020-05-01 17:06:50
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /fe/hybrid-h5/src/App.vue
 -->
<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png">
    <HelloWorld msg="Hybrid App"/>
  </div>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue'
import { getTianjiVolumeInfo } from './device'
export default {
  name: 'App',
  components: {
    HelloWorld
  },
  mounted() {
    getTianjiVolumeInfo({a:1}, res => {
      console.log(res)
      if(res && res.data && res.success) {
        console.log(res.data.height)
      }
    })
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
