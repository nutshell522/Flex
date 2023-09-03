<template>
  <navBar @UpdateCart="getUpdateFunc"></navBar>
  <main>
    <div class="container">
      <div class="loading-block" :class="{ 'd-none': !loading }">
        <div class="loading"></div>
      </div>
      <div class="row gx-5">
        <!-- 購物車左側 -->
        <div class="left col-12 col-lg-8">
          <div class="cart-info d-flex d-lg-none">
            <h2>購物車</h2>

            <div class="d-flex">
              <div class="me-2">{{ cartItems.length }} 品項 | </div>
              <div>{{ formatter.format(subTotal || 0) }}</div>
            </div>
          </div>
          <div class="hint hint1 mb-3">
            <div>
              <div class="hint-title">免費寄送</div>
              <div class="hint-body">適用於 NT$2,000 以上的訂單。</div>
            </div>
            <button class="btn-close" @click="closeHint(1)"></button>
          </div>
          <div class="hint hint2 mb-3">
            <div>
              <div class="hint-title">滿額送 8 折券</div>
              <div class="hint-body">適用於 NT$1,000 以上的訂單。 (此券消費 NT$500 可使用)</div>
            </div>
            <button class="btn-close" @click="closeHint(2)"></button>
          </div>
          <h2 class="mt-3 fs-1 d-none d-lg-block">購物車</h2>
          <div class="empty-cart" :class="{ 'd-none': cartItems == null || cartItems.length != 0 }">
            購物車是空的
          </div>
          <ul class="cart">
            <li v-for="cartItem in cartItems" :key="cartItem.cartItemId" class="cart-item">
              <a class="pd-img-wrapper"
                :href="webBaseAddress + cartItem.product.categorySubStr + '/detail/' + cartItem.product.productSaleId">
                <img :src="imgBaseUrl + 'Public/Img/' + cartItem.product.imgPath" :title="cartItem.product.productName" />
              </a>
              <div class="w-100">


                <div class="ms-4 item-name">

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


                  <div class="item-info-wrapper me-auto">


                    <div class="d-flex">

                      <div class="size">
                        尺寸
                        <div class="size-select-container">
                          <a class="size-select" href="javascript:;" @click="toggleActive(cartItem.cartItemId)"
                            :class="{ active: activeItem === cartItem.cartItemId }"><span>{{ cartItem.product.size
                            }}</span><i class="bi bi-chevron-down"></i></a>
                          <ul class="gray-scroll">
                            <li
                              v-for="size in sizeSelect.filter(size => size.productSaleId == cartItem.product.productSaleId && size.color == cartItem.product.color)"
                              :key="size.productId"
                              @click="sizeChangeHandler(size.productId, cartItem.cartItemId, cartItem.qty, cartItem.cartId)">
                              {{ size.size }}
                            </li>
                          </ul>
                        </div>
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
                        {{ formatter.format(cartItem.unitSubTotal || 0) }}
                      </div>
                    </div>
                    <div class="total">{{ formatter.format(cartItem.subTotal || 0) }}</div>
                  </div>
                </div>
              </div>
              <div></div>
            </li>
          </ul>
        </div>
        <!-- 購物車右側 -->
        <div class="right col-12 col-lg-4">
          <h2 class="mb-3">摘要</h2>
          <div class="d-flex justify-content-between my-3">
            <div>小計</div>
            <div>{{ formatter.format(originalTotalAmount || 0) }}</div>
          </div>
          <div class="d-flex justify-content-between my-3">
            <div class="text-danger">折扣金額</div>
            <div class="text-danger">{{ formatter.format(discountCount || 0) }}</div>
          </div>
          <div class="d-flex justify-content-between my-3">
            <div>運費</div>
            <div>{{ formatter.format(cartItems.length != 0 ? deliveryFee || 0 : 0) }}</div>
          </div>
          <div class="d-flex justify-content-between border border-start-0 border-end-0 py-3">
            <div>總計</div>
            <div>{{ formatter.format(cartItems.length != 0 ? subTotal || 0 : 0) }}</div>
          </div>
          <div class="checkout">

            <button @click="goToCheckoutPageEventHandler" class="btn btn-dark w-100 my-3 rounded-5 btn-checkout"
              :disabled="cartItems.length == 0">
              前往結帳
            </button>
          </div>
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
import { ref, onMounted, computed, onBeforeUnmount } from "vue";
import { CartItem, ShoppingCartItem, SizeVM, GetSizeVM } from "@/types/type";
import Swal from 'sweetalert2';
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
const loading = ref<boolean>(true);
let UpdateCartHandler: (() => void) | null = null;
const getUpdateFunc = (func: (() => void) | null) => {
  UpdateCartHandler = func;
};
const sizeSelect = ref<SizeVM[]>([])
let allProductSKUs: GetSizeVM[] = [];

const activeItem = ref<number | null>(null);

const toggleActive = (itemId: number) => {
  activeItem.value = activeItem.value === itemId ? null : itemId;
};

const closeActive = (event: MouseEvent) => {
  if (!(event.target instanceof Element)) return;
  if (!event.target.closest('.size-select-container')) {
    activeItem.value = null;
  }
};

const sizeChangeHandler = async (changeSizeid: number, originCartItemId: number, qty: number, cartId: number) => {
  await axios.get(`${baseAddress}api/Cart/ChangeSize/${changeSizeid}/${originCartItemId}/${qty}/${cartId}/${memberId}`)
    .then((response) => {
      if (response.data.isSuccess) {
        loadCartItems();
      }
    })
    .catch((err) => {
      console.error(err);
    })

}

