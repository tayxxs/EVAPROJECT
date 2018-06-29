<template>
  <div id="app">
    <header-component></header-component>
    <router-view></router-view>
    <copyright-component></copyright-component>
  </div>
</template>

<script>
import componentHeader from '@/components/Header'
import componentCopyright from '@/components/Copyright'

export default {
  name: 'Kaworu',
  components: {
    'header-component': componentHeader,
    'copyright-component': componentCopyright
  },
  methods: {
  }
}
</script>

<style lang="less">

@import "../../assets/normalize.css";
@import "../../assets/strawberryicon/style.css";

#app {
  font-family: "Helvetica Neue",Helvetica,"PingFang SC","Hiragino Sans GB","Microsoft YaHei","微软雅黑",Arial,sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

</style>
