<template>
  <navBar></navBar>
  <main>
    <div class="text-carousel-container">
      <div class="text-carousel">
        <div class="text-carousel-items">
          <div class="text-carousel-title">免費寄送</div>
          <div class="text-carousel-body">適用於 NT$2,000 以上的訂單。</div>
        </div>
        <div class="text-carousel-items">
          <div class="text-carousel-title">反詐騙提醒</div>
          <div class="text-carousel-body">
            FLEX絕不會在電話中要求您提供信用卡資訊、ATM操作款、或儲值,請您提高警覺。
          </div>
        </div>
      </div>
    </div>
    <div class="container main-area mb-3">
      <a href="javascript:;" class="home-row">
        <div class="video-container">
          <video src="../../../public/videos/運動影片.mp4" muted autoplay loop controls="false"></video>
        </div>
        <div class="home-card">
          <div class="home-card-title">
            <p class="me-4">舉手投足</p>
            <p class="ms-4">暢動自如</p>
          </div>
          <div class="home-card-body">
            無論今天或明天將面對什麼訓練挑戰，這些必備款式讓你輕鬆應對每個動作。
          </div>
        </div>
      </a>
      <div class="home-row">
        <div class="home-row-title">
          <h3>引領潮流</h3>
        </div>
        <div class="row row-cols-2 gx-3">
          <a href="/men" class="img-wrapper col">
            <img src="../../../public/imgs/pexels-luis-zambrano-17570085.jpg" />
            <div class="img-text">男款</div>
          </a>
          <a href="/women" class="img-wrapper col">
            <img src="../../../public/imgs/pexels-daniel-duarte-17122658.jpg" />
            <div class="img-text">女款</div>
          </a>
        </div>
      </div>
      <div class="home-row">
        <div class="home-row-title">
          <h3>熱門推薦</h3>
          <div class="btn-wrapper">
            <button class="me-3 vueCarouselBtn" @click="showPrevHotSalesProduct">
              <i class="bi bi-chevron-left vueCarouselIcon"></i>
            </button>
            <button class="me-5 vueCarouselBtn" @click="showNextHotSalesProduct">
              <i class="bi bi-chevron-right vueCarouselIcon"></i>
            </button>
          </div>
        </div>
        <div class="home-product-list">
          <Carousel :items-to-show="4" :wrap-around="true" ref="hotSalesCarousel">
            <Slide v-for="card in hotSalesProduct" :key="card.productId" class="card text-center">
              <ProductCard :card="card"></ProductCard>
            </Slide>
          </Carousel>
        </div>
      </div>
      <div class="home-row">
        <div class="home-row-title">
          <h3>新品推薦</h3>
          <div class="btn-wrapper">
            <button class="me-3 vueCarouselBtn" @click="showPrevNewProduct">
              <i class="bi bi-chevron-left vueCarouselIcon"></i>
            </button>
            <button class="me-5 vueCarouselBtn" @click="showNextNewProduct">
              <i class="bi bi-chevron-right vueCarouselIcon"></i>
            </button>
          </div>
        </div>
        <div class="home-product-list">
          <Carousel :items-to-show="4" :wrap-around="true" ref="newProductsCarousel">
            <Slide v-for="card in newProducts" :key="card.productId" class="card text-center">
              <ProductCard :card="card"></ProductCard>
            </Slide>
          </Carousel>
        </div>
      </div>
    </div>
  </main>
  <homeFooter></homeFooter>
</template>

<script setup>
import navBar from "@/components/home/NavBar.vue";
import homeFooter from "../../components/home/footer.vue";
import ProductCard from "@/components/product/ProductCard.vue";
import { Carousel, Slide } from "vue3-carousel";
import axios from "axios";
import { onMounted, ref } from "vue";

const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const hotSalesProduct = ref([]);
const hotSalesCarousel = ref(null);
const newProducts = ref([]);
const newProductsCarousel = ref(null);

const getHotSalesProduct = async () => {
  await axios
    .get(
      `${baseAddress}api/Products/GetHotSalesOrNewProduct?isNewProduct=false`
    )
    .then((resopnse) => {
      hotSalesProduct.value = resopnse.data;
    })
    .catch((error) => {
      alert(error);
    });
};

const getNewProduct = async () => {
  await axios
    .get(`${baseAddress}api/Products/GetHotSalesOrNewProduct?isNewProduct=true`)
    .then((resopnse) => {
      newProducts.value = resopnse.data;
    })
    .catch((error) => {
      alert(error);
    });
};

