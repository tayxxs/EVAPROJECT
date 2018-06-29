<template>
  <div id="footerCopyright" :class="{'fixed-bottom':fixedBottom}">
    <p>© {{year}} whg1221</p>
    <p>Theme By whg1221</p>
  </div>
</template>

<script>
export default {
  name: 'Copyright',
  data () {
    return {
      year: '',
      fixedBottom: false
    }
  },
  mounted () {
    this.year = new Date().getFullYear()
    this.setFooterClass()
  },
  methods: {
    setFooterClass () {
      let clientHeight = document.documentElement.clientHeight
      let offsetTop = document.getElementById('footerCopyright').offsetTop
      let offsetHeight = document.getElementById('footerCopyright').offsetHeight
      if (clientHeight - offsetHeight > offsetTop) {
        this.fixedBottom = true
      }
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
div p {
  font-size: 12px;
  color: #C0C4CC;
}
.fixed-bottom {
  position: absolute;
  width: 100%;
  bottom: 0;
}
</style>
