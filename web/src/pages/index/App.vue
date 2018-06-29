<template>
  <div id="app">
    <h1>传送门</h1>
    <ul>
      <li><a href='LDCat.html'>LDCat的主页</a></li>
      <li><a href='Kaworu.html'>whg1221的主页</a></li>
      <li><a href='YeRenXiao.html'>野人笑的主页</a></li>
    </ul>
    <copyright-component></copyright-component>
  </div>
</template>

<script>
import componentCopyright from '@/components/Copyright'

export default {
  name: 'App',
  components: {
    'copyright-component': componentCopyright
  },
  methods: {
  }
}
</script>

<style lang="less">

@import "../../assets/normalize.css";

#app {
  font-family: "Helvetica Neue",Helvetica,"PingFang SC","Hiragino Sans GB","Microsoft YaHei","微软雅黑",Arial,sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
  ul {
    padding: 0;
    line-height: 40px;
    li {
      list-style: none;
      a {
        text-decoration: none;
      }
    }
  }
}
</style>
