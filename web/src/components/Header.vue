<template>
  <div id="header" class="header">
    <ul>
      <li @click="goRouter('/')"><span :class="{'active':activeIndex === 0}">首页</span></li>
      <li @click="goRouter('ArchivedList')"><span :class="{'active':activeIndex === 1}">归档</span></li>
      <li @click="goRouter('ClassifiedList')"><span :class="{'active':activeIndex === 2}">分类</span></li>
      <li @click="goRouter('AboutMe')"><span :class="{'active':activeIndex === 3}">关于</span></li>
      <li>
        <input id="headerSearch" type="text" name="search" v-model="keyWord" :class="{'show': showSearch}">
        <span class="czs-search-l" @click="handleSearchClick"></span>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'Header',
  data () {
    return {
      activeIndex: 0,
      showSearch: false,
      keyWord: ''
    }
  },
  watch: {
    '$route' (to, from) {
      let routeName = to.name
      switch (routeName) {
        case 'ThumbnailList':
          this.activeIndex = 0
          break
        case 'ArchivedList':
          this.activeIndex = 1
          break
        case 'ClassifiedList':
          this.activeIndex = 2
          break
        case 'AboutMe':
          this.activeIndex = 3
          break
        default:
          this.activeIndex = null
          break
      }
    }
  },
  mounted () {
  },
  methods: {
    goRouter (address) {
      this.$router.push(address)
    },
    handleSearchClick () {
      if (!this.keyWord) {
        this.showSearch = !this.showSearch
      document.getElementById('headerSearch').focus()
      } else {
        console.log('doSearch')
      }
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="less">

@media only screen and (max-width: 768px) {
  p {
    color: red;
  }
}
.header {
  width: 1000px;
  margin: 0 auto;
  ul {
    padding: 0;
    li {
      list-style: none;
      display: inline-block;
      margin: 0 10px;
      cursor: pointer;
      input {
        display: none;
        border: none;
        border-bottom: 1px solid #DCDFE6;
      }
      input:focus {
        outline: none;
        border-bottom: 1px solid #409EFF;
      }
      .show {
        display: inline-block;
      }
      .czs-search-l {
        margin-left: 10px;
      }
      span:hover {
        color: #909399;
      }
    }
    .active {
      color: #409EFF;
    }
    .active:hover {
      color: #409EFF;
    }
  }
}
</style>
