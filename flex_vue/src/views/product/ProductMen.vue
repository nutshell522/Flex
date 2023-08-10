<template>
  <div class="container-body d-flex">
    <ul class="d-flex flex-wrap">
      <li v-for="card in cards" :key="card.productId" class="card text-center">
        <ProductCard :card="card"></ProductCard>
      </li>
    </ul>
  </div>
</template>

<script setup>
import ProductCard from "@/components/product/ProductCard.vue";
import axios from "axios";
import { onMounted, ref, computed, watchEffect, watch } from "vue";
import { useRouter, useRoute } from "vue-router";

const baseAddress = import.meta.env.VITE_API_BASEADDRESS;

const cards = ref([]);

//監聽選擇的分類資料，一旦資料變動，重新加載 cards
//根據選擇的分類資料重新叫用API
const route = useRoute();

// 獲取當前的路由參數
//const id = route.params.id;

// 獲取查詢參數
//const query = route.query;

watch(
  () => route.query, //route.params,
  () => {
    loadProducts();
  }
);

const loadProducts = async () => {
  let url;
  // if (route.params.categoryName && !route.params.subCategoryName) {
  //   url = `${baseAddress}api/Products/Men?categoryName=${route.params.categoryName}`;
  // } else if (route.params.categoryName && route.params.subCategoryName) {
  //   url = `${baseAddress}api/Products/Men?categoryName=${route.params.categoryName}&subCategoryName=${route.params.subCategoryName}`;
  // } else {
  //   url = `${baseAddress}api/Products/Men`;
  // }
  if (route.query.categoryName && !route.query.subCategoryName) {
    url = `${baseAddress}api/Products/Men?categoryName=${route.query.categoryName}`;
  } else if (route.query.categoryName && route.query.subCategoryName) {
    url = `${baseAddress}api/Products/Men?categoryName=${route.query.categoryName}&subCategoryName=${route.query.subCategoryName}`;
  } else {
    url = `${baseAddress}api/Products/Men`;
  }
  //console.log(url);
  await axios
    .get(url)
    .then((response) => {
      //console.log(response.data);
      cards.value = response.data;
    })
    .catch((error) => {
      alert(error);
    });
};
onMounted(() => {
  loadProducts();
});
</script>

<style></style>
