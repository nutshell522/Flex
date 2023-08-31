<template>
  <header class="header d-none d-lg-flex">
    <div class="me-auto"></div>
    <ul class="navUserIcon">
      <li><a href="javascript:;">說明</a></li>
      <li class="" v-if="!loginSuccess">
        <a href="/login">登入</a>
      </li>
      <li class="userPhoto-box" v-else>
        <!-- <a href="" @mouseenter="showList" @click.prevent
            ><i class="bi bi-person-circle"></i
          ></a> -->
        <!-- <a href="" @mouseenter="showList" @click.prevent> -->
        <a href="/user" class="d-flex">
          <div class="userName">Hi, {{ userName }}</div>
          <userPhoto
            class="userPhoto-component"
            :width="36"
            :height="36"
          ></userPhoto>
        </a>
        <!-- <userList class="userList" v-if="isListVisible" @mouseleave="hideList"></userList> -->
        <userList class="userList"></userList>
      </li>
    </ul>
  </header>
  <nav class="home-nav">
    <div class="left">
      <router-link to="/" class="logo-wrapper">
        <img src="@/../public/LOGO/FlexLogoDark.png" alt="" class="logo" />
        <h1>FLEX</h1>
      </router-link>
    </div>
    <div class="center gray-scroll" :class="{ active: navCerterIsActive }">
      <div class="d-flex d-lg-none">
        <div class="me-auto"></div>
        <button @click="setNavcenterHide" class="btn-close"></button>
      </div>
      <a href="/user" class="d-flex align-items-center d-lg-none">
        <userPhoto
          class="userPhoto-component"
          :width="60"
          :height="60"
        ></userPhoto>
        <div class="ms-2">
          <div class="fs-4">{{ userName }}</div>
          <div class="fs-5">你好</div>
        </div>
      </a>
      <ul>
        <router-link to="/men" class="transetion">
          <li>
            <div class="nav-list-item">
              <div class="d-none d-lg-flex">Men</div>
              <div>男款</div>
            </div>
          </li>
        </router-link>
        <router-link to="/women" class="transetion">
          <li>
            <div class="nav-list-item">
              <div class="d-none d-lg-flex">Women</div>
              <div>女款</div>
            </div>
          </li>
        </router-link>
        <router-link to="/kid" class="transetion">
          <li>
            <div class="nav-list-item">
              <div class="d-none d-lg-flex">Kid</div>
              <div>兒童款</div>
            </div>
          </li>
        </router-link>
        <router-link to="/onSale" class="transetion">
          <li>
            <div class="nav-list-item">
              <div class="d-none d-lg-flex">Sale</div>
              <div>特惠</div>
            </div>
          </li>
        </router-link>
      </ul>
      <div class="icons d-lg-none">
        <div>
          <a href="/user"><i class="bi bi-person"></i>個人資料</a>
        </div>
        <div class="mb-2">
          <a href="/favorites"><i class="bi bi-heart"></i>最愛</a>
        </div>
        <div class="mb-2">
          <a href="/cart"><i class="bi bi-bag"></i>購物車</a>
        </div>
        <div class="mb-2">
          <a href="/orders"><i class="bi bi-box-seam"></i>訂單</a>
        </div>
        <div class="mb-2">
          <a href="javascript:;" @click="logout"
            ><i class="bi bi-door-open"></i>登出</a
          >
        </div>
      </div>
    </div>
    <div class="center-bg d-lg-none" @click="setNavcenterHide"></div>
    <div class="right">
      <div class="search-wrapper d-flex">
        <input
          type="search"
          class="search-bar"
          :class="{ active: searchActive }"
          placeholder="搜尋"
          v-model="searchKeyword"
          @mouseenter="searchKeywordHandler"
        />
        <i class="bi bi-search" @click="searchActiveToggle"></i>
      </div>
      <div class="nav-bar-icon d-none d-lg-flex">
        <a href="javascript:;"><i class="bi bi-heart"></i></a>
        <div v-if="favoritesItemCount != 0" class="countFavorites">
          {{ favoritesItemCount }}
        </div>
        <div class="drap" v-if="loggedInUser">
          <div
            v-if="favoritesItemCount && favoritesItemCount != 0"
            class="w-100 h-100"
          >
            <ul class="p-2 w-100 h-100">
              <li
                v-for="card in cards"
                :key="card.productId"
                class="d-flex mb-2"
                style="border-bottom: 1px solid gainsboro"
              >
                <a
                  :href="
                    webBaseAddress + card.path + '/Detail/' + card.productId
                  "
                  class="d-flex"
                >
                  <div
                    style="width: 70px; height: 80px; overflow: hidden"
                    class="p-2"
                  >
                    <img
                      :src="imgBaseUrl + 'Public/Img/' + card.firstImgPath"
                      style="max-width: 100%; max-height: 100%"
                    />
                  </div>
                  <div>
                    <div>
                      {{ card.productName }}
                    </div>
                    <span
                      class="text-decoration-line-through"
                      v-if="card.unitPrice != null"
                    >
                      NT${{ card.unitPrice.toLocaleString("en-US") }}
                    </span>
                    <span v-if="card.unitPrice != null"> 活動價 </span>
                    <span :class="{ 'text-red': card.unitPrice != null }">
                      NT${{ card.salesPrice.toLocaleString("en-US") }}
                    </span>
                  </div>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>

      <div class="nav-bar-icon">
        <a href="/cart"
          ><i class="bi bi-bag"></i>
          <div v-if="cartItemCount && cartItemCount.value != 0" class="count">
            {{ cartItemCount }}
          </div>
        </a>
        <div class="drap">
          <div
            v-if="memberId == 0"
            class="w-100 h-100 d-flex flex-column justify-content-center align-items-center"
          >
            <div class="w-100 text-center fs-4">您尚未登入</div>
            <a class="btn btn-dark rounded-5 px-4 mt-4" href="/login">登入</a>
          </div>
          <div
            v-else-if="cartItemCount && cartItemCount != 0"
            class="w-100 h-100 d-flex flex-column p-2"
          >
            <ul class="p-0">
              <li
                v-for="cartItem in cartItems"
                :key="cartItem.cartItemId"
                class="w-100"
              >
                <a
                  :href="
                    webBaseAddress +
                    cartItem.product.categorySubStr +
                    '/detail/' +
                    cartItem.product.productSaleId
                  "
                  class="w-100 d-flex border-bottom pb-2 mb-2"
                >
                  <div class="cart-img-wrapper me-3">
                    <img
                      :src="
                        imgBaseUrl + 'Public/Img/' + cartItem.product.imgPath
                      "
                    />
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
          <div
            v-else
            class="w-100 h-100 d-flex flex-column justify-content-center align-items-center"
          >
            <div class="w-100 text-center fs-4">購物車還沒有東西喔</div>
          </div>
        </div>
      </div>
      <div class="nav-bar-icon d-lg-none">
        <a href="javascript:;" @click="setNavcenterActive"
          ><i class="bi bi-list"></i
        ></a>
        <div class="count"></div>
      </div>
    </div>
  </nav>
