<template>
  <navBar></navBar>
  <userBar></userBar>
  <div class="container">
    <div
      class="col-md-6 likeProductCard"
      v-for="(productName, index) in likeProductNames"
      :key="index"
    >
      <label>{{ productName }}</label>
    </div>
  </div>
</template>

<script setup>
import navBar from '@/components/home/navBar.vue';
import userBar from '@/components/user/userBar.vue';
import { ref, onMounted } from 'vue';

const likeProductNames = ref([]);

onMounted(() => {
  // 判斷使用者id從 localstorage 撈出來
  // const savedLikeProduct = localStorage.getItem('likeProduct');
  // if (savedLikeProduct) {
  //   likeProductNames.value = JSON.parse(savedLikeProduct);
  // }
});
</script>

<style scoped>
.likeProductCard {
  border: 1px solid;
  width: 50%;
}
</style>
