<template>
  <navBar @UpdateCart="getUpdateFunc"></navBar>
  <div class="container mt-4">
    <div class="row">
      <div class="nav-category">
        <categoryNavBar></categoryNavBar>
        <searchPrice style="position: absolute; top: 460px; width: 140px"></searchPrice>
      </div>
      <router-view :updateCartFunction="updateCartFunction"></router-view>
    </div>
  </div>
</template>

<script setup>
import navBar from "@/components/home/navBar.vue";
import categoryNavBar from "@/components/product/CategoryNavBar.vue";
import searchPrice from "@/components/product/SearchPrice.vue";
import { ref } from 'vue';
const updateCartFunction = ref(null);
const getUpdateFunc = (func) => {
  updateCartFunction.value = func;
};
</script>

<style></style>
