<template>
  <navBar></navBar>
  <userBar></userBar>
  <div class="container">
    <div class="col-md-6 likeProductCard">
      <label for="">{{ likeProductName }}</label>
    </div>
  </div>
</template>

<script setup>
import navBar from '@/components/home/navBar.vue';
import userBar from '@/components/user/userBar.vue';
import { ref, onMounted } from 'vue';

const likeProductName = ref('');

//判斷使用者id從localstorege撈出來
onMounted(() => {
  const savedLikeProduct = localStorage.getItem('likeProduct');
  if (likeProductName) {
    likeProductName.value = savedLikeProduct;
  }
  //console.log('savedLikeProduct', savedLikeProduct);
});
//顯示
</script>

<style scoped>
.likeProductCard {
  border: 1px solid;
  width: 50%;
}
</style>
