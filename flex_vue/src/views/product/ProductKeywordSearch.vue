<template>
  <navBar></navBar>
  <div class="container mt-4">
    <ul
      class="d-flex mt-4"
      style="align-items: center; justify-content: center"
    >
      <a href="#" class="col-3">
        <li
          :class="{
            searchCategory: true,
            searchCategoryActive: activeIndex == 0,
          }"
          @click="searchCategoryClick(0)"
        >
          All
        </li>
      </a>
      <a href="#" class="col-3">
        <li
          :class="{
            searchCategory: true,
            searchCategoryActive: activeIndex == 1,
            margins3: true,
          }"
          @click="searchCategoryClick(1)"
        >
          Men
        </li>
      </a>
      <a href="#" class="col-3">
        <li
          :class="{
            searchCategory: true,
            searchCategoryActive: activeIndex == 2,
            margins3: true,
          }"
          @click="searchCategoryClick(2)"
        >
          Women
        </li>
      </a>
      <a href="#" class="col-3"
        ><li
          :class="{
            searchCategory: true,
            searchCategoryActive: activeIndex == 3,
            margins3: true,
          }"
          @click="searchCategoryClick(3)"
        >
          Kid
        </li></a
      >
    </ul>
    <ul class="d-flex flex-wrap" style="margin-left: 130px">
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
  </div>
</template>

<script setup>
import navBar from "@/components/home/navBar.vue";
import ProductCard from "@/components/product/ProductCard.vue";
import { onMounted, ref, watch } from "vue";
import { useRoute, useRouter } from "vue-router";
import axios from "axios";
const route = useRoute();
const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const cards = ref([]);
const activeIndex = ref(0);

const getSearchKeywordProducts = async (clickSalesId) => {
  if (clickSalesId) {
    await axios
      .get(
        `${baseAddress}api/Products/SearchProductByKeyword?keyword=${route.params.keyWord}&salesId=${clickSalesId}`
      )
      .then((response) => {
        cards.value = response.data;
      })
      .catch((error) => {
        alert(error);
      });
  } else {
    await axios
      .get(
        `${baseAddress}api/Products/SearchProductByKeyword?keyword=${route.params.keyWord}`
      )
      .then((response) => {
        cards.value = response.data;
      })
      .catch((error) => {
        alert(error);
      });
  }
};

const searchCategoryClick = (clickSalesId) => {
  getSearchKeywordProducts(clickSalesId);
  activeIndex.value = clickSalesId;
};
watch(
  () => route.params.keyWord,
  () => {
    getSearchKeywordProducts();
  }
);

onMounted(() => {
  getSearchKeywordProducts();
});
</script>

<style>
.searchCategory {
  background-color: rgb(221, 221, 221);
  font-size: 20px;
  font-weight: 400;
  min-width: 100px;
  min-height: 35px;
  text-align: center;
}
.searchCategoryActive {
  background-color: #4d3028;
  color: white;
}
.margins3 {
  margin-left: 10px;
}
</style>
