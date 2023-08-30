<template>
  <nav class="navbar">
    <div class="nav-left">
      <router-link to="/CustomerIndex" class="logo-wrapper">
        <img src="@/../public/LOGO/FlexLogoLight.png" class="logo" />
        <h1>FLEX</h1>
      </router-link>
    </div>

    <div class="nav-right">
      <ul>
        <li>
          <router-link to="/CustomeShoes" class="transetion">
            <div class="nav-list-item">
              <div>客製商品</div>
              <div class="d-none d-lg-block">客製商品</div>
            </div>
          </router-link>
        </li>
        <li>
          <router-link to="/CustomeShoes/Contact" class="transetion">
            <div class="nav-list-item">
              <div>合作洽詢</div>
              <div class="d-none d-lg-block">合作洽詢</div>
            </div>
          </router-link>
        </li>
        <li>
          <router-link to="/CustomeShoes/FAQ" class="transetion">
            <div class="nav-list-item">
              <div>常見問題</div>
              <div class="d-none d-lg-block">常見問題</div>
            </div>
          </router-link>
        </li>
      </ul>
      <div class="text-white ps-3 pe-1 d-none d-lg-block">|</div>
      <div class="user-box">
        <a v-if="memberId == 0" href="/login" class="login">
          <div>登入</div>
        </a>
        <div v-else class="user">
          <a href="/user" class="personal-img-wrapper">
            <userPhoto class="userPhoto-component" :width="36" :height="36"></userPhoto>
          </a>
          <div class="drop-list">
            <div class="d-lg-flex">
              <h3>Hi,</h3>
              <h3>{{ memberName }}</h3>
            </div>
            <a href="javascript:;" @click="logout" class="logout-btn">登出</a>
          </div>
        </div>
      </div>
      <div class="close-wrapper">
        <button type="button" class="btn-close d-lg-none" aria-label="Close">
        </button>
      </div>
      <router-link to="/" class="normal">
        <div>Back to Flex<i class="bi bi-chevron-right"></i></div>
      </router-link>
    </div>
    <div class="list-bg d-lg-none"></div>
    <i class="bi bi-list nav-list"></i>
  </nav>
  <div id="place"></div>
</template>

<script setup>
import { ref, onMounted } from "vue";
const getApiStore = useGetApiDataStore();
const { setLoginSuccess } = getApiStore; //function透過store取資料
const { getData } = getApiStore;
import { storeToRefs } from "pinia";
import { useGetApiDataStore } from "@/stores/useGetApiDataStore.js";
import axios from "axios";
import userPhoto from '@/components/user/userPhoto.vue';
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
onMounted(() => {
  const right = document.querySelector('.nav-right');
  document.querySelector('.nav-list').addEventListener('click', () => {
    right.classList.add('active');
  })

  const closeRight = () => {
    right.classList.remove('active');
  };

  document.querySelector('.list-bg').addEventListener('click', closeRight);
  document.querySelector('.btn-close').addEventListener('click', closeRight);
  window.addEventListener('resize', closeRight);
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

  &>.nav-left,
  &>.nav-right {
    @extend .nav-height;
  }

  &>.nav-left {
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

  .nav-list {
    @media screen and (min-width: 992px) {
      display: none;
    }

    @media screen and (max-width: 991px) {
      color: #fff;
      font-size: 30px;
      cursor: pointer;
      margin-right: 20px;
    }
  }

  @media screen and (max-width: 991px) {
    .list-bg {
      position: fixed;
      transition: .3s;
      top: 0;
      left: 0;
      width: 100vw;
      height: 100vw;
      z-index: 10;
      background-color: rgba($color: #000, $alpha: .5);
      backdrop-filter: blur(10px);
      visibility: hidden;
      opacity: 0;
    }
  }

  .nav-right {
    display: flex;

    @media screen and (max-width: 991px) {
      flex-direction: column-reverse;
      align-items: start;
      position: fixed;
      height: 100vh;
      z-index: 700;
      justify-content: start;
      background-color: #eee;
      top: 0;
      right: -250px;
      width: 250px;
      padding: 0 30px;
      transition: .3s;

      &.active {
        right: 0;

        &+.list-bg {
          visibility: visible;
          opacity: 1;
        }
      }

      .close-wrapper {
        margin-top: 30px;
        display: flex;
        justify-content: center;
        width: 100%;
        align-items: center;

        button {
          width: 30px;
          height: 30px;
          border: 1px solid #000;
          border-radius: 50px;

          &:hover {
            background-color: #bbb;
          }
        }
      }

      .transetion {

        &>div {
          &>div {
            margin-top: 15px;
            font-size: 23px;
            font-weight: bold;

            &:first-child {
              margin-top: 25px;
            }
          }
        }
      }

      .normal {
        position: absolute;
        bottom: 20px;
        left: 20%;
        font-size: 20px;
        padding: 10px 12px 10px 20px;
        border-radius: 15px;

        &:hover {
          background-color: rgba($color: #ddd, $alpha: .6);
        }

        &>div {
          font-weight: bold;
          color: #000;
        }
      }

      .login,
      .logout-btn {
        position: absolute;
        bottom: 80px;
      }

      .login-btn {
        left: 45%;
      }

      .logout-btn {
        left: 42%;
      }

      .user-box {
        margin-top: 15px;

        .user {
          // position: relative;
          display: flex;
          align-items: center;
          justify-content: space-between;



          .personal-img-wrapper {
            display: block;
            width: 50px;
            border-radius: 50px;
            overflow: hidden;

          }

          .drop-list {
            display: flex;
            flex-direction: column;
            width: 50%;
            justify-content: center;
            align-items: center;

            h3 {
              font-size: 22px;
              white-space: nowrap;
            }

            a {
              display: flex;
              justify-content: center;
              font-size: 15px;
              background: #333;
              color: #fff;
              border-radius: 50px;
              padding: 5px 15px;

              &:hover {
                background: #555;
              }
            }
          }
        }
      }
    }

    @media screen and (min-width: 992px) {
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

      .login,
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
    }



    &>ul {
      display: flex;

      @media screen and (max-width: 991px) {
        flex-direction: column;
        align-items: center;
        justify-content: start;
      }

      @media screen and (min-width: 992px) {
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
                top: -68%;
              }
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
