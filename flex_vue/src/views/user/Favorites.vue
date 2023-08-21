<template>
  <navBar></navBar>
  <userBar></userBar>
  <div
    class="container likeProductCard"
    v-for="(product, index) in likeProducts"
    :key="index"
  >
    <div class="card mb-3 likeCard">
      <div class="row g-0">
        <div class="col-md-4">
          <!-- <img
            src="https://localhost:7183/Public/Img/550af4ee0a2047d69bf578c0bbe63fa7.jpg"
          /> -->
          <img :src="baseAddress + 'Public/Img/' + product.firstImgPath" />
        </div>
        <div class="col-md-8">
          <div class="card-body">
            <h5 class="card-title">{{ product.productName }}</h5>
            <p class="card-text">{{ product.unitPrice }}</p>
            <p class="card-text">{{ product.salesPrice }}</p>
            <div class="allBtn">
              <div class="likeBtn">
                <button class="" style="font-size: 20px" @click="collect">
                  <i class="bi bi-heart" style="color: red" v-if="!like"></i
                  ><i class="bi bi-heart-fill" style="color: red" v-else></i>
                </button>
              </div>
              <div>
                <button style="font-size: 20px">
                  <i class="bi bi-cart4"></i>
                </button>
              </div>
            </div>
          </div>
        </div>
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
const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const likeProducts = ref([]);
const like = ref(true);

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
    const getLikeProductUri = `${baseAddress}/Users/GetFavorites?memberId=${userObject.memberId}`;
    https: axios
      .get(getLikeProductUri)
      .then((res) => {
        likeProducts.value = res.data;
        console.log('商品湯圓', likeProducts);
      })
      .catch((err) => {
        err;
      });
  }
});
// 77如果不要綁在一起
function collect() {
  like.value = !like.value;
  if (like.value) {
  }
}
</script>

<style scoped>
.likeProductCard {
  display: flex;
}
.likeCard {
  max-width: 540px;
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
.allBtn {
  display: flex;
}
.likeBtn {
  margin-right: 15px;
}
</style>
