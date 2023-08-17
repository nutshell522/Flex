<template>
  <navBar></navBar>
  <userBar></userBar>
  <div class="container likeProductCard">
    <div
      class="likeProduct"
      v-for="(product, index) in likeProducts"
      :key="index"
    >
      <div>
        <label>{{ product.productName }}</label>
      </div>
      <div>
        <label>價格: {{ product.unitPrice }}</label>
      </div>
      <div>
        <label>Sales Price: {{ product.salesPrice }}</label>
      </div>
      <div class="detailImgList">
        <img
          src="https://localhost:7183/Public/Img/550af4ee0a2047d69bf578c0bbe63fa7.jpg"
        />
      </div>
    </div>
  </div>
</template>

<script setup>
import navBar from '@/components/home/navBar.vue';
import userBar from '@/components/user/userBar.vue';
import { ref, onMounted } from 'vue';
import axios from 'axios';

//const likeProductNames = ref([]);
const likeProducts = ref([]);
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
    // const uri = `${baseAddress}/Users/SaveFavorites?memberId=${userObject.memberId}`;
    // axios
    //   .get(uri)
    //   .then((res) => {
    //     console.log('喜愛商品的id', res.data);
    //   })
    //   .catch((err) => {
    //     err;
    //   });
    //呼叫api透過喜愛商品Id把商品湯圓取出來
    const getLikeProductUri = `${baseAddress}/Users/GetFavorites?memberId=${userObject.memberId}`;
    https: axios
      .get(getLikeProductUri)
      .then((res) => {
        likeProducts.value = res.data;
        //console.log('商品湯圓', likeProducts);
      })
      .catch((err) => {
        err;
      });
  }
});
</script>

<style scoped>
.likeProductCard {
  display: flex;
}
.likeProduct {
  border: 1px solid;
  align-items: center;
  display: flex;
}
.detailImgList {
  width: 100%;
  height: auto;
  display: block;
}
</style>
