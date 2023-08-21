// 這邊匯入App.vue的東西
import "./assets/main.css";
import { useGetApiDataStore } from "@/stores/useGetApiDataStore.js";
import { createApp } from "vue";
import { createPinia } from "pinia";
import App from "./App.vue";
import router from "./router/index";
import vue3GoogleLogin from "vue3-google-login";
import coupon from "v-coupon";

const pinia = createPinia();
const CLIENT_ID =
  "355151080332-19lpj0fcsfk9nihnrcvjulft4cp09j7i.apps.googleusercontent.com";

// 使用 Vue Router 和 Pinia
createApp(App)
  .use(router)
  .use(pinia) // 使用 Pinia
  .use(vue3GoogleLogin, { clientId: CLIENT_ID })
  .use(coupon)
  .mount("#app");