</template>

<script setup>
import { ref, onMounted, defineEmits, watchEffect, onBeforeUnmount } from "vue";
import userList from "../home/userList.vue";
import Cookies from "js-cookie";
import axios from "axios";
import { storeToRefs } from "pinia"; //把解構又同時具備響應式功能
import { useGetApiDataStore } from "@/stores/useGetApiDataStore.js";
import { useRoute, useRouter } from "vue-router";
import userPhoto from "@/components/user/userPhoto.vue";

const router = useRouter();
const webBaseAddress = "https://localhost:8080/";
const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const getApiStore = useGetApiDataStore();
const { loginSuccess } = storeToRefs(getApiStore); //資料就透過storeToRefs取出來
const { memberInfo } = storeToRefs(getApiStore);
const { setLoginSuccess } = getApiStore; //function透過store取資料
const { getData } = getApiStore;
const searchKeyword = ref("");
const navCerterIsActive = ref(false);
const searchActive = ref(false);
const favoritesItemCount = ref("");
const cards = ref({});
const { handleLogout } = getApiStore; //function透過store取資料

//登出
function logout() {
  localStorage.removeItem("loggedInUser");
  handleLogout();
}

const setNavcenterActive = () => {
  navCerterIsActive.value = true;
};
const setNavcenterHide = () => {
  navCerterIsActive.value = false;
};
const searchActiveToggle = () => {
  searchActive.value = !searchActive.value;
};
const searchActiveClose = () => {
  searchActive.value = false;
};

