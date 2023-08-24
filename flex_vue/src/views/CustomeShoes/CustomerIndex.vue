<template>
  <div id="bg"></div>
  <ShoesnavBar></ShoesnavBar>

  <div id="banner">
    <div class="cover">
      <div class="text-container">
        <div class="slogan">LET'S GET STARTED</div>
        <div class="title">YOUR</div>
        <div class="title">OWN LIFE</div>
      </div>
      <div class="text-container text-hide">
        <div class="title">CUSTOMIZE </div>
        <div class="title">YOUR</div>
        <div class="title">EXCLUSIVE </div>
        <div class="title">PRODUCT</div>
        <div class="slogan">訂製屬於你的專屬商品</div>
      </div>
      <div class="title"></div>
    </div>
  </div>
  <!-- 把可展示的東西放banner2 -->
  <div id="banner2">
    <div id="Customize-Order-Page">
      <div class="order-title">立刻開始訂製商品</div>
      <a href="/CustomeShoes" class="btn-change-page">訂 購</a>
    </div>

  </div>
  <div class="box"></div>
  <video src="../../../public/videos/Video2.mp4" muted autoplay loop controls="false"></video>
  <div class="box2"></div>

  <homeFooter></homeFooter>
</template>
  
<script setup>
import ShoesnavBar from "@/components/customeShoes/ShoesnavBar.vue";
import homeFooter from "@/components/home/footer.vue";
import { onMounted, ref } from "vue";

onMounted(() => {
  const textHide = document.querySelector('.text-hide');
  window.addEventListener("scroll", (event) => {
    let currentScrollPos = window.pageYOffset;
    if (currentScrollPos === 0) {
      textHide.style.opacity = 0;
    } else if (currentScrollPos > 150) {
      textHide.style.opacity = 1;
    }
  })
})
</script>
  
<style scoped lang="scss">
@import url('https://fonts.googleapis.com/css2?family=Anton&family=Noto+Sans+TC:wght@100;300;400;500;700;900&display=swap');

#bg {
  background: rgba($color: #111, $alpha: 1);
  position: fixed;
  top: 0;
  left: 0;
  height: 100vh;
  width: 100vw;
  z-index: -50;
}

.box {
  height: 80vh;
}

.box2 {
  height: 600vh;
}

video {
  z-index: -30;
  position: sticky;
  top: 0;
}

#banner {
  position: absolute;
  width: 100vw;
  height: 500vh;
  background-color: rgba($color: #111, $alpha: 0.4);

  .text-container {
    margin-top: 8vw;
    padding-left: 50px;

    &.text-hide {
      margin-top: -7vw;
      opacity: 0;
      transition: .6s;

      .slogan {
        margin-top: 3vw;
        font-weight: bold;
      }
    }

    .slogan {
      margin-left: 6px;
      margin-bottom: -4vw;
      font-family: 'Anton', sans-serif;
      font-size: 2.5vw;
      color: #fff;
    }

    .title {
      font-family: 'Anton', sans-serif;
      font-size: 14.2vw;
      color: #fff;
      margin-bottom: -7vw;
    }
  }
}

#banner2 {
  background-color: #111;
  position: absolute;
  height: 350vh;
  top: 470vh;
  width: 100vw;
  z-index: 0;

  #Customize-Order-Page {
    width: 100vw;
    height: 150vh;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;

    .order-title {
      font-size: 5vw;
      color: #fff;
      margin-bottom: 35px;
    }

    .btn-change-page {
      padding: 10px 30px;
      border-radius: 50px;
      background-color: #fff;
      font-size: 30px;
      cursor: pointer;

      &:hover {
        background-color: #ddd;
      }
    }
  }
}
</style>