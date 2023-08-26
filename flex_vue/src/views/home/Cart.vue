<template>
  <navBar @UpdateCart="getUpdateFunc"></navBar>
  <main>
    <div class="container">
      <div class="row gx-5">
        <!-- 購物車左側 -->
        <div class="left col-12 col-lg-8">
          <div class="hint">
            <div>
              <div class="hint-title">免費寄送</div>
              <div class="hint-body">適用於 NT$2,000 以上的訂單。</div>
            </div>
            <button class="btn-close"></button>
          </div>
          <h3 class="mt-3">購物車</h3>
          <ul class="cart">
            <li v-for="cartItem in cartItems" :key="cartItem.cartItemId" class="cart-item">
              <a class="pd-img-wrapper"
                :href="webBaseAddress + cartItem.product.categorySubStr + '/detail/' + cartItem.product.productSaleId">
                <img :src="imgBaseUrl + 'Public/Img/' + cartItem.product.imgPath" :title="cartItem.product.productName" />
              </a>
              <div class="item-info-wrapper me-auto">
                <div class="item-name">

                  <a href="javascript:;" class="fw-bold">{{ cartItem.product.productName }}-{{
                    cartItem.product.salesCategoryNameStr
                  }}-{{ cartItem.product.color }}</a>
                  <ul class="d-flex px-0">
                    <li class="me-2 discount-tag" v-for="matchDiscount in cartItem.product.matchDiscounts"
                      :key="matchDiscount.discountId">
                      <a href="javascript:;">{{ matchDiscount.discountName }}</a>
                    </li>
                  </ul>
                </div>

                <div class="d-flex">

                  <div class="size">
                    尺寸
                    <a class="size-select" href="javascript:;"><span>{{ cartItem.product.size }}</span><i
                        class="bi bi-chevron-down"></i></a>
                  </div>
                  <div class="qty-box">
                    <button @click="decrementCartItem(cartItem)">
                      <i class="bi bi-dash-lg"></i>
                    </button>
                    <div class="qty">{{ cartItem.qty }}</div>
                    <button @click="incrementCartItem(cartItem)">
                      <i class="bi bi-plus-lg"></i>
                    </button>
                  </div>
                </div>

                <i @click="deleteCartItem(cartItem)" class="bi bi-trash3"></i>
              </div>

              <div>

              </div>
              <div class="amont-box">
                <div>

                  <div class="origin-total" v-if="cartItem.unitSubTotal !== null">
                    {{ cartItem.unitSubTotal }}
                  </div>
                </div>
                <div class="total">{{ cartItem.subTotal }}</div>
              </div>
              <div></div>
            </li>
          </ul>
        </div>
        <!-- 購物車右側 -->
        <div class="right col-12 col-lg-4">
          <h3>摘要</h3>
          <div class="d-flex justify-content-between">
            <div>小計</div>
            <div>{{ originalTotalAmount }}</div>
          </div>
          <div class="d-flex justify-content-between">
            <div>折扣金額</div>
            <div>{{ discountCount }}</div>
          </div>
          <div class="d-flex justify-content-between">
            <div>運費</div>
            <div>{{ deliveryFee }}</div>
          </div>
          <div class="d-flex justify-content-between border border-start-0 border-end-0 py-2">
            <div>總計</div>
            <div>{{ subTotal }}</div>
          </div>
          <button @click="goToCheckoutPageEventHandler" class="btn btn-dark w-100 my-3 py-3 rounded-5">
            結帳
          </button>
        </div>
      </div>
    </div>
  </main>
  <homeFooter></homeFooter>
</template>
    
<script setup lang="ts">
import NavBar from "@/components/home/navBar.vue";
import HomeFooter from "@/components/home/footer.vue";
import axios from "axios";
import { ref, onMounted, computed } from "vue";
import { CartItem, ShoppingCartItem } from "@/types/type";
// 用vite獲得環境變數
const baseAddress: string = import.meta.env.VITE_API_BASEADDRESS;
const webBaseAddress = 'https://localhost:8080/';
const imgBaseUrl = ref(baseAddress);
const cartItems = ref<CartItem[]>([]);
const originalTotalAmount = ref<number>();
const subTotal = ref<number>();
const deliveryFee = ref<number>();
const loggedInUser = localStorage.getItem("loggedInUser")!;
const memberInfo = JSON.parse(loggedInUser);
const memberId: number = memberInfo.memberId;
let UpdateCartHandler: (() => void) | null = null;
const getUpdateFunc = (func: (() => void) | null) => {
  UpdateCartHandler = func;
};

