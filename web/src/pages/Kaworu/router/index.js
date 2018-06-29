import Vue from 'vue'
import Router from 'vue-router'
import ThumbnailList from '@/components/ThumbnailList'// 默认平铺文章列表
import ArchivedList from '@/components/ArchivedList'// 归档
import ClassifiedList from '@/components/ClassifiedList'// 分类
import Article from '@/components/Article'// 博文
import AboutMe from '@/components/AboutMe'// 关于

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'ThumbnailList',
      component: ThumbnailList
    }, {
      path: '/ArchivedList',
      name: 'ArchivedList',
      component: ArchivedList
    }, {
      path: '/ClassifiedList',
      name: 'ClassifiedList',
      component: ClassifiedList
    }, {
      path: '/Article',
      name: 'Article',
      component: Article
    }, {
      path: '/AboutMe',
      name: 'AboutMe',
      component: AboutMe
    }
  ]
})
