<script setup>
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.js';
import 'bootstrap-icons/font/bootstrap-icons.css';
import '@fortawesome/fontawesome-free/css/all.min.css';
import { useGetApiDataStore } from './stores/useGetApiDataStore.js';

// const store = useGetApiDataStore();
// const clickAdd = () => {
//   store.addCount();
// };
</script>

<template>
  <!-- <button @click="clickAdd">click</button> -->
  <router-view />
</template>

<style scoped></style>
