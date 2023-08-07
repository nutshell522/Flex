<template>
  <navBar></navBar>
  <main>
    <div class="container">
      <div class="row gx-4">
        <div class="left col-12 col-lg-8">
          <ul class="d-flex flex-wrap">
            <li v-for="cartItem in cartItems" :key="cartItems.cartItemId" class="card text-center">
              <span>{{ cartItem.product.productSaleId }}</span>
            </li>
          </ul>
        </div>
        <div class="right col-12 col-lg-4">
          <div class="bg-primary"></div>
        </div>
      </div>
    </div>
  </main>
  <homeFooter></homeFooter>
</template>
    
<script setup lang="ts">
import ProductCard from "@/components/product/ProductCard.vue";
import NavBar from '@/components/home/NavBar.vue';
import HomeFooter from '@/components/home/Footer.vue';
import axios from "axios";
import { onMounted, ref, computed, watchEffect, watch } from "vue";
import { useRouter, useRoute } from "vue-router";

// 用vite獲得環境變數
const baseAddress = import.meta.env.VITE_API_BASEADDRESS;

const cartItems = ref([]);

const loadCartItems = async () => {
  const route = useRoute();

  let url: string;

  url = `${baseAddress}api/Cart`;
  const cards = ref([]);
  await axios
    .post(url)
    .then((response) => {
      console.log(response.data);
      cartItems.value = response.data;
    })
    .catch((error) => {
      alert(error);
    });
};

loadCartItems();
// 在這裡聲明可能用到的類型

onMounted(() => {
  // 執行組件掛載後的初始化程式碼
});

const someData = ref<string>(""); // 使用 ref 定義響應式數據
const computedValue = computed(() => {
  // 定義計算屬性的計算邏輯
});

watchEffect(() => {
  // 註冊一個副作用，監聽響應式數據的變化
});

watch(someData, (newValue, oldValue) => {
  // 監聽 someData 的變化並執行回調函式
});

</script>
    
<style lang="scss">
main {
  margin-top: 40px;
  padding-bottom: 120px;

  .row {
    &>.left {
      &>div {}
    }

    &>.right {
      &>div {}
    }
  }
}
</style>