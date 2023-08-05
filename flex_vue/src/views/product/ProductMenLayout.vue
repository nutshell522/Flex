<template>
  <navBar></navBar>
  <div class="container bg-black">
    <div class="row">
      <div class="container-body d-flex">
        <div class="list-group"></div>
        <router-view></router-view>
      </div>
    </div>
  </div>
</template>

<script setup>
import navBar from "@/components/home/navBar.vue";
</script>

<style></style>
