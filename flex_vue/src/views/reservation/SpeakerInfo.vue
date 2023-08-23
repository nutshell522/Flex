<template>
  <div class="container">


    <div class="row main bigRow">
      <div class="col-md-8">左
        <div class="featured-img">
          <img :src='imgBaseUrl + "/Public/Img/" + speaker.speakerImg' alt="Featured 1" class="speakerImg">
        </div>

        <p>講師姓名：{{ speaker.speakerName }}</p>
        <p>擅長領域：{{ speaker.fieldName }}</p>
        <p>講師描述：{{ speaker.speakerDescription }}</p>
        <p>駐點分店：{{ speaker.branchName }} ({{ speaker.branchAddress }})</p>





        <!-- 預約系統 -->
        <p>預約時間表</p>
        <div id="datePicker">

          <button id="prevButton"><font-awesome-icon icon="fa-solid fa-angles-left" beat-fade /></button>
          <span id="currentDate"></span>
          <button id="nextButton"><font-awesome-icon icon="fa-solid fa-angles-right" beat-fade /></button>
        </div>
        <div id="schedule">

        </div>

        <!-- 評論 -->
        
        <div id="reviewWhole">
    <h1>課程心得</h1>
    <!-- v-for迴圈每一個評論，生成評論卡 -->
    <div class="comment-card" v-for="comment in comments" :key="comment.id">
      <div class="comment-header">
        <!-- <img :src="comment.author.avatar" alt="Author Avatar" class="avatar" /> -->
        <div class="author-info">
          <h3>{{ comment.account }}</h3>
          <p>{{ formatDateTime(comment.creationTime) }}</p>
        </div>
      </div>
      <div class="comment-content">
        <p v-if="!comment.editing && !comment.expanded && comment.content.length > 150">
          {{ comment.content.slice(0, 150) }}...
        </p>
        <p v-else-if="!comment.editing">{{ comment.content }}</p>
        <textarea v-model="comment.editContent" v-if="comment.editing && canEdit(comment)" rows="4"></textarea>
      </div>
      <div class="comment-footer">
        <!-- 評分 -->
        <div class="rating">
          <span class="star" v-for="n in comment.rating" :key="n">★</span>
        </div>
        <button class="reviewButton" @click="allowEdit(comment)" v-if="canEdit(comment)">
        {{ comment.editing ? '取消' : '編輯' }}
      </button>

      <button class="reviewButton" @click="saveEditedComment(comment)" v-if="comment.editing && canEdit(comment)">
          儲存
      </button>
      </div>
    </div>



<!-- Button trigger modal -->
<button type="button" class="btn btn-primary reviewButton" data-bs-toggle="modal" data-bs-target="#exampleModal">
  新增心得
</button>

<!-- Modal -->
<div class="modal fade modal-dialog modal-dialog-centered" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">留下您的心得...</h1>
      </div>
        <!-- 用submit.prevent防止刷新整個頁面 -->
      <form @submit.prevent="addComment">
   
        <div class="modal-body">
            <!-- 新增評論的表單 -->
                <div class="comment-form">              
                   <p>{{userAccount}}</p>
                    <textarea v-model="newComment.content" placeholder="課程心得" required></textarea>

                    <star-rating @update:rating="setRating"></star-rating>              
                </div>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary reviewButton" data-bs-dismiss="modal">取消</button>
          <button type="submit" data-bs-dismiss="modal" class="btn btn-primary reviewButton">送出</button>
        </div>
    </form>
    </div>
  </div>
</div>

    
  </div>











      </div>


      <div class="col-md-4">
        右 <div class="text-end">
          <a href="https://localhost:8080" class="btn button" @click="getActivityId">
            <!-- icon -->
            <span class="icon">
              <img
                width="100"
                height="100"
                src="https://img.icons8.com/stickers/100/exercise.png"
                alt="exercise"
              />
            </span>
            <!-- 按鈕文字 -->
            <span style="font-size: 50px"> 預約 </span>
          </a>
        </div>

        <h2>人氣講師</h2>
        <h2>最多人預約</h2>
        <div class="image-container" v-for="(single,index) in TopThreeSpeaker" :key="index">
          <a :href="'/speakerInfo/' + single.fk_ReservationSpeakerId">
            <img :src="imgBaseUrl + '/Public/Img/' + single.speakerImg" alt="">
          </a>
        </div>

        <!-- <div class="image-container">
          <img src="https://image1.gamme.com.tw/news2/2016/63/83/qZqYnqaYmJ_dqaY.jpg" alt="">
        </div>

        <div class="image-container">
          <img src="https://img2.woyaogexing.com/2020/05/21/6bf45fa053594b24bf763725cba6b9e0!400x400.webp" alt="">
        </div> -->


      </div>
    </div>

  </div>
