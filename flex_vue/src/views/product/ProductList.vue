<template>
  <div class="container-body">
    <ul class="d-flex flex-wrap">
      <li
        v-if="cards.length != 0"
        v-for="card in cards"
        :key="card.productId"
        class="card text-center"
      >
        <ProductCard :card="card"></ProductCard>
      </li>
      <img :src="baseAddress + 'Public/Img/no_data.png'" v-else />
    </ul>
    <div class="d-flex mb-4" style="justify-content: center">
      <button
        @click="loadMoreProducts"
        class="form-control btn btn-secondary"
        style="width: 150px"
        v-if="cards.length % 16 == 0 && cards.length != 0"
      >
        載入更多...
      </button>
    </div>
  </div>
</template>

<script setup>
import ProductCard from "@/components/product/ProductCard.vue";
import axios from "axios";
import { onMounted, ref, computed, watchEffect, watch } from "vue";
import { useRouter, useRoute } from "vue-router";
import { useProductRoute } from "@/stores/useProductRoute.js";

const route = useRoute();
const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const cards = ref([]);
const page = ref(1);
const productStore = useProductRoute();

//創建本機共用屬性
const localStorageKey = "originalPath";

//設置路徑
if (route.path.includes("/men")) {
  localStorage.setItem(localStorageKey, "/men");
} else if (route.path.includes("/women")) {
  localStorage.setItem(localStorageKey, "/women");
} else if (route.path.includes("/kid")) {
  localStorage.setItem(localStorageKey, "/kid");
} else if (route.path.includes("/sale")) {
  localStorage.setItem(localStorageKey, "/sale");
}

//取得原始路徑
const originalPath = localStorage.getItem(localStorageKey);

//監聽選擇的分類資料，一旦資料變動，重新加載 cards
//根據選擇的分類資料重新叫用API
watch(
  [
    () => route.query, //route.params,
    () => productStore.minPrice,
    () => productStore.maxPrice,
  ],
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
    url = `${baseAddress}api/Products?categoryPath=${originalPath}&categoryName=${route.query.categoryName}&page=${page.value}&minPrice=${productStore.minPrice}&maxPrice=${productStore.maxPrice}`;
  } else if (route.query.categoryName && route.query.subCategoryName) {
    url = `${baseAddress}api/Products?categoryPath=${originalPath}?categoryName=${route.query.categoryName}&subCategoryName=${route.query.subCategoryName}&page=${page.value}&minPrice=${productStore.minPrice}&maxPrice=${productStore.maxPrice}`;
  } else {
    url = `${baseAddress}api/Products?categoryPath=${originalPath}&page=${page.value}&minPrice=${productStore.minPrice}&maxPrice=${productStore.maxPrice}`;
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

const loadMoreProducts = () => {
  page.value++;
  loadProducts();
};

onMounted(() => {
  loadProducts();
});
</script>

<style></style>
