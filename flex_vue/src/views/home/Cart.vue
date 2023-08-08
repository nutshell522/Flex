<template>
  <navBar></navBar>
  <main>
    <div class="container">
      <div class="row gx-4">
        <div class="left col-12 col-lg-8">
          <ul class="cart">
            <li v-for="cartItem in cartItems" :key="cartItem.cartItemId" class="cart-item">
              <a class="pd-img-wrapper" href="javascript:;">
                <img :src="imgBaseUrl + 'Public/Img/' + cartItem.product.imgPath" :title="cartItem.product.productName" />
              </a>
              <div class="item-info-wrapper me-auto">
                <a href="javascript:;" class="fw-bold">{{ cartItem.product.productName }}-{{ cartItem.product.salesCategoryNameStr }}-{{ cartItem.product.color }}</a>
                <div>尺寸 <a href="javascript:;"><span>{{ cartItem.product.size }}</span><i class="bi bi-chevron-down"></i></a></div>
                <ul class="d-flex px-0">
                <li class="me-2" v-for="matchDiscount in cartItem.product.matchDiscounts" :key="matchDiscount.discountId">
                  <a href="javascript:;">{{ matchDiscount.discountName }}</a>
                </li>
              </ul>
              </div>
              <div>
                <div class="d-flex">
                  <button><i class="bi bi-dash-lg"></i></button>
                  <div>{{ cartItem.qty }}</div>
                  <button><i class="bi bi-plus-lg"></i></button>
                </div>
              </div>
              <div class="px-4">
                <div v-if="cartItem.unitSubTotal !== null">{{ cartItem.unitSubTotal }}</div>
                <div>{{ cartItem.subTotal }}</div>
              </div>
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
const imgBaseUrl = ref(import.meta.env.VITE_API_BASEADDRESS);

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

// 購物車物件
class ShoppingCartItem {
  private itemInfo: {
    productId: number;
    qty: number;
    // 可以添加其他商品信息，例如名称、价格等
  }={ productId: 0, qty: 0 };;

  constructor(initialProductId: number, initialQty: number) {
    this.itemInfo.productId = initialProductId;
    this.itemInfo.qty = initialQty;
  }

  addItem(qty: number): void {
    this.itemInfo.qty += qty;
  }

  removeItem(qty: number): void {
    if (this.itemInfo.qty >= qty) {
      this.itemInfo.qty -= qty;
    }
  }

  getCartItemQty(): number {
    return this.itemInfo.qty;
  }
}
onMounted(() => {
  const shoppingCart = new ShoppingCartItem();
  // 執行組件掛載後的初始化程式碼
  const incrementCartItem = (productId:number) => {
    shoppingCart.addItem(productId);
  };

  const decrementCartItem = (productId:number) => {
    shoppingCart.removeItem(productId);
  };

  const getCartItemQty = (productId:number) => {
    return shoppingCart.getCartItemQty(productId);
  };
});

</script>
    
<style scoped lang="scss">
main {
  margin-top: 40px;
  padding-bottom: 120px;

  .row {
    &>.left {
      &>.cart {
        &>.cart-item{
          display: flex;
          .pd-img-wrapper{
            width: 150px;
            height: 150px;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;

            &>img{
              width: 100%;
              height: auto;
              object-fit: cover;
            }
          }
        }
      }
    }

    &>.right {
      &>div {}
    }
  }
}
</style>