</template>

<script setup>
import { onMounted, reactive, ref } from "vue";
import axios from "axios";
import { useRoute } from "vue-router";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import StarRating from 'vue-star-rating'
library.add(fas);

const route = useRoute();
const speakerId = route.params.id;
console.log(speakerId);
const speaker = ref({});
const imgBaseUrl = ref(import.meta.env.VITE_API_BASEADDRESS);
const rating = ref(5); // 這裡初始化評分為 5
const fk_speakerId = route.params.id;
// const fk_memberId =5;
const fk_memberId = JSON.parse(localStorage.getItem('loggedInUser')).memberId;
const userAccount = localStorage.getItem('userAcc');
const comments = ref([]);
const setRating = (newRating) => {
  rating.value = newRating;
};
const TopThreeSpeaker = ref([]);



onMounted(() => {
  const datePicker = document.querySelector("#datePicker");
  const prevButton = document.querySelector("#prevButton");
  const nextButton = document.querySelector("#nextButton");
  const currentDateDisplay = document.querySelector("#currentDate");
  const schedule = document.querySelector("#schedule");

  let newDateResult;
  let newTimeResult;

  const loadSpeaker = async (id) => {
    //呼叫controller得到講師資訊
    axios
      .get(`https://localhost:7183/api/Reservation/id?id=${id}`)
      .then((res) => {
        console.log(res.data);
        speaker.value = res.data;
        console.log(speaker.value.branchId);
        console.log(speaker.value.speakerDescription);
      })
      .catch((err) => {
        console.log(err);
      });
  };

  ////呼叫controller得到講師資訊
  loadSpeaker(speakerId);

  const testTime = "2023-08-17T15:00:00";

  //把資料庫傳來的時間格式化為【年/月/日】字串
  const formatDate = (dateString) => {
    const date = new Date(dateString);
    return date.toLocaleDateString(); // 格式化為本地化的日期字串
  };
  const hasDate = formatDate(testTime);
  console.log(hasDate);

  //把資料庫傳來的時間格式化為【數字】時間字串
  const formatTime = (dateString) => {
    const date = new Date(dateString);
    const hour = date.getHours();
    return hour;
  };

  const hasTime = formatTime(testTime);
  console.log(hasTime);

  //呼叫後端，從資料庫得到這位講師已經被預約的時間
  const loadReservationHistory = async (id) => {
    axios
      .get(`https://localhost:7183/api/Reservation/GetReservationHistory${id}`)
      .then((res) => {
        const result = res.data;
        console.log(result);

        newDateResult = result.map((element) =>
          formatDate(element.reservationStartTime)
        );
        console.log(newDateResult);

        newTimeResult = result.map((element) =>
          formatTime(element.reservationStartTime)
        );
        console.log(newTimeResult);

        updateCalendar();

        // console.log(formatDate(result[0].reservationStartTime));
      })
      .catch((err) => {
        console.log(err);
      });
  };
  loadReservationHistory(speakerId);

  const timeSlots = [
    "11:00  - 12:00 ",
    "12:00  - 13:00 ",
    "13:00  - 14:00 ",
    "14:00  - 15:00 ",
    "15:00  - 16:00 ",
    "16:00  - 17:00 ",
    "17:00  - 18:00 ",
    "18:00  - 19:00 ",
    "19:00  - 20:00 ",
    "20:00  - 21:00 ",
    "21:00  - 22:00 ",
  ];

  let currentDate = new Date(); //創建一個包含right now日期和時間的 Date 物件
  console.log(currentDate);
  // 預約表的表頭顯示日期
  function showCurrentDate() {
    const startDate = new Date(currentDate);
    const endDate = new Date(startDate);
    endDate.setDate(startDate.getDate() + 6); //一週結束日期的數字設為: 開始日期的日期數字+6天

    console.log(startDate);

    console.log(endDate);

    currentDateDisplay.textContent = `${startDate.toLocaleDateString()} - ${endDate.toLocaleDateString()}`;
  }

  function createSchedule() {
    schedule.innerHTML = "";

    const table = document.createElement("table");
    table.className = "schedule-table";

    // 建立表的第一橫列 (日期)
    const headerRow = document.createElement("tr");
    headerRow.innerHTML = "<th>時間</th>";
    for (let i = 0; i < 7; i++) {
      const dateCell = document.createElement("th");
      const day = new Date(currentDate); //取得今天的月份+日期
      //迴圈第一圈：今天的日期數字，第二圈日期數字：+1
      day.setDate(currentDate.getDate() + i);
      //用getMonth( )方法產出的月份格式要+1
      const formattedDate = `${day.getMonth() + 1}/${day.getDate()}`;
      dateCell.textContent = formattedDate;

      headerRow.appendChild(dateCell);
    }

    //插入第一行日期的title
    table.appendChild(headerRow);

    // 外層迴圈產生最左側的時間直行
    for (const timeSlot of timeSlots) {
      const row = document.createElement("tr");
      const timeCell = document.createElement("td");
      timeCell.textContent = timeSlot;
      row.appendChild(timeCell);

      for (let i = 0; i < 7; i++) {
        const cell = document.createElement("td");
        cell.classList.add("schedule-cell");
        const day = new Date(currentDate); //取得今天日期時間
        day.setDate(currentDate.getDate() + i);
        //使用 data- 屬性來在元素上儲存自定義的資料
        cell.dataset.date = day.toLocaleDateString();
        cell.dataset.time = timeSlot.substring(0, 2); //取出開始時間點

        for (let i = 0; i < newDateResult.length; i++) {
          if (
            cell.dataset.date == newDateResult[i] &&
            cell.dataset.time == newTimeResult[i]
          ) {
            cell.classList.add("unable");
          } else {
            cell.addEventListener("click", handleCellClick);
          }
          row.appendChild(cell);
        }
      }

      table.appendChild(row);
    }

    schedule.appendChild(table);
  }

  function handleCellClick() {
    const date = this.dataset.date;
    const time = this.dataset.time;

    if (confirm(`您想要預約 ${date} 的 ${time} 嗎？`)) {
      this.classList.add("selected");
      this.removeEventListener("click", handleCellClick);
      const time2 = parseInt(time.substring(0, 2));
      const parts = date.split("/");
      const year = parseInt(parts[0]);
      const month = parseInt(parts[1]) - 1;
      const day = parseInt(parts[2]);
      const fullDateTime = new Date(year, month, day, time2);
      // alert(fullDateTime);

      axios
        .post("https://localhost:7183/api/Reservation/AddReservation", {
          fk_BookerId: 4,
          ReservationStartTime: fullDateTime,
          fk_ReservationSpeakerId: speakerId,
          fk_BranchId: speaker.value.branchId,
        })
        .then((res) => {
          console.log(res.data);
        })
        .catch((err) => {
          console.log(err);
        });
    }
  }

  prevButton.addEventListener("click", () => {
    currentDate.setDate(currentDate.getDate() - 7);
    updateCalendar();
  });

  nextButton.addEventListener("click", () => {
    currentDate.setDate(currentDate.getDate() + 7);
    updateCalendar();
  });

  function updateCalendar() {
    showCurrentDate();
    createSchedule();
  }


  //得到前三名講師
  const topThreeSpeaker = ()=>{
    axios.get("https://localhost:7183/api/Reservation/GetTopThreeSpeaker")
        .then(res=>{
          console.log(res.data);
          TopThreeSpeaker.value = res.data;
        })
        .catch(err=>{
          console.log(err);
        })
  }
  topThreeSpeaker();
});

