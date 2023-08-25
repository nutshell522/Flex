<template>
  <header class="header">
    <div class="container d-flex h-100">
      <div class="me-auto"></div>
      <ul>
        <li><a href="javascript:;">說明</a></li>
        <li class="" v-if="!loginSuccess">
          <a href="/login">登入</a>
        </li>
        <li class="p-relative userIcon" v-if="loginSuccess">
          <a href="" @mouseenter="showList" @click.prevent><i class="bi bi-person-circle"></i></a>
          <userList v-if="isListVisible" @mouseleave="hideList"></userList>
        </li>
      </ul>
    </div>
  </header>
  <nav>
    <div class="container">
      <div class="left">
        <router-link to="/" class="logo-wrapper">
          <img src="../../../../public/LOGO/FlexLogoDark.png" alt="" class="logo" />
          <h1>FLEX</h1>
        </router-link>
      </div>
      <div class="center">
        <ul>
          <router-link to="/men" class="transetion">
            <li>
              <div class="nav-list-item">
                <div>Men</div>
                <div>男款</div>
              </div>
            </li>
          </router-link>
          <router-link to="/women" class="transetion">
            <li>
              <div class="nav-list-item">
                <div>Women</div>
                <div>女款</div>
              </div>
            </li>
          </router-link>
          <router-link to="/kid" class="transetion">
            <li>
              <div class="nav-list-item">
                <div>Kid</div>
                <div>兒童款</div>
              </div>
            </li>
          </router-link>
          <router-link to="/onSale" class="transetion">
            <li>
              <div class="nav-list-item">
                <div>Sale</div>
                <div>特惠</div>
              </div>
            </li>
          </router-link>
        </ul>
      </div>
      <div class="right">
        <div class="search-wrapper d-flex">
          <input
            type="search"
            class="search-bar"
            placeholder="搜尋"
            v-model="searchKeyword"
            @mouseenter="searchKeywordHandler"
          />
          <i class="bi bi-search"></i>
        </div>
        <div class="icon">
          <a href="javascript:;"><i class="bi bi-heart"></i></a>
          <div class="count"></div>
        </div>
        <div class="icon">
          <a href="/cart"><i class="bi bi-bag"></i></a>
          <div v-if="cartItemCount && cartItemCount.value != 0" class="count">
            {{ cartItemCount }}
          </div>
          <div class="drap">
            <div v-if="memberId == 0" class="w-100 h-100 d-flex flex-column justify-content-center align-items-center">
              <div class="w-100 text-center fs-4">您尚未登入</div>
              <a class="btn btn-dark rounded-5 px-4 mt-4" href="/login">登入</a>
            </div>
            <div v-else-if="cartItemCount && cartItemCount != 0" class="w-100 h-100 d-flex flex-column p-2">
              <ul class="p-0">
                <li v-for="cartItem in cartItems" :key="cartItem.cartItemId" class="w-100">
                  <a :href="webBaseAddress +
                    cartItem.product.categorySubStr +
                    '/detail/' +
                    cartItem.product.productSaleId
                    " class="w-100 d-flex border-bottom pb-2 mb-2">
                    <div class="cart-img-wrapper me-3">
                      <img :src="imgBaseUrl + 'Public/Img/' + cartItem.product.imgPath
                        " />
                    </div>
                    <div class="w-75">
                      <div class="fs-6">{{ cartItem.product.productName }}</div>
                      <div class="d-flex">
                        <div class="fs-6 me-3">
                          顏色:{{ cartItem.product.color }}
                        </div>
                        <div class="fs-6 me-auto">
                          尺寸:{{ cartItem.product.size }}
                        </div>
                        <div class="fs-6">{{ cartItem.qty }} 件</div>
                      </div>
                    </div>
                  </a>
                </li>
              </ul>
            </div>
            <div v-else class="w-100 h-100 d-flex flex-column justify-content-center align-items-center">
              <div class="w-100 text-center fs-4">購物車還沒有東西喔</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </nav>
