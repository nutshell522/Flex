<template>
  <NavBar></NavBar>
  <!-- 搜尋區 -->
  <div class="search-container">
    <div class="row row2">
      <div class="col-3">
        <input
          v-model="searchArea"
          class="form-control search-input"
          placeholder="請輸入地區"
        />
      </div>

      <div class="col-7">
        <VueMultiselect
          class="selectedBlock"
          v-model="selected"
          :options="options"
          :max="2"
          :searchable="false"
          :multiple="true"
          placeholder="選擇運動類別，最多2項"
        >
        </VueMultiselect>
      </div>

      <div class="col">
        <button class="btn btn-primary" @click="sendSelectedValues">
          搜尋
        </button>
      </div>
    </div>
  </div>

  <!-- 湯圓區 -->
  <div class="row cardbody">
    <div
      v-for="(activity, index) in info"
      :key="index"
      class="card col-4 cards"
    >
      <div class="indexImg">
        <img
          :src="imgBaseUrl + '/Public/Img/Activity/' + activity.imgPath"
          class="card-img-top"
          alt="..."
        />
      </div>
      <div class="card-body">
        <h5 class="card-title">{{ activity.activityName }}</h5>
        <!-- 使用計算屬性將日期格式化為所需形式 -->

        <p class="card-text" style="position: absolute; bottom: 50px">
          <font-awesome-icon
            icon="calendar-days"
            style="color: #ffd562; margin-right: 5px"
            bounce
          />{{ formatDate(activity.activityDate) }}
        </p>
        <a
          :href="'activityInfo/' + activity.activityId"
          style="position: absolute; bottom: 10px"
          class="btn btn-primary"
          >前往報名</a
        >
      </div>
    </div>
  </div>

  <HomeFooter></HomeFooter>
</template>
    
<script setup >
import axios from "axios";
import { ref, reactive, onMounted } from "vue";
import { useRoute } from "vue-router";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import VueMultiselect from "vue-multiselect";
import NavBar from "@/components/activity/ActivityNav.vue";
import HomeFooter from "@/components/home/footer.vue";

const selected = ref(null);
const options = ["路跑", "自行車", "健行", "登山", "瑜珈"];
const searchArea = ref("");
let requestData = ref({});

//icon
library.add(fas);
//得到照片路徑
const imgBaseUrl = ref(import.meta.env.VITE_API_BASEADDRESS);
const info = ref([]);

// 按下搜尋鈕獲得最終篩選條件
const sendSelectedValues = () => {
  const selectedVaules = getSelectedValues();
  requestData = {
    searchArea: searchArea.value || null,
    option1: selectedVaules.option1,
    option2: selectedVaules.option2,
  };
  console.log(requestData);
  //呼叫後端
  sendSearchRequest(requestData);
};

//把篩選條件變成物件
function getSelectedValues() {
  const selectedOptions = selected.value || [];
  const option1 = selectedOptions[0] || null;
  const option2 = selectedOptions[1] || null;
  return {
    option1: option1,
    option2: option2,
  };
}

// 發送篩選條件到後端
const sendSearchRequest = (data) => {
  console.log(data);
  var uri = "https://localhost:7183/api/Activity/index";
  axios
    .post(uri, data)
    .then((res) => {
      console.log(res.data);
      const currentDate = new Date(); //得到目前的日期和時間

      const filterInfo = res.data.filter((activity) => {
        const activityBookEndTime = new Date(activity.activityBookEndTime);
        return activityBookEndTime >= currentDate;
      });

      info.value = filterInfo;
    })
    .catch((err) => {
      console.log(err);
    });
};

onMounted(() => {
  sendSearchRequest(requestData);
});

// 建一個計算屬性 formatDate來格式化日期 (不要時間，只要日期)
const formatDate = (dateString) => {
  const date = new Date(dateString);
  return date.toLocaleDateString(); // 格式化為本地化的日期字串
};
</script>
<style src="vue-multiselect/dist/vue-multiselect.css"></style>
<style scoped>
.indexImg {
  min-height: 195px;
  max-height: 195px;
  width: 300px;
  overflow: hidden;
}

.card img {
  transition: transform 1s;
  min-height: 195px;
  max-height: 195px;
  width: 300px;
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
  justify-content: center;
}

.selectedBlock {
  width: 100%; /* 调整为适当的宽度 */
}

.search-input {
  height: 43px;
}

.search-container {
  text-align: center; /* 水平居中 */
  margin-top: 50px; /* 调整上边距 */
  display: flex;
  position: relative;
}

.row2 {
  position: absolute;
  display: flex;
  /* align-items: center; */
  margin-left: 10%;
}
</style>