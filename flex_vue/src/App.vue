<script setup>
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.js';
import 'bootstrap-icons/font/bootstrap-icons.css';
import '@fortawesome/fontawesome-free/css/all.min.css';
import goToTop from './components/home/goToTop.vue';
import userPhoto from '@/components/user/userPhoto.vue';
import 'vue3-carousel/dist/carousel.css';
import { useGetApiDataStore } from './stores/useGetApiDataStore.js';
</script>

<template>
  <router-view />
  <userPhoto></userPhoto>
  <goToTop></goToTop>
</template>

<style></style>