// 載入購物車項目的所有SIZE
const loadAllSize = async () => {
  await axios.post<SizeVM[]>(`${baseAddress}api/Cart/GetAllSize`, allProductSKUs)
    .then((response) => {
      sizeSelect.value = response.data;
    })
    .catch((err) => { console.error(err) });
}

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
      allProductSKUs = [];
      response.data.forEach(x => {
        if (!allProductSKUs.some(item => item.productSaleId === x.product.productSaleId && item.color === x.product.color)) {
          allProductSKUs.push({
            color: x.product.color,
            productSaleId: x.product.productSaleId
          });
        }
      });

      loadAllSize();


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
      loading.value = false;
    })
    .catch((error) => {
      alert(error);
    });
};

const deleteCartItem = async (cartItem: CartItem) => {
  const result = await Swal.fire({
    title: '是否刪除此商品？',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText: '確定',
    cancelButtonText: '取消'
  });

  if (result.isConfirmed) {
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
const closeHint = (id: number) => {
  const hint = document.querySelector(`.hint${id}`);
  hint?.classList.add('hide');
}
const discountCount = computed(() => {
  return subTotal.value - deliveryFee.value - originalTotalAmount.value;
});

onMounted(() => {
  loadCartItems();
  const hintCloseBtn = document.querySelector('.btn-close');
  document.addEventListener('click', closeActive);
});
onBeforeUnmount(() => {
  document.removeEventListener('click', closeActive);
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

const goToCheckoutPageEventHandler = async () => {
  loading.value = true
  const arr: number[] = [];
  cartItems.value.forEach(x => {
    arr.push(x.cartItemId);
  });
  const request = {
    MemberId: memberId,
    CartItemIds: arr
  }
  await axios.post(`${baseAddress}api/Cart/TryToCheckout`, request)
    .then((response) => {
      if (response.data.isSuccess) {
        window.location.href = "/buy";
      }
      else {
        loading.value = false;
        Swal.fire({
          icon: 'error',
          title: '失敗',
          text: `${response.data.errorMessage}`
        })
      }
    })
    .catch((err) => {
      console.error(err);
    });

};
const formatter = new Intl.NumberFormat("zh-TW", {
  style: "currency",
  currency: "TWD",
  minimumFractionDigits: 0, // 最少保留小數位數
  maximumFractionDigits: 0, // 最多保留小數位數
});
</script>
    
<style scoped lang="scss">
main {
  margin-top: 40px;
  padding-bottom: 120px;

  .empty-cart {
    width: 100%;
    height: 30vh;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #777;
    font-size: 30px;
    font-weight: bold;

  }

  .loading-block {
    position: fixed;
    top: 0;
    left: 0;

    display: flex;
    justify-content: center;
    align-items: center;
    width: 100vw;
    height: 100vh;
    background-color: rgba($color: #fff, $alpha: 0.5);
    padding: 25vh 0 40vh;

    .loading {
      position: relative;
      width: 50px;
      height: 50px;
      border: 3.5px solid #000;
      border-top-color: rgba(0, 0, 0, 0.2);
      border-right-color: rgba(0, 0, 0, 0.2);
      border-bottom-color: rgba(0, 0, 0, 0.2);
      border-radius: 100%;

      animation: circle infinite 0.75s linear;
    }
  }

  @keyframes circle {
    0% {
      transform: rotate(0);
    }

    100% {
      transform: rotate(360deg);
    }
  }

  .row {
    &>.left {
      .cart-info {
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 150px;

        >.d-flex {
          >.me-2 {
            color: #555;
            font-size: 18px;

            +div {
              font-size: 18px;
            }
          }
        }
      }

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

          .item-info-wrapper {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 0 25px;
            width: 55%;




            .size {
              margin-right: 28px;
              display: flex;
              font-weight: bold;
              color: #777;
              flex-direction: column;


              .size-select-container {
                position: relative;
                width: 80px;
                // margin-left: 15px;

                .size-select {
                  display: flex;
                  width: 100%;
                  justify-content: end;
                  border: #aaa 1px solid;

                  &:hover {
                    background-color: #eee;
                  }

                  &.active {
                    border-color: #000;

                    +.gray-scroll {
                      visibility: visible;
                      max-height: 100px;
                    }

                  }

                  &>span,
                  &>i {
                    color: #777;
                    font-weight: bold;
                  }

                  &>i {
                    margin: 0 3px;
                  }
                }

                .gray-scroll {
                  position: absolute;
                  padding-left: 8px;
                  width: 100%;
                  max-height: 0px;
                  border: 1px solid #999;
                  overflow-y: scroll;
                  text-align: right;
                  background-color: #fff;
                  transition: max-height .3s;
                  visibility: hidden;

                  li {
                    padding: 0 15px;

                    &:hover {
                      background-color: #ccc;
                      cursor: pointer;
                    }
                  }
                }
              }
            }

            .qty-box {
              display: flex;


              align-items: end;



              .qty {
                height: 30px;
                width: 30px;
                text-align: center;
                border-bottom: 1px solid #999;
                border-top: 1px solid #999;
                display: flex;
                align-items: center;
                justify-content: center;
              }

              >button {
                height: 30px;
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
      div {
        font-size: 18px;
      }

      .checkout {
        padding: 0 15px;

        @media screen and (max-width: 991px) {
          background-color: #fff;
          position: fixed;
          bottom: 0;
          z-index: 500;

          border-top: 1px #ccc solid;
          left: 0;
        }

        width: 100%;


        .btn-checkout {
          font-size: 18px;
          padding: 20px 0;
        }
      }
    }
  }
}
</style>