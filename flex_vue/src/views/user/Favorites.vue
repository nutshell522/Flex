<template>
  <navBar></navBar>
  <userBar></userBar>
  <div class="container">
    <div class="col-md-6 likeProductCard">
      <label>{{ productName }}</label>
    </div>
  </div>
</template>

<script setup>
import navBar from '@/components/home/navBar.vue';
import userBar from '@/components/user/userBar.vue';
import { ref, onMounted } from 'vue';
import axios from 'axios';

const likeProductNames = ref([]);

onMounted(() => {
  // 判斷使用者id從 localstorage 撈出來
  // const savedLikeProduct = localStorage.getItem('likeProduct');
  // if (savedLikeProduct) {
  //   likeProductNames.value = JSON.parse(savedLikeProduct);
  // }

  //檢查本地儲存是否有登錄信息
  const storedUser = localStorage.getItem('loggedInUser');
  const userObject = JSON.parse(storedUser);
  if (storedUser) {
    //呼叫api把喜愛商品Id取出來
    const baseAddress = 'https://localhost:7183/api';
    const uri = `${baseAddress}/Users/Favorites?memberId=${userObject.memberId}`;
    axios
      .get(uri)
      .then((res) => {
        console.log(res.data);
      })
      .catch((err) => {
        err;
      });
    //呼叫api透過喜愛商品Id把商品湯圓取出來
    const setUri = ``;
    axios
      .get()
      .then((res) => {
        res.data;
      })
      .catch((err) => {
        err;
      });
  }
});
</script>

<style scoped>
.likeProductCard {
  border: 1px solid;
  width: 50%;
}
</style>