const showPrevHotSalesProduct = () => {
  hotSalesCarousel.value.prev();
  hotSalesCarousel.value.updateSlideWidth();
};
const showNextHotSalesProduct = () => {
  hotSalesCarousel.value.next();
  hotSalesCarousel.value.updateSlideWidth();
};

const showPrevNewProduct = () => {
  newProductsCarousel.value.prev();
  newProductsCarousel.value.updateSlideWidth();
};
const showNextNewProduct = () => {
  newProductsCarousel.value.next();
  newProductsCarousel.value.updateSlideWidth();
};

onMounted(() => {
  getHotSalesProduct();
  getNewProduct();
});

//alert('Flex 優惠享不完 立即追蹤，優惠折扣從此不漏接(還沒做完喔!)');
</script>

<style lang="scss">
.text-link {
  &:hover {
    color: #888;
  }
}

main {
  padding-bottom: 120px;

  .text-carousel-container {
    height: 58px;
    width: 100vw;
    background-color: #f5f5f5;
    border-bottom: #ededed;
    overflow: hidden;
    display: flex;
    align-items: center;
    position: relative;

    .text-carousel {
      width: 200vw;
      display: flex;
      position: absolute;
      left: 0;
      transition: 0.3s;

      .text-carousel-items {
        width: 100vw;

        .text-carousel-title {
          text-align: center;
          font-size: 18px;
          font-weight: bold;
        }

        .text-carousel-body {
          text-align: center;
          font-size: 14px;
        }
      }
    }
  }

  .main-area {
    margin-top: 20px;

    .home-row {
      margin-bottom: 40px;

      .video-container {
        display: block;
        width: 100%;
        max-height: 700px;
        position: relative;
        overflow: hidden;

        video {
          width: 100%;
          object-fit: cover;
          object-position: center bottom;

          &::-webkit-media-controls-panel {
            display: none !important;
            /* Chrome和Safari中隱藏進度條 */
          }

          &::-webkit-media-controls {
            display: none !important;
            /* 在Chrome中隱藏進度條（舊版Chrome） */
          }

          &::-moz-media-controls-panel {
            display: none !important;
            /* 在Firefox中隱藏進度條 */
          }
        }
      }

      .home-card {
        margin-bottom: 20px;

        .home-card-title {
          font-size: 80px;
          font-weight: 500;
          text-align: center;

          p {
            padding: 0;
            margin: 0;

            &:first-child {
              margin-top: 20px;
            }

            &:not(:first-child) {
              margin-top: -40px;
            }
          }
        }

        .home-card-body {
          text-align: center;
          font-weight: 700;
          font-size: 18px;
        }
      }

      .home-row-title {
        display: flex;
        margin-top: 80px;
        margin-bottom: 20px;

        h3 {
          font-size: 25px;
          font-weight: 700;
          margin-right: auto;
        }

        .btn-wrapper {
          display: flex;
          align-items: center;

          &>*:not(:first-child) {
            margin-left: 10px;
          }

          a {
            @extend .text-link;
          }

          button {
            border-radius: 50%;
            border: none;
            width: 50px;
            height: 50px;
            font-size: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
          }
        }
      }

      .home-product-list {
        width: 100%;
        overflow: hidden;
        position: relative;
        min-height: 200px;

        .home-product-list-items {
          display: flex;
          background-color: #888;
          position: absolute;
          left: 0;

          .img-wrapper {
            display: block;
            overflow: hidden;
            position: relative;
            height: 200px;
            width: 300px;

            &:not(:first-child) {
              margin-left: 20px;
            }

            img {
              width: 100%;
              object-fit: cover;
            }
          }
        }
      }

      .img-wrapper {
        display: block;
        overflow: hidden;
        position: relative;

        img {
          width: 100%;
          object-fit: cover;
        }

        .img-text {
          position: absolute;
          bottom: 30px;
          left: 30px;
          color: #fff;
          font-size: 2vw;
          font-weight: 700;
        }
      }
    }
  }
}

.vueCarouselBtn {
  width: 50px;
  height: 50px;
  font-size: 20px;
  border-radius: 50%;
  background-color: #dbdbdb;
}

.vueCarouselBtn:hover {
  background-color: #ababab;
}

.vueCarouselBtn:hover .vueCarouselIcon {
  color: white;
}
</style>
