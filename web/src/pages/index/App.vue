<template>
  <div id="app">
    <h1>这里相当于是index页面</h1>
    <!-- <router-link to="/LDCat">Go to LDCat</router-link>
    <router-link to="/Wallace">Go to Wallace</router-link>
    <router-link to="/YeRenXiao">Go to YeRenXiao</router-link>
    <router-view/> -->
    <a @click="test">tlk</a>
  </div>
</template>

<script>
export default {
  name: 'App',
  methods: {
    test () {
      alert(1)
    }
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
