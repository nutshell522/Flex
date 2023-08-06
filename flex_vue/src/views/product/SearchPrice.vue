<template>
  <input type="number" class="form-control" v-model="minPrice" min="0" />
  <span>~</span>
  <input type="number" class="form-control" v-model="maxPrice" min="0" />
</template>

<script setup>
import { ref } from "vue";
const minPrice = ref("");
const maxPrice = ref("");
</script>

<style></style>
