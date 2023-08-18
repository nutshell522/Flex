<template>
  <div>
    <h5 class="searchBoxColor">價格搜尋:</h5>
    <input
      type="text"
      v-model="minPrice"
      min="0"
      class="form-control mb-1"
      placeholder="最低價格"
      @input="minPriceHandler"
    />
    <input
      type="text"
      v-model="maxPrice"
      min="0"
      class="form-control mb-3"
      placeholder="最高價格"
      @input="maxPriceHandler"
    />
    <button
      class="form-control setBtnColor setBtnColorHover"
      @click="searchPriceHandler"
    >
      送出
    </button>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { useProductRoute } from "@/stores/useProductRoute.js";

const productStore = useProductRoute();
const minPrice = ref(productStore.minPrice);
const maxPrice = ref(productStore.maxPrice);

const minPriceHandler = (event) => {
  minPrice.value = event.target.value.replace(/\D/g, "");
};

const maxPriceHandler = (event) => {
  maxPrice.value = event.target.value.replace(/\D/g, "");
};

const searchPriceHandler = () => {
  productStore.setPriceInfo(minPrice.value, maxPrice.value);
};

// const emit = defineEmits(["searchPriceInput"]);
// const searchPriceHandler = () => {
//   emit("searchPriceInput", minPrice.value, maxPrice.value);
// };
</script>

<style>
.searchBoxColor {
  color: #83521e;
}
.setBtnColor {
  background-color: #83521e;
  color: white;
}

.setBtnColor:hover {
  background-color: white;
  color: #83521e;
  border: 1px solid #83521e;
}
</style>
