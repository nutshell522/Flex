import { createRouter, createWebHistory } from "vue-router";
import Home from "../views/Home.vue";

// 路由設定
const routes = [
  {
    //http://loaclhost/
    path: "/",
    component: Home,
  },
  {
    //http://loaclhost/Men
    path: "/men",
    component: () => import("../views/ProductMenLayout.vue"),
    children: [
      {
        path: "",
        component: () => import("../views/ProductMen.vue"),
      },
      {
        // 当 /user/:id/posts 匹配成功
        // UserPosts 将被渲染到 User 的 <router-view> 内部
        path: "detail/:prdouctId",
        component: () => import("../views/ProductDetail.vue"),
      },
    ],
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes: routes,
  //  變數名稱跟屬性名稱一樣可直接省略成 routes
});

export default router;