//關鍵字搜尋
const searchKeywordHandler = () => {
  const inputKeyword = searchKeyword.value.trim();
  if (inputKeyword) {
    router.push(`/search/${inputKeyword}`);
  }
};
const loggedInUser = localStorage.getItem("loggedInUser");
const imgBaseUrl = ref(baseAddress);
const userObject = JSON.parse(loggedInUser);

let userName = ref(null);
if (userObject) {
  userName = ref(userObject.username ? userObject.username : null);
}
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
const emit = defineEmits();
const sendFunctionToParent = async () => {
  // 定義父元件傳到子元件事件
  emit("UpdateCart", loadCartAnditemCount);
  emit("updateFavoriteCount", loadFavoritesItemCount);
};

const loadFavoritesItemCount = async () => {
  if (memberId == 0) {
    favoritesItemCount.value = null;
  } else {
    await axios
      .get(`${baseAddress}api/Users/GetFavorites?memberId=${memberId}`)
      .then((response) => {
        favoritesItemCount.value = response.data.length;
        cards.value = response.data;
      })
      .catch((error) => {
        console.log(error);
      });
  }
};
loadFavoritesItemCount();

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
window.addEventListener("resize", setNavcenterHide);
window.addEventListener("resize", searchActiveClose);
onMounted(() => {
  sendFunctionToParent();
});
onBeforeUnmount(() => {
  window.removeEventListener("resize", setNavcenterHide);
  window.removeEventListener("resize", searchActiveClose);
});
watchEffect(() => {
  if (navCerterIsActive.value) {
    // 當 navCerterIsActive 為 true，隱藏卷軸
    document.body.style.overflow = "hidden";
  } else {
    // 當 navCerterIsActive 為 false，顯示卷軸
    document.body.style.overflow = "auto";
  }
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

.p-relative {
  position: relative;
}

header {
  background-color: #f5f5f5;
  height: $header-height;
  padding: 0 50px 0 40px;

  .navUserIcon {
    display: flex;
    align-items: center;
    height: 100%;

    & > li {
      list-style: none;
      font-size: 14px;
      height: 100%;
      position: relative;
      padding: 0 15px;

      &.userPhoto-box:hover {
        .userPhoto-component {
          transform: scale(2) translate(-30px, 30px);
          border-radius: 50px;

          // border: 1px solid #444;
        }

        .userList {
          max-height: 500px;
          overflow: hidden;
          padding-top: 30px;
          padding-bottom: 30px;
          visibility: visible;
        }
      }

      .userList {
        visibility: hidden;
        max-height: 0;
        overflow: hidden;
      }

      & > a {
        @extend .text-link;
        height: 100%;
        line-height: $header-height;

        .userName {
          padding-right: 36px;
        }

        .userPhoto-component {
          z-index: 7000;
          position: absolute;
          right: 0;
          transition: transform 0.3s;
        }
      }

      &:not(:first-child)::before {
        content: "|";
        font-size: 14px;
        position: absolute;
        left: 0;
        top: calc((100% - 21px) / 2);
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

.home-nav {
  @extend .nav-height;
  background-color: #fff;

  position: sticky;
  top: 0;
  z-index: 2000;

  & > .left,
  & > .right {
    @extend .nav-height;
    position: absolute;
  }

  & > .left {
    @extend .nav-height;
    position: absolute;
    left: 40px;

    & > .logo-wrapper {
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

      & > h1 {
        line-height: $nav-height;
        font-weight: bold;
        font-size: 40px;
        margin-top: 10px;
      }
    }
  }

  @media screen and (max-width: 991px) {
    .center-bg {
      visibility: hidden;
      opacity: 0;
      backdrop-filter: blur(3px);
      z-index: 5100;
      transition: 0.3s;
      background-color: rgba($color: #000, $alpha: 0.3);
      position: fixed;
      top: 0;
      left: 0;
      width: 100vw;
      height: 100vh;
    }
  }

  & > .center {
    @media screen and (max-width: 991px) {
      position: fixed;
      background-color: #fff;
      top: 0;
      right: -303px;
      width: 303px;
      height: 100vh;
      z-index: 8000;
      padding: 40px 50px 150px 50px;
      overflow-y: scroll;
      transition: 0.3s;

      &.active {
        right: 0;

        + .center-bg {
          visibility: visible;
          opacity: 1;
        }
      }

      .icons {
        div {
          margin: 10px 0;

          a {
            font-size: 18px;
            display: block;
            width: 100%;

            &:hover {
              color: #777;

              i {
                color: #777;
              }
            }

            i {
              margin-right: 10px;
            }
          }
        }
      }

      .btn-close {
        padding: 7px;
        background-color: #fff;
        border: 1px solid #777;
        border-radius: 50px;

        &:hover {
          background-color: #ddd;
        }
      }

      .userPhoto-component {
        border: #777 2px solid;
        border-radius: 50px;
      }

      ul {
        margin-top: 20px;
        padding: 0;
        font-size: 28px;
        margin-bottom: 100px;

        li {
          margin-bottom: 15px;

          div {
            &:hover {
              color: #777;
            }
          }
        }
      }
    }

    @media screen and (min-width: 992px) {
      height: 70px;
      left: 50%;
      transform: translate(-50%);
      position: absolute;

      & > ul {
        display: flex;
        height: 100%;

        & > .transetion {
          & > li {
            height: 100%;
            cursor: pointer;
            overflow-y: hidden;
            font-size: 22px;
            position: relative;
            width: 100px;
            display: flex;
            justify-content: center;

            & > .nav-list-item {
              width: 100%;
              height: 200%;
              position: absolute;
              top: 0;
              transition: 0.3s;

              & > div {
                width: 100%;
                display: flex;
                height: 50%;
                align-items: center;
                justify-content: center;
              }
            }

            &:hover {
              border-bottom: 3px solid black;

              & > .nav-list-item {
                top: -100%;
              }
            }
          }
        }

        & > li {
          height: 100%;
          cursor: pointer;
          overflow-y: hidden;
          font-size: 22px;
          position: relative;
          width: 100px;
          display: flex;
          justify-content: center;

          & > .nav-list-item {
            height: 200%;
            position: absolute;
            top: 0;
            transition: 0.3s;

            & > div {
              display: flex;
              height: 50%;
              align-items: center;
              justify-content: center;
            }
          }

          &:hover {
            border-bottom: 3px solid black;

            & > .nav-list-item {
              top: -100%;
            }
          }
        }
      }
    }
  }

  .right {
    right: 40px;
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
      justify-content: end;

      .search-bar {
        background-color: $bg-gray;
        padding: 10px 10px 10px 50px;
        border-radius: 50px;
        border: none;

        height: 45px;
        font-size: 18px;

        @media screen and (min-width: 992px) {
          width: 180px;
        }

        @media screen and (max-width: 991px) {
          visibility: hidden;
          width: 0px;

          &.active {
            visibility: visible;
            width: calc(100% - 20px);

            + .bi-search {
              left: calc(4px + 20px);
            }
          }
        }

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

    .nav-bar-icon {
      position: relative;
      width: 100%;
      height: 100%;
      display: flex;
      align-items: center;

      @media screen and (max-width: 991px) {
        &:not(:last-child) {
          margin-left: -15px;
        }
      }

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
        top: 40%;
        left: 53%;
        font-size: 12px;
      }

      .countFavorites {
        cursor: pointer;
        position: absolute;
        top: 35%;
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
        visibility: hidden;

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
</style>
