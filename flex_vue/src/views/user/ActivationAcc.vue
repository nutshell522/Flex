<template>
  <div class="container area">
    <h2 class="title">帳號開通成功</h2>
    <div class="loginBtn btn">
      <button @click="loginBtn">馬上登入</button>
    </div>
  </div>
</template>

<script setup>
import router from '@/router/index.js';
import { onMounted } from 'vue';
import axios from 'axios';
import { useRoute } from 'vue-router';

const route = useRoute();
const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const uri = `${baseAddress}api/Users/ActivationAccount?memberAcc=${route.query.memberAcc}&confirmCode=${route.query.confirmCode}`;

onMounted(() => {
  axios
    .get(uri)
    .then((res) => {
      console.log(res);
    })
    .catch((err) => {
      console.log(err);
    });
});

function loginBtn() {
  window.location.href = '/login';
}
</script>

<style scoped>
.title {
  display: flex;
  justify-content: center;
}
.area {
  border: 1px solid;
  max-width: 20%;
  padding: 30px;
  margin-top: 200px;
}

.loginBtn {
  background-color: #bb3e20;
  color: white;
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
