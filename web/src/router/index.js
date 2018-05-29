import Vue from 'vue'
import Router from 'vue-router'
import Default from '@/components/Default'
import LDCat from '@/views/LDCat'
import Wallace from '@/views/Wallace'
import YeRenXiao from '@/views/YeRenXiao'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Default',
      component: Default
    },
    {
      path: '/LDCat',
      name: 'LDCat',
      component: LDCat
    },
    {
      path: '/Wallace',
      name: 'Wallace',
      component: Wallace
    },
    {
      path: '/YeRenXiao',
      name: 'YeRenXiao',
      component: YeRenXiao
    }
  ]
})
