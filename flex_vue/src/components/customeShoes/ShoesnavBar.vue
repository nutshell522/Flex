<template>
  <nav class="navbar">
    <div class="left">
      <router-link to="/CustomerIndex" class="logo-wrapper">
        <img src="@/../public/LOGO/FlexLogoLight.png" class="logo" />
        <h1>FLEX</h1>
      </router-link>
    </div>
    <div class="right">
      <ul>
        <li>
          <router-link to="/CustomeShoes" class="transetion">
            <div class="nav-list-item">
              <div>客製商品</div>
              <div>客製商品</div>
            </div>
          </router-link>
        </li>
        <li>
          <router-link to="/CustomeShoes/Contact" class="transetion">
            <div class="nav-list-item">
              <div>合作洽詢</div>
              <div>合作洽詢</div>
            </div>
          </router-link>
        </li>
        <li>
          <router-link to="/CustomeShoes/FAQ" class="transetion">
            <div class="nav-list-item">
              <div>常見問題</div>
              <div>常見問題</div>
            </div>
          </router-link>
        </li>
      </ul>
      <div class="text-white ps-3 pe-1">|</div>
      <div class="user-box h-100">
        <a v-if="memberId == 0" href="/login" class="normal">
          <div>登入</div>
        </a>
        <div v-else class="user">
          <a href="/user" class="personal-img-wrapper">
            <img v-if="imageSrc && imageSrc.value" :src="`${baseAddress}Public/Img/${imageSrc.value.imgPath}`" />
            <img v-else :src="`../../../../public/imgs/member.jpg`" alt="" />
          </a>
          <div class="drop-list">
            <h3>Hi,{{ memberName }}</h3>
            <a href="javascript:;" @click="logout">登出</a>
          </div>
        </div>
      </div>
      <router-link to="/" class="normal">
        <div>Back to Flex<i class="bi bi-chevron-right"></i></div>
      </router-link>
    </div>
  </nav>
  <div id="place"></div>
</template>

<script setup>
import { ref } from "vue";
const getApiStore = useGetApiDataStore();
const { setLoginSuccess } = getApiStore; //function透過store取資料
const { getData } = getApiStore;
import { storeToRefs } from "pinia";
import { useGetApiDataStore } from "@/stores/useGetApiDataStore.js";
import axios from "axios";
const { handleLogout } = getApiStore; //function透過store取資料

//登出
function logout() {
  localStorage.removeItem("loggedInUser");
  handleLogout();
}
const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const loggedInUser = localStorage.getItem("loggedInUser");
let memberId = 0;
if (loggedInUser) {
  const memberInfo = JSON.parse(loggedInUser);
  memberId = memberInfo.memberId;
} else {
  memberId = 0;
}

const imageSrc = ref();
const memberName = ref("");

if (memberId != 0) {
  axios
    .get(`${baseAddress}api/Users/${memberId}`)
    .then((response) => {
      memberName.value = response.data.name;
      imageSrc.value = response.data.imgPath;
    })
    .catch((error) => { });
}

let prevScrollPos = window.pageYOffset;
window.addEventListener('scroll', function () {
  let currentScrollPos = window.pageYOffset;
  if (currentScrollPos === 0 || prevScrollPos > currentScrollPos) {
    document.querySelector(".navbar").style.top = "0";
  } else {
    document.querySelector(".navbar").style.top = "-70px";
  }
  prevScrollPos = currentScrollPos;
})
</script>

<style scoped lang="scss">
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

.nav-height {
  height: $nav-height;
}

.navbar {
  @extend .nav-height;
  width: 100vw;
  background-color: #111;
  display: flex;
  justify-content: space-between;
  padding: 0 40px;
  position: fixed;
  top: 0;
  transition: top 0.3s;
  z-index: 500;

  &>.left,
  &>.right {
    @extend .nav-height;
  }

  &>.left {
    @extend .nav-height;

    &>.logo-wrapper {
      @extend .nav-height;
      width: 100px;
      display: flex;
      align-items: center;
      overflow: hidden;
      cursor: pointer;

      &:hover {
        .logo {
          filter: brightness(1.3);
        }
      }

      .logo {
        width: 100%;
        object-fit: cover;
      }

      &>h1 {
        display: flex;
        line-height: $nav-height;
        font-weight: bold;
        font-size: 40px;
        margin-top: 10px;
      }
    }
  }

  .right {
    display: flex;
    align-items: center;

    .user-box {
      .user {
        margin: 0 15px;
        position: relative;
        width: 100%;
        display: flex;
        height: 100%;
        align-items: center;

        .personal-img-wrapper {
          display: block;
          width: 40px;
          border-radius: 50px;
          overflow: hidden;
        }

        .drop-list {
          position: absolute;
          top: 100%;
          border: 1px solid;
          right: 0;
          background-color: #fff;
          width: 200px;
          height: 120px;
          display: none;
          align-items: center;
          justify-content: center;
          flex-direction: column;

          h3 {
            font-size: 25px;
          }

          a {
            margin-top: 15px;
            font-size: 20px;
            background: #333;
            color: #fff;
            border-radius: 50px;
            padding: 5px 15px;

            &:hover {
              background: #555;
            }
          }
        }

        &:hover .drop-list {
          display: flex;
        }
      }
    }

    .normal {
      margin-left: 5px;
      display: flex;
      align-items: center;
      padding: 10px 7px;
      border-radius: 10px;
      font-weight: bold;

      &:hover {
        background: rgba($color: #fff, $alpha: 0.4);
      }

      &>div {
        font-size: 17px;
        color: #fff;

        i {
          font-size: 18px;
          color: #fff;
        }
      }
    }

    &>ul {
      display: flex;
      height: 100%;

      &>li {
        width: 80px;
        height: 100%;
        cursor: pointer;

        .transetion {
          position: relative;
          overflow-y: hidden;
          width: 100%;
          height: 100%;
          display: flex;
          justify-content: center;
          align-items: center;

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
              color: #fff;
              font-size: 16px;
              display: flex;
            }
          }

          &:hover {
            &>.nav-list-item {
              top: -100%;
            }
          }
        }
      }
    }
  }
}

#place {
  @extend .nav-height;
}
</style>
