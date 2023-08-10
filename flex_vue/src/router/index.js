import { createRouter, createWebHistory } from "vue-router";
import Home from "../views/home/Home.vue";
import User from "../views/user/User.vue";
import Login from "../views/user/Login.vue";
import ActivityInfo from "../views/activity/ActivityInfo.vue";
import ActivitySignUp from "../views/activity/ActivitySignUp.vue";
const webTitle = "FLEX - ";

// 路由設定
const routes = [
  {
    //http://loaclhost/
    path: "/",
    component: Home,
    meta: { title: `${webTitle}首頁` },
  },
  {
    //http://loaclhost/
    path: "/cart",
    component: () => import("../views/home/Cart.vue"),
    meta: { title: `${webTitle}購物車` },
  },
  {
    //http://loaclhost/User
    path: "/user",
    component: User,
    meta: { title: `${webTitle}會員` },
  },
  {
    //http://loaclhost/Login
    path: "/login",
    component: Login,
  },
  {
    //http://loaclhost/orders
    path: "/orders",
    component: () => import("../views/orders/orderindex.vue"),
    meta: { title: `${webTitle}訂單` },
  },
  {
    //http://loaclhost/activityInfo
    path: "/activityInfo",
    component: ActivityInfo,
    meta: { title: `${webTitle}活動` },
  },
  {
    //http://loaclhost/activitySignUp
    path: "/activitySignUp",
    component: ActivitySignUp,
    meta: { title: `${webTitle}活動報名` },
  },
  {
    //http://loaclhost/Login
    path: "/login",
    component: Login,
  },
  {
    //http://loaclhost/Men
    path: "/men",
    component: () => import("../views/product/ProductMenLayout.vue"),
    children: [
      {
        path: "",
        component: () => import("../views/product/ProductList.vue"),
        meta: { title: `${webTitle}男裝` },
      },
      {
        path: ":categoryName",
        component: () => import("../views/product/ProductList.vue"),
        meta: {},
        beforeEnter(to, from, next) {
          document.title = `${webTitle}男裝/${to.params.categoryName}`;
          next();
        },
      },
      {
        path: ":categoryName/:subCategoryName",
        component: () => import("../views/product/ProductList.vue"),
        meta: {},
        beforeEnter(to, from, next) {
          document.title = `${webTitle}男裝/${to.params.categoryName}/${to.params.subCategoryName}`;
          next();
        },
      },
      {
        // 當 /ProductMenLayout/:id/posts 匹配成功
        // Detial.vue 將被渲染到 ProductMenLayout 的 <router-view> 内部，替換card.vue
        path: "detail/:productId",
        component: () => import("../views/product/ProductDetail.vue"),
        meta: {},
        beforeEnter(to, from, next) {
          document.title = `${webTitle}${to.params.productId}`;
          next();
        },
      },
    ],
  },
  {
    //http://loaclhost/Women
    path: "/women",
    component: () => import("../views/product/ProductWomenLayout.vue"),
    children: [
      {
        path: "",
        component: () => import("../views/product/ProductList.vue"),
        meta: { title: `${webTitle}女裝` },
      },
      {
        path: ":categoryName",
        component: () => import("../views/product/ProductList.vue"),
        meta: {},
        beforeEnter(to, from, next) {
          document.title = `${webTitle}女裝/${to.params.categoryName}`;
          next();
        },
      },
      {
        path: ":categoryName/:subCategoryName",
        component: () => import("../views/product/ProductList.vue"),
        meta: {},
        beforeEnter(to, from, next) {
          document.title = `${webTitle}女裝/${to.params.categoryName}/${to.params.subCategoryName}`;
          next();
        },
      },
      {
        // 當 /ProductMenLayout/:id/posts 匹配成功
        // Detial.vue 將被渲染到 ProductMenLayout 的 <router-view> 内部，替換card.vue
        path: "detail/:productId",
        component: () => import("../views/product/ProductDetail.vue"),
        meta: {},
        beforeEnter(to, from, next) {
          document.title = `${webTitle}${to.params.productId}`;
          next();
        },
      },
    ],
  },
  {
    //http://loaclhost/Kid
    path: "/kid",
    component: () => import("../views/product/ProductKidLayout.vue"),
    children: [
      {
        path: "",
        component: () => import("../views/product/ProductList.vue"),
        meta: { title: `${webTitle}童裝` },
      },
      {
        path: ":categoryName",
        component: () => import("../views/product/ProductList.vue"),
        meta: {},
        beforeEnter(to, from, next) {
          document.title = `${webTitle}童裝/${to.params.categoryName}`;
          next();
        },
      },
      {
        path: ":categoryName/:subCategoryName",
        component: () => import("../views/product/ProductList.vue"),
        meta: {},
        beforeEnter(to, from, next) {
          document.title = `${webTitle}童裝/${to.params.categoryName}/${to.params.subCategoryName}`;
          next();
        },
      },
      {
        // 當 /ProductMenLayout/:id/posts 匹配成功
        // Detial.vue 將被渲染到 ProductMenLayout 的 <router-view> 内部，替換card.vue
        path: "detail/:productId",
        component: () => import("../views/product/ProductDetail.vue"),
        meta: {},
        beforeEnter(to, from, next) {
          document.title = `${webTitle}${to.params.productId}`;
          next();
        },
      },
    ],
  },
  {
    //http://loaclhost/CustomeShoes
    path: "/CustomeShoes",
    component: () => import("../views/CustomeShoes/CustomeShoesLayout.vue"),
    children: [
      {
        path: "",
        component: () => import("../views/CustomeShoes/CustomeShoesAll.vue"),
      },
      {
        path: ":shoescategoryName",
        component: () => import("../views/CustomeShoes/CustomeShoesAll.vue"),
      },
      {
        //http://loaclhost/Login
        path: "/login",
        component: Login,
      },
    ],
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes: routes,
  //  變數名稱跟屬性名稱一樣可直接省略成 routes
});

router.beforeEach((to, from, next) => {
  if (to.meta.title) {
    document.title = to.meta.title;
  }
  next();
});

export default router;
