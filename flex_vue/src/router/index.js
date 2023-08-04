import { createRouter, createWebHistory } from "vue-router";
import Home from '../views/home/Home.vue'
import User from '../views/user/User.vue'
import ActivityInfo from '../views/activity/ActivityInfo.vue';

const webTitle = 'FLEX - ';
// 路由設定
const routes = [
  {
    //http://loaclhost/
    path: '/',
    component: Home,
    meta: { title: `${webTitle}首頁` }
  },
  {
    //http://loaclhost/User
    path: '/user',
    component: User,
    meta: { title: `${webTitle}會員` }
  },
  {
    //http://loaclhost/orders
    path: "/orders",
    component: () => import("../views/orders/orderindex.vue"),
    meta: { title: `${webTitle}訂單` }
  },
  {
    //http://loaclhost/activityInfo
    path: '/activityInfo',
    component: ActivityInfo,
    meta: { title: `${webTitle}活動` }
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes: routes
  //  變數名稱跟屬性名稱一樣可直接省略成 routes
});

router.beforeEach((to, from, next) => {
  if (to.meta.title) {
    document.title = to.meta.title
  }
  next();
})

export default router;