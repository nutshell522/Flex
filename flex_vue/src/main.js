// 這邊匯入App.vue的東西
import './assets/main.css';
import { useGetApiDataStore } from '@/stores/useGetApiDataStore.js';

import { createApp } from 'vue';
import { createPinia } from 'pinia';
import App from './App.vue';
import router from './router/index';
const pinia = createPinia();
// 使用 Vue Router 和 Pinia
createApp(App)
  .use(router)
  .use(pinia) // 使用 Pinia
  .mount('#app');
