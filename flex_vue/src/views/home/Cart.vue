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
                <a href="javascript:;" class="fw-bold">{{ cartItem.product.productName }}-{{
                  cartItem.product.salesCategoryNameStr }}-{{ cartItem.product.color }}</a>
                <div>尺寸 <a href="javascript:;"><span>{{ cartItem.product.size }}</span><i
                      class="bi bi-chevron-down"></i></a></div>
                <ul class="d-flex px-0">
                  <li class="me-2" v-for="matchDiscount in cartItem.product.matchDiscounts"
                    :key="matchDiscount.discountId">
                    <a href="javascript:;">{{ matchDiscount.discountName }}</a>
                  </li>
                </ul>
              </div>
              <div>
                <div class="d-flex">
                  <button @click="decrementCartItem(cartItem)"><i class="bi bi-dash-lg"></i></button>
                  <div>{{ cartItem.qty }}</div>
                  <button @click="incrementCartItem(cartItem)"><i class="bi bi-plus-lg"></i></button>
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
import NavBar from '@/components/home/navBar.vue';
import HomeFooter from '@/components/home/footer.vue';
import axios from "axios";
import { onMounted, ref, computed, watchEffect, watch } from "vue";
import { CartItem } from '@/types/type';

// 用vite獲得環境變數
const baseAddress: string = import.meta.env.VITE_API_BASEADDRESS;
const imgBaseUrl = ref(baseAddress);
const cartItems = ref<CartItem[]>([]);

const loadCartItems = async () => {
  let url: string;
  url = `${baseAddress}api/Cart`;
  await axios
    .post<CartItem[]>(url)
    .then((response) => {
      cartItems.value = response.data;
      console.log(cartItems.value);
    })
    .catch((error) => {
      alert(error);
    });
};

loadCartItems();



// 購物車物件
class ShoppingCartItem {
  private item: CartItem;

  constructor(cartitem: CartItem) {
    this.item = cartitem;
  }
  addOneItem():void{
    this.addItem(1);
  }

  addItem(qty: number): void {
    this.item.qty += qty;
    this.updateItemQty();
  }
  removeOneItem():void{
    this.removeItem(1);
  }

  removeItem(qty: number): void {
    if (this.item.qty >= qty) {
      this.item.qty = Math.max(this.item.qty - qty , 0);
      if(this.item.qty>0){
        this.updateItemQty();
      }
      if(this.item.qty<=0){
        const result = confirm("是否刪除此商品？");
        if(result){
          this.updateItemQty();
        }
        else{
          this.item.qty=1;
        }
      }
    }
  }

  getCartItemQty(): number {
    return this.item.qty;
  }

  private updateItemQty = async () => {
    let url: string = `${import.meta.env.VITE_API_BASEADDRESS}api/Cart/UpdateItem`;
    await axios
      .put(url,this.item)
      .then((response) => {
      })
      .catch((error) => {
        alert(error);
      });
  };
}

const incrementCartItem = async (cartItem: CartItem) => {
  const shoppingCart = new ShoppingCartItem(cartItem)
  await shoppingCart.addOneItem();
  setTimeout(() => {
    loadCartItems();
  }, 1000);
};

const decrementCartItem = async (cartItem: CartItem) => {
  const shoppingCart = new ShoppingCartItem(cartItem);
  await shoppingCart.removeOneItem();
  setTimeout(() => {
    loadCartItems();
  }, 1000);
};

const getCartItemQty = (cartItem: CartItem) => {
  const shoppingCart = new ShoppingCartItem(cartItem);
  return shoppingCart.getCartItemQty();
};

</script>
    
<style scoped lang="scss">
main {
  margin-top: 40px;
  padding-bottom: 120px;

  .row {
    &>.left {
      &>.cart {
        &>.cart-item {
          display: flex;

          .pd-img-wrapper {
            width: 150px;
            height: 150px;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;

            &>img {
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