//心得script
//從後端得到該講者的全部心得評論紀錄
const getAllComment = (fk_speakerId) =>{
  axios.get(`https://localhost:7183/api/Reservation/GetAllComment${fk_speakerId}`)
      .then(res=>{
        console.log(res.data);
        comments.value = res.data;
      })
      .catch(err=>{
        console.log(err);
      })
}

getAllComment(fk_speakerId)

const newComment = ref({
  fk_memberId: fk_memberId,
  account: userAccount,
  content: '',
  creationTime:"",
  rating: ""
});

const allowEdit = (comment) => {
  if (!comment.editing) {
    //如果評論不處於編輯模式(editing)，那評論的編輯內容就會是資料庫抓出來的content
    comment.editContent = comment.content;
  }
  //如果已經處於編輯模式，那按下去就會無法編輯(取消編輯)
  comment.editing = !comment.editing;
};


const saveEditedComment = (comment) => {
  if (comment.editContent.trim()) {
    //檢查編輯內容是否為空
    comment.content = comment.editContent;
    //關閉編輯
    comment.editing = false;
  }
};

//新增評論
const addComment = () => {
    //確認使用者Id有值和評論內容都有填寫
  if (newComment.value.fk_memberId && newComment.value.content) {
      const newCommentData = {
        fk_memberId: newComment.value.fk_memberId,
        content: newComment.value.content,
        fk_speakerId,
        rating: rating.value
      };
      
      try {
        comments.value.push({
        //用內建push方法向末端加一個評論
      id: "",     
      account: newComment.value.account,
      content: newComment.value.content,
      rating: rating.value,
      creationTime: Date.now(),
      expanded: false
    });

   
      // 發送 POST 請求到後端 API，並將新評論傳遞過去
      const response =  axios.post('https://localhost:7183/api/Reservation/AddComment', newCommentData);
                        
    //使用者新增完評論之後，要把值清空，讓他可以再次新增新的評論
      // newComment.value.account = '';
      newComment.value.content = '';
     
    } catch (error){
      console.error('addComment方法的錯誤：', error);
    }
  }
};


