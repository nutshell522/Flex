<template>
    <ShoesnavBar></ShoesnavBar>
    <div class="container mt-4">
      <div class="row">
        <div class="nav-category">
          <ShoesCategoryBar></ShoesCategoryBar>
        </div>
        <div class="container-body d-flex">
          <div class="list-group"></div>
          <router-view></router-view>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import ShoesnavBar from "@/components/customeShoes/ShoesnavBar.vue";
  import ShoesCategoryBar from "@/components/customeShoes/ShoesCategoryBar.vue";
  </script>
  
  <style></style>