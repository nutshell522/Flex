<template>
  <NavBar></NavBar>
  <div class="page-container">
    <!-- 輪播照片 -->
    <carousel :autoplay="3000" :wrap-around="true">
      <slide
        v-for="(item, index) in activityHighlights"
        :key="index"
        style="width: 100%; height: 550px"
      >
        <img :src="item.imageUrl" alt="Activity Highlight" />
      </slide>
    </carousel>

    <!-- 湯圓區 -->
    <div class="cardbody row row-cols-4 gx-3">
      <div v-for="(speaker, index) in cardsInfo" :key="index" class="col">
        <div class="card mb-3 cards">
          <div class="speakerIndexImg">
            <img
              :src="imgBaseUrl + '/Public/Img/Speaker/' + speaker.speakerImg"
              class="card-img-top"
              alt="..."
            />
          </div>
          <div class="card-body">
            <h5 class="card-title">{{ speaker.speakerName }}</h5>
            <!-- 使用計算屬性將日期格式化為所需形式 -->
            <p class="card-text">{{ speaker.fieldName }}</p>
            <a
              :href="'speakerInfo/' + speaker.speakerId"
              class="btn btn-primary"
              >預約諮詢</a
            >
          </div>
        </div>
      </div>
    </div>
  </div>

  <HomeFooter></HomeFooter>
</template>

<script setup>
import NavBar from "@/components/activity/ActivityNav.vue";
import HomeFooter from "@/components/home/footer.vue";
import axios from "axios";
import { ref, reactive, onMounted } from "vue";
import "vue3-carousel/dist/carousel.css";
import { Carousel, Slide, Pagination, Navigation } from "vue3-carousel";
const cardsInfo = ref([]);
const imgBaseUrl = ref(import.meta.env.VITE_API_BASEADDRESS);
const activityHighlights = ref([
  {
    imageUrl:
      "https://s3.nikecdn.com/events-platform/pre-prod/NET_Admin/header/2020-12-31_1707_psa_pc_1382x700.jpg",
  },
  {
    imageUrl:
      "https://d9xe416pf8kwg.cloudfront.net/media/images/f3279eb5-6f10-4604-a20e-d5649b99a564.jpg",
  },
  {
    imageUrl:
      "https://d9xe416pf8kwg.cloudfront.net/media/images/04a997a1-5baf-414d-a438-1a1a35789bf6.jpg",
  },
  {
    imageUrl:
      "https://d9xe416pf8kwg.cloudfront.net/media/images/68d85ccb-f577-4aa4-b3b0-d1946e77e620.jpg",
  },
  {
    imageUrl:
      "https://d9xe416pf8kwg.cloudfront.net/media/images/504ee258-b9c5-48cb-9dbd-5486aeedade1.jpg",
  },
]);

onMounted(() => {
  var uri = "https://localhost:7183/api/Reservation/index";
  axios
    .get(uri)
    .then((res) => {
      console.log(res.data);
      cardsInfo.value = res.data;
    })
    .catch((err) => {
      console.log(err);
    });
});
</script>

<style scoped>
.page-container {
  background-color: #03031e;
  color: #fff;
}

.speakerIndexImg {
  min-height: 200px;
  max-height: 200px;
  width: 300px;
  overflow: hidden;
}

.card img {
  transition: transform 1s;
  min-height: 100%;
  max-height: 100%;
  width: 100%;
}

.card img:hover {
  transform: scale(1.2);
}

.card {
  overflow: hidden;
  /* margin-bottom: 35px;
  margin-right: 35px; */
  padding: 0;
  border: none;
  height: 350px;
  width: 300px;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); /* 水平偏移，垂直偏移，模糊度，颜色 */
}
.cards {
  /* margin-right: 70px;
  margin-bottom: 70px; */
}

.cardbody {
  margin: 100px;
}
</style>
