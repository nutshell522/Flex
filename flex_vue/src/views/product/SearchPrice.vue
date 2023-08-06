<template>
  <input
    type="number"
    class="form-control"
    v-model="minPrice"
    @input="inputMinHandler"
    min="0"
  />
  <span>~</span>
  <input
    type="number"
    class="form-control"
    v-model="maxPrice"
    @input="inputMinHandler"
    min="0"
  />
</template>

<script setup>
import { ref } from "vue";
const minPrice = ref("");
const maxPrice = ref("");

const inputMinHandler=()=>{
    if(minPrice.value>maxPrice.value)
}
</script>

<style></style>
