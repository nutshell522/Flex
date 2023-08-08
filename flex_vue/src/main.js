// 這邊匯入App.vue的東西
import './assets/main.css';

import { createApp } from 'vue';
import { createPinia } from 'pinia';
import App from './App.vue';
import router from './router/index';

const pinia = createPinia();

// 使用 Vue Router 和 Pinia
const app = createApp(App);
app.use(router);
app.use(pinia); // 使用 Pinia
app.mount('#app');
