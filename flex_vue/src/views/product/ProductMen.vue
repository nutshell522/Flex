<template>
  <ul class="d-flex flex-wrap">
    <li v-for="card in cards" :key="card.productId" class="card text-center">
      <ProductCard :card="card"></ProductCard>
    </li>
  </ul>
</template>

<script setup>
// import ProductCard from "../components/product/ProductCard.vue";
import ProductCard from "@/components/product/ProductCard.vue";
import axios from "axios";
import { onMounted, ref } from "vue";

const baseAddress = import.meta.env.VITE_API_BASEADDRESS;

var cards = ref([]);

let loadProducts = async () => {
  await axios
    .post(`${baseAddress}api/Products/Men`)
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