// 載入購物車
const loadCartItems = async () => {
  let url: string = `${baseAddress}api/Cart`;
  await axios
    .post<CartItem[]>(url, memberId, {
      headers: {
        'Content-Type': 'application/json',
      },
    })
    .then((response) => {
      cartItems.value = response.data;
      loadTotal();
      if (UpdateCartHandler) {
        UpdateCartHandler();
      }
    })
    .catch((error) => {
      alert(error);
    });
};

// 載入折扣後的結帳金額
const loadTotal = async () => {
  const request = {
    CartItems: cartItems.value,
    memberId: memberId,
  };
  let url: string = `${baseAddress}api/Cart/GetTotalAmount`;
  await axios
    .post<number>(url, request)
    .then((response) => {
      originalTotalAmount.value = response.data.originalTotalAmount;
      subTotal.value = response.data.totalPrice;
      deliveryFee.value = response.data.deliveryFee;
    })
    .catch((error) => {
      alert(error);
    });
};

const deleteCartItem = async (cartItem: CartItem) => {
  const result = confirm("是否刪除此商品？");
  if (result) {
    const request = {
      CartItem: cartItem,
      memberId: memberId,
    };
    let url: string = `${baseAddress}api/Cart/DeleteUpdateItem`;
    await axios
      .delete(url, { data: request })
      .then((response) => {

        loadCartItems();

      })
      .catch((error) => {
        alert(error);
      });
  }
}

const discountCount = computed(() => {
  return subTotal.value - deliveryFee.value - originalTotalAmount.value;
});

onMounted(() => {
  loadCartItems();
  const hintCloseBtn = document.querySelector('.btn-close');
  hintCloseBtn?.addEventListener('click', () => {
    const hint = document.querySelector('.hint');
    hint?.classList.add('hide');
  })
});

// 定義callback函數類型
type Callback = () => void;

function processCallbacks(...callbacks: Callback[]) {
  callbacks.forEach((callback) => callback());
}

const incrementCartItem = async (cartItem: CartItem) => {
  const shoppingCart = new ShoppingCartItem(cartItem, memberId);
  await shoppingCart.addOneItem(() => {
    processCallbacks(loadCartItems);
  });
};

const decrementCartItem = async (cartItem: CartItem) => {
  const shoppingCart = new ShoppingCartItem(cartItem, memberId);
  await shoppingCart.removeOneItem(() => {
    processCallbacks(loadCartItems);
  });
};

const getCartItemQty = (cartItem: CartItem) => {
  const shoppingCart = new ShoppingCartItem(cartItem, memberId);
  return shoppingCart.getCartItemQty();
};

const goToCheckoutPageEventHandler = () => {
  window.location.href = "/buy";
};
</script>
    
<style scoped lang="scss">
main {
  margin-top: 40px;
  padding-bottom: 120px;

  .row {
    &>.left {
      .hint {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #F5F5F5;
        padding: 10px 20px;

        &.hide {
          height: 0;
          display: none;
        }

        .hint-title {
          font-weight: bold;
        }
      }

      &>.cart {
        padding: 0;

        &>.cart-item {
          display: flex;
          padding: 30px 0;
          border-bottom: #ccc 1px solid;

          .amont-box {
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding-bottom: 20px;
            text-align: right;

            &>div {
              height: 25px;
            }

            .origin-total {
              text-decoration: line-through;
              color: #999;
              font-style: italic;
            }

            .total {
              font-weight: bold;
              font-size: 20px;
            }
          }

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

          .item-info-wrapper {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 0 25px;
            width: 55%;


            .item-name {
              &>a {
                font-size: 18px;
              }

              .discount-tag {
                background-color: green;
                padding: 0 3px;
                border-radius: 5px;
                font-size: 13px;

                a {
                  color: #F5F5F5;
                }
              }
            }

            .size {
              margin-right: 28px;
              display: flex;
              font-weight: bold;
              color: #777;

              .size-select {
                display: flex;
                width: 70px;
                justify-content: end;
                border: #aaa 1px solid;
                margin-left: 15px;

                &>span,
                &>i {
                  color: #777;
                  font-weight: bold;
                }

                &>i {
                  margin: 0 3px;
                }
              }
            }

            .qty-box {
              display: flex;

              .qty {
                width: 30px;
                text-align: center;
                border-bottom: 1px solid #999;
                border-top: 1px solid #999;
              }

              >button {
                border: 1px solid #999;
                padding: 0 3px;

                &:hover {
                  background-color: #ddd;
                }

                &:first-child {
                  border-radius: 5px 0 0 5px;
                }

                &:last-child {
                  border-radius: 0 5px 5px 0;
                }
              }
            }

            .bi-trash3 {
              font-size: 24px;
              width: 0;
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