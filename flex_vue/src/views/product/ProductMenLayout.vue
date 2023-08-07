<template>
  <navBar></navBar>
  <div class="container mt-4">
    <div class="row">
      <div class="nav-category">
        <categoryNavBar></categoryNavBar>
      </div>
      <div class="container-body d-flex">
        <div class="list-group"></div>
        <router-view></router-view>
      </div>
    </div>
  </div>
</template>

<script setup>
import navBar from "@/components/home/navBar.vue";
import categoryNavBar from "@/components/product/CategoryNavBar.vue";
import searchPrice from "@/components/product/SearchPrice.vue";
</script>

<style></style>
