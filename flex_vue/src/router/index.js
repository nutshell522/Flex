import { createRouter, createWebHistory } from 'vue-router';
import Home from '../views/home/Home.vue';
import User from '../views/user/User.vue';
import Login from '../views/user/Login.vue';
import ActivityInfo from '../views/activity/ActivityInfo.vue';
// 路由設定
const routes = [
  {
    //http://loaclhost/
    path: '/',
    component: Home,
  },
  {
    //http://loaclhost/User
    path: '/user',
    component: User,
  },
  {
    //http://loaclhost/Login
    path: '/login',
    component: Login,
  },
  {
    //http://loaclhost/Men
    path: '/orders',
    component: () => import('../views/orders/orderindex.vue'),
  },
  {
    //http://loaclhost/activityInfo
    path: '/activityInfo',
    component: ActivityInfo,
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes: routes,
  //  變數名稱跟屬性名稱一樣可直接省略成 routes
});

export default router;
