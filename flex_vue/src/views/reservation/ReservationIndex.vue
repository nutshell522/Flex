<template>
  <div class="row cardbody">
    <div
      v-for="(speaker, index) in cardsInfo"
      :key="index"
      class="card mb-3 col-4 cards"
      style="width: 18rem"
    >
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
        <a :href="'speakerInfo/' + speaker.speakerId" class="btn btn-primary"
          >預約諮詢</a
        >
      </div>
    </div>
  </div>






</template>

<script setup>
import axios from "axios";
import { ref, reactive, onMounted } from "vue";
const cardsInfo = ref([]);
const imgBaseUrl = ref(import.meta.env.VITE_API_BASEADDRESS);

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
.speakerIndexImg{
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
  margin-bottom: 35px;
  margin-right: 35px;
  padding: 0;
  border: none;
  height: 350px;
  width: 300px;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); /* 水平偏移，垂直偏移，模糊度，颜色 */
}
.cards {
  margin-right: 70px;
  margin-bottom: 70px;
}

.cardbody {
  margin: 100px;
}
</style>