</template>

<script setup>
import { ref, onMounted, defineEmits } from "vue";
import userList from "../home/userList.vue";
import Cookies from "js-cookie";
import axios from "axios";
import { storeToRefs } from "pinia"; //把解構又同時具備響應式功能
import { useGetApiDataStore } from "@/stores/useGetApiDataStore.js";
import { useRoute, useRouter } from "vue-router";
const router = useRouter();
const webBaseAddress = "https://localhost:8080/";
const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const getApiStore = useGetApiDataStore();
const { loginSuccess } = storeToRefs(getApiStore); //資料就透過storeToRefs取出來
const { memberInfo } = storeToRefs(getApiStore);
const { setLoginSuccess } = getApiStore; //function透過store取資料
const { getData } = getApiStore;
const searchKeyword = ref("");

//關鍵字搜尋
const searchKeywordHandler = () => {
  const inputKeyword = searchKeyword.value.trim();
  if (inputKeyword) {
    router.push(`/search/${inputKeyword}`);
  }
};
const loggedInUser = localStorage.getItem("loggedInUser");
const imgBaseUrl = ref(baseAddress);
let memberId = 0;
if (loggedInUser) {
  const memberInfo = JSON.parse(loggedInUser);
  memberId = memberInfo.memberId;
} else {
  memberId = 0;
}
const cartItemCount = ref(0);
const cartItems = ref([]);
const loadCartAnditemCount = async () => {
  if (memberId == 0) {
    cartItemCount.value = 0;
  } else {
    let url = `${baseAddress}api/Cart`;
    await axios
      .post(url, memberId, {
        headers: {
          "Content-Type": "application/json",
        },
      })
      .then((response) => {
        cartItemCount.value = response.data.length;
        cartItems.value = response.data;
        //console.log(response.data);
      })
      .catch((error) => {
        alert(error);
      });
  }
};
loadCartAnditemCount();
const emit = defineEmits("UpdateCart");
const sendFunctionToParent = async () => {
  // 定義父元件傳到子元件事件
  emit("UpdateCart", loadCartAnditemCount);
};

const url = `${baseAddress}api/Users/Login`;
function getApi() {
  getData(url);
}
//userlist
const isListVisible = ref(false);
function showList() {
  isListVisible.value = true;
}
function hideList() {
  isListVisible.value = false;
}
onMounted(() => {
  sendFunctionToParent();
});

//登入人頭
if (loggedInUser) {
  loginSuccess.value = true;
} else {
  loginSuccess.value = false;
}
</script>

<style lang="scss">
@mixin reset-styles {
  padding: 0;
  margin: 0;
  color: #333;

  a {
    text-decoration: none;
    color: #333;
  }

  ul {
    li {
      list-style: none;
    }
  }
}

$header-height: 36px;
$nav-height: 70px;
$bg-gray: #f5f5f5;

.text-link {
  &:hover {
    color: #888;
  }
}

* {
  @include reset-styles;
}

body {
  overflow-x: hidden;
}

.p-relative {
  position: relative;
}

header {
  background-color: #f5f5f5;
  height: $header-height;

  &>div {
    display: flex;
    height: 100%;

    &>ul {
      display: flex;
      align-items: center;
      height: 100%;

      &>li {
        list-style: none;
        font-size: 14px;
        height: 100%;

        &>a {
          @extend .text-link;
          display: inline-block;
          height: 100%;
          line-height: $header-height;
        }

        &:not(:first-child)::before {
          content: "|";
          padding: 0 15px;
          font-size: 14px;
        }
      }
    }
  }

  .userIcon {
    font-size: 18px;
  }
}

.nav-height {
  height: $nav-height;
}

