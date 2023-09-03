<template>
  <header>
    <section class="header-top">
      <a class="back-btn" href="/"
        ><i class="bi bi-chevron-left"></i> Back to Flex</a
      >
      <div class="header-center">
        <a href="/ReservationIndex">一對一課程</a>
        <a href="/ActivityIndex">活動</a>
      </div>
      <div class="user-box">
        <a v-if="memberId == 0" class="login" href="/login">登入</a>
        <div v-else class="user">
          <a href="/user" class="personal-img-wrapper">
            <userPhoto
              class="userPhoto-component"
              :width="36"
              :height="36"
            ></userPhoto>
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
      <button @click="hideHeaderTop" class="btn-close"></button>
    </section>
    <div @click="hideHeaderTop" class="sidebar-bg"></div>
    <section class="header-main">
      <a href="/FlexClub" class="logo-box">
        <div class="img-box">
          <image
            src="https://localhost:8080/public/LOGO/FlexLogoDark.png"
          ></image>
        </div>
        <div class="title blue">Pots</div>
        <div class="title red">Club</div>
      </a>
      <div class="d-none d-lg-block">
        <a href="/ReservationIndex" class="btn btn-primary">預約一對一課程</a>
        <a href="/ActivityIndex" class="ms-3 btn btn-danger">參加活動</a>
      </div>
      <div @click="activateHeaderTop" class="d-block d-lg-none list">
        <i class="bi bi-list"></i>
      </div>
    </section>
  </header>
</template>

<script setup>
import { ref, onMounted } from "vue";
const getApiStore = useGetApiDataStore();
const { setLoginSuccess } = getApiStore; //function透過store取資料
const { getData } = getApiStore;
import { storeToRefs } from "pinia";
import { useGetApiDataStore } from "@/stores/useGetApiDataStore.js";
import axios from "axios";
import userPhoto from "@/components/user/userPhoto.vue";
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
    .catch((error) => {});
}

function activateHeaderTop() {
  const headerTop = document.querySelector(".header-top");
  headerTop.classList.add("active");
}

function hideHeaderTop() {
  const headerTop = document.querySelector(".header-top");
  headerTop.classList.remove("active");
}
window.addEventListener("resize", hideHeaderTop);
onMounted(() => {});
</script>

<style scoped lang="scss">
header {
  padding: 0;

  @media screen and (min-width: 992px) {
    height: 106px;
  }

  @media screen and (max-width: 991px) {
    height: 70px;
  }

  @media screen and (max-width: 991px) {
    .sidebar-bg {
      visibility: hidden;
      position: fixed;
      top: 0;
      left: 0;
      width: 100vw;
      height: 100vh;
      opacity: 0;
      backdrop-filter: blur(10px);
      z-index: 5100;
      transition: 0.3s;
      background-color: rgba($color: #000, $alpha: 0.5);
    }
  }

  @media screen and (max-width: 991px) {
    .user-box {
      margin-bottom: 50px;

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
          width: 60%;
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
            position: absolute;
            left: 40%;
            top: 160px;

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
          width: 35px;
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
  }

  .list {
    i {
      font-size: 27px;
    }

    cursor: pointer;
  }

  .header-top {
    display: flex;

    @media screen and (min-width: 992px) {
      height: 36px;
      background-color: #112a4f;
      justify-content: space-between;
      align-items: center;
      padding: 0 40px;

      .btn-close {
        display: none;
      }

      .login {
        padding: 0 10px;

        &:hover {
          height: 100%;
          line-height: 36px;
          background-color: rgba(255, 255, 255, 0.3);
        }
      }

      .back-btn {
        &:hover {
          height: 100%;
          line-height: 36px;
          background-color: rgba(255, 255, 255, 0.3);
          padding-right: 5px;
        }

        i {
          color: #fff;
        }
      }
    }

    @media screen and (max-width: 991px) {
      position: fixed;
      top: 0;
      right: -270px;
      height: 100vh;
      width: 270px;
      z-index: 5500;
      background-color: #fff;
      transition: 0.3s;
      flex-direction: column-reverse;
      padding: 40px;

      .btn-close {
        border-radius: 50px;
        border: 1px solid #333;
        margin-left: auto;
        margin-bottom: 10px;
        padding: 7px;

        &:hover {
          background-color: #ddd;
        }
      }

      .back-btn {
        margin-top: auto;
        text-align: center;
        font-size: 20px;
        border-radius: 10px;

        &:hover {
          background-color: #ddd;
        }
      }

      .login {
        text-align: center;
        border-radius: 50px;
        border: #333 1px solid;
        width: 70px;
        padding: 5px 0;
        margin: 0 auto 10px;

        &:hover {
          background-color: #ddd;
        }
      }

      .header-center {
        display: flex;
        flex-direction: column;

        a {
          font-size: 20px;
          margin-top: 25px;
          font-weight: bold;
        }
      }

      &.active {
        right: 0px;

        & + .sidebar-bg {
          visibility: visible;
          opacity: 1;
        }
      }
    }

    .header-center {
      @media screen and (min-width: 992px) {
        display: none;
      }
    }

    @media screen and (min-width: 992px) {
      a {
        color: #fff;
      }
    }
  }

  .header-main {
    padding: 0 40px;
    height: 70px;
    display: flex;
    align-items: center;
    justify-content: space-between;

    .logo-box {
      display: flex;
      align-items: end;

      &:hover {
        opacity: 0.8;
      }

      .img-box {
        width: 80px;
      }

      .title {
        font-weight: bold;
        font-style: italic;

        &.blue {
          margin-left: -15px;
        }

        &.red {
          color: red;
        }
      }
    }
  }
}
</style>