//檢查是否為本人要編輯
const canEdit = (comment) => {
  return comment.fk_memberId == fk_memberId; // 使用者 ID 與該筆評論的作者 ID 相符才允許編輯
};


const formatDateTime = (dateString) => {
    const date = new Date(dateString);
    
    const year = date.getFullYear();
    const month = date.getMonth() + 1;
    const day = date.getDate();

    const hours = date.getHours();
    const minutes = date.getMinutes();

    // 組裝成我要的格式
    const formattedDateTime = `${year}/${month}/${day} ${hours}:${minutes}`;
    return formattedDateTime;
}






</script>

<style>
.speakerImg{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    -o-object-fit: contain;
    object-fit: contain;
}

.main {
  font-family: Arial, sans-serif;
  text-align: center;
}

#schedule {
  display: flex;
  justify-content: center;
}

.schedule-table {
  border-collapse: collapse;
  margin: 20px auto;
}

#schedule .schedule-table th,
#schedule .schedule-table td {
  border: 1px solid #111;
  padding: 10px;
  cursor: pointer;
}

#schedule .schedule-table td.selected {
  background-color: green;
  color: white;
}

.unable {
  background-color: rosybrown;
  pointer-events: none;
}

#currentDate {
  margin: 15px;
}


/* 心得樣式 */
#reviewWhole {
  font-family: Arial, sans-serif;
  text-align: center;
  padding: 20px;
}

.comment-card {
  border: 1px solid #ddd;
  border-radius: 8px;
  padding: 15px;
  margin-bottom: 20px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.comment-header {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

.avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  margin-right: 10px;
}

.author-info {
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.comment-content {
  margin-bottom: 10px;
}

.comment-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.rating {
  font-size: 20px;
}

.star {
  color: #FFD700;
}

.reviewButton {
  background-color: #007BFF;
  color: rgb(126, 32, 32);
  border: none;
  padding: 5px 10px;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.reviewButton:hover {
  background-color: #0056b3;
}

.comment-card textarea {
  width: 100%;
  padding: 5px;
  border: 1px solid #ddd;
  border-radius: 5px;
}


/* 前三名講師列 */
 /* 定義外框樣式 */
 .image-container {
    border: 1px solid rgb(16, 36, 117); /* 外框顏色和寬度 */
    width: 300px; /* 圖片寬度 */
    height: 200px; /* 圖片高度 */
    display: inline-block; /* 使圖片並排顯示 */
    margin: 25px; /* 外邊距 */
  }

  /* 使圖片填充外框 */
  .image-container img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }

  .icon {
  display: inline-block;
  margin-right: 10px;
  /* 調整圖標和文字之間的間距 */
  font-size: 20px;
  /* 調整圖標大小 */
}

</style>