nav {
  @extend .nav-height;
  background-color: #fff;

  &>.container {
    position: relative;

    &>.left,
    &>.center,
    &>.right {
      @extend .nav-height;
      position: absolute;
    }

    &>.left {
      @extend .nav-height;
      position: absolute;

      &>.logo-wrapper {
        @extend .nav-height;
        width: 100px;
        display: flex;
        align-items: center;
        overflow: hidden;

        &:hover {
          h1 {
            color: #777;
          }

          .logo {
            opacity: 0.7;
          }
        }

        .logo {
          width: 100%;
          object-fit: cover;
        }

        &>h1 {
          line-height: $nav-height;
          font-weight: bold;
          font-size: 40px;
          margin-top: 10px;
        }
      }
    }

    &>.center {
      left: 50%;
      transform: translate(-50%);

      &>ul {
        display: flex;
        height: 100%;

        &>.transetion {
          &>li {
            height: 100%;
            cursor: pointer;
            overflow-y: hidden;
            font-size: 22px;
            position: relative;
            width: 100px;
            display: flex;
            justify-content: center;

            &>.nav-list-item {
              height: 200%;
              position: absolute;
              top: 0;
              transition: 0.3s;

              &>div {
                display: flex;
                height: 50%;
                align-items: center;
                justify-content: center;
              }
            }

            &:hover {
              border-bottom: 3px solid black;

              &>.nav-list-item {
                top: -100%;
              }
            }
          }
        }

        &>li {
          height: 100%;
          cursor: pointer;
          overflow-y: hidden;
          font-size: 22px;
          position: relative;
          width: 100px;
          display: flex;
          justify-content: center;

          &>.nav-list-item {
            height: 200%;
            position: absolute;
            top: 0;
            transition: 0.3s;

            &>div {
              display: flex;
              height: 50%;
              align-items: center;
              justify-content: center;
            }
          }

          &:hover {
            border-bottom: 3px solid black;

            &>.nav-list-item {
              top: -100%;
            }
          }
        }
      }
    }

    .right {
      right: 0;
      display: flex;
      align-items: center;

      .nav-icon {
        font-size: 22px;
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 50px;
        width: 38px;
        height: 38px;
        cursor: pointer;
      }

      .search-wrapper {
        position: relative;

        .search-bar {
          background-color: $bg-gray;
          padding: 10px 10px 10px 50px;
          border-radius: 50px;
          border: none;
          width: 180px;
          height: 45px;
          font-size: 18px;

          &:hover {
            background-color: #dfdfdf;
          }

          &:focus {
            outline: none;
          }
        }

        .bi-search {
          @extend .nav-icon;
          position: absolute;
          left: 4px;
          top: 4px;

          &:hover {
            background-color: #dfdfdf;
          }
        }
      }

      .icon {
        position: relative;

        i {
          @extend .nav-icon;
          margin-left: 10px;
        }

        &:hover i {
          background-color: #dfdfdf;
        }

        .count {
          cursor: pointer;
          position: absolute;
          top: 31%;
          left: 53%;
          font-size: 12px;
        }

        .drap {
          position: absolute;
          top: 100%;
          right: 0;
          height: 0;
          max-height: 0;
          width: 350px;
          z-index: 999;
          border: 1px solid rgba($color: #fff, $alpha: 0);
          transition: max-height 0.3s;
          overflow-y: scroll;

          .cart-img-wrapper {
            width: 85px;
            height: 85px;
          }

          /* Webkit (Chrome, Safari) */
          &::-webkit-scrollbar {
            width: 8px;
          }

          &::-webkit-scrollbar-thumb {
            background-color: #888;
            border-radius: 4px;
          }

          &::-webkit-scrollbar-thumb:hover {
            background-color: #555;
          }

          /* Firefox */
          &::-moz-scrollbar {
            width: 8px;
          }

          &::-moz-scrollbar-thumb {
            background-color: #888;
            border-radius: 4px;
          }

          &::-moz-scrollbar-thumb:hover {
            background-color: #555;
          }
        }

        &:hover .drap {
          background-color: #fff;
          border-color: #333;
          visibility: visible;
          height: 300px;
          max-height: 300px;
        }
      }
    }
  }
}
</style>
