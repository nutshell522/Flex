<template>
  <NavBar></NavBar>
  <div class="page-container">
    <div class="container">
      <div class="row main bigRow">
        <div class="col-md-8">
          <div class="speaker-img">
            <img
              :src="imgBaseUrl + '/Public/Img/Speaker/' + speaker.speakerImg"
              alt="Featured 1"
              class="speakerImg"
            />
          </div>

          <div class="infoBlock">
            <p>講師姓名：{{ speaker.speakerName }}</p>
            <p>擅長領域：{{ speaker.fieldName }}</p>
            <p>講師描述：{{ speaker.speakerDescription }}</p>
            <p>
              駐點分店：{{ speaker.branchName }} ({{ speaker.branchAddress }})
            </p>
          </div>
          <div class="bookingBlock">
            <!-- 預約系統 -->
            <p>預約時間表</p>
            <div id="datePicker">
              <button id="prevButton">
                <font-awesome-icon icon="fa-solid fa-angles-left" beat-fade />
              </button>
              <span id="currentDate"></span>
              <button id="nextButton">
                <font-awesome-icon icon="fa-solid fa-angles-right" beat-fade />
              </button>
            </div>
            <div id="schedule"></div>
          </div>
          <!-- 評論 -->

          <div id="reviewWhole">
            <h1>課程心得</h1>
            <!-- v-for迴圈每一個評論，生成評論卡 -->
            <div
              class="comment-card"
              v-for="comment in comments"
              :key="comment.id"
            >
              <div class="comment-header">
                <!-- <img :src="comment.author.avatar" alt="Author Avatar" class="avatar" /> -->
                <div class="author-info">
                  <h3>{{ comment.account }}</h3>
                  <p>{{ formatDateTime(comment.creationTime) }}</p>
                </div>
              </div>
              <div class="comment-content">
                <p
                  v-if="
                    !comment.editing &&
                    !comment.expanded &&
                    comment.content.length > 150
                  "
                >
                  {{ comment.content.slice(0, 150) }}...
                </p>
                <p v-else-if="!comment.editing">{{ comment.content }}</p>
                <textarea
                  v-model="comment.editContent"
                  v-if="comment.editing && canEdit(comment)"
                  rows="4"
                ></textarea>
              </div>
              <div class="comment-footer">
                <!-- 評分 -->
                <div class="rating">
                  <span class="star" v-for="n in comment.rating" :key="n"
                    >★</span
                  >
                </div>
                <button
                  class="reviewButton"
                  @click="allowEdit(comment)"
                  v-if="canEdit(comment)"
                >
                  {{ comment.editing ? "取消" : "編輯" }}
                </button>

                <button
                  class="reviewButton"
                  @click="saveEditedComment(comment)"
                  v-if="comment.editing && canEdit(comment)"
                >
                  儲存
                </button>
              </div>
            </div>

            <!-- Button trigger modal -->
            <button
              type="button"
              class="btn btn-primary reviewButton"
              data-bs-toggle="modal"
              data-bs-target="#exampleModal"
            >
              新增心得
            </button>

            <!-- 新增評論的Modal -->
            <div
              class="modal fade modal-dialog modal-dialog-centered"
              id="exampleModal"
              tabindex="-1"
              aria-labelledby="exampleModalLabel"
              aria-hidden="true"
            >
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">
                      留下您的心得...
                    </h1>
                    <button
                      class="btn btn-primary"
                      @click="fakeData()"
                      style="
                        height: 30px;
                        background-color: #0e5305;
                        line-height: 15px;
                      "
                    >
                      一鍵輸入
                    </button>
                  </div>
                  <!-- 用submit.prevent防止刷新整個頁面 -->
                  <form @submit.prevent="addComment">
                    <div class="modal-body">
                      <!-- 新增評論的表單 -->
                      <div class="comment-form">
                        <p>{{ userAccount }}</p>
                        <star-rating
                          @update:rating="setRating"
                          :show-rating="false"
                          style="margin-left: 50px; margin-bottom: 20px"
                        ></star-rating>
                        <textarea
                          v-model="newComment.content"
                          placeholder="留下您的課程心得"
                          required
                        ></textarea>
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button
                        type="button"
                        class="btn btn-secondary reviewButton"
                        data-bs-dismiss="modal"
                      >
                        取消
                      </button>
                      <button
                        type="submit"
                        data-bs-dismiss="modal"
                        class="btn btn-primary reviewButton"
                      >
                        送出
                      </button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-md-4 mt-5">
          <div>
            <a
              href="#"
              class="btn bookingButton"
              @click="getActivityId"
              data-bs-toggle="modal"
              data-bs-target="#staticBackdrop"
            >
              <!-- icon -->
              <span class="icon">
                <img
                  width="65"
                  height="50"
                  src="../../../public/imgs/jump3.png"
                  alt="exercise"
                />
              </span>
              <!-- 按鈕文字 -->
              <span style="font-size: 50px; color: rgb(1, 2, 60)"> 預 約 </span>
            </a>
          </div>

          <!-- Modal -->
          <div
            class="modal fade"
            id="staticBackdrop"
            data-bs-backdrop="static"
            data-bs-keyboard="false"
            tabindex="-1"
            aria-labelledby="staticBackdropLabel"
            aria-hidden="true"
          >
            <div class="modal-dialog modal-lg">
              <div class="modal-content">
                <div class="modal-header">
                  <h1 class="modal-title fs-5" id="staticBackdropLabel">
                    {{ userName }} 您好
                  </h1>
                  <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                  ></button>
                </div>
                <div class="modal-body">
                  您預約的是<span class="importantInfo">{{
                    speaker.speakerName
                  }}</span
                  >講師的諮詢服務
                  <br />
                  時間： <span class="importantInfo"> {{ date }} </span> 的
                  <span class="importantInfo">
                    {{ time }}
                  </span>
                  點
                  <br />
                  地點：<span class="importantInfo">{{
                    speaker.branchName
                  }}</span>
                  <br />
                  <br />

                  <span style="text-decoration: underline"
                    >預約注意事項和同意聲明</span
                  >
                  <br />

                  我們非常歡迎您使用預約講師的服務。請在預約之前仔細閱讀以下注意事項和同意聲明：
                  <br />

                  尊重時間：
                  預約的時間是有限的資源，請確保您在預約的時間點出現。不要濫用此服務，以確保其他使用者也有機會受益。<br />

                  取消預約：
                  如果您無法在預約的時間點出現，請提前來電取消預約，以便其他人可以使用這個時間段。我們建議您提前至少24小時取消預約。<br />

                  黑名單：
                  如果您濫用預約服務，我們可能會將您列入黑名單，限制您未來的預約權限。
                  <br />

                  尊重他人：
                  請在預約過程中尊重講師的時間和專業。不要發表冒犯性、不當或不尊重的言論。<br />

                  我明白並同意遵守上述注意事項。我明白如果我不遵守這些規定，我的預約權限可能會受到限制。
                </div>
                <div class="modal-footer">
                  <button
                    type="button"
                    class="btn btn-secondary"
                    data-bs-dismiss="modal"
                  >
                    取消
                  </button>
                  <button
                    type="button"
                    class="btn btn-primary"
                    @click="addReservationOrderInfo"
                    data-bs-dismiss="modal"
                  >
                    確認
                  </button>
                </div>
              </div>
            </div>
          </div>
          <div class="showTopThree">
            <h2 class="mt-5">人氣講師</h2>
            <div
              class="image-container"
              v-for="(single, index) in TopThreeSpeaker"
              :key="index"
            >
              <a :href="'/speakerInfo/' + single.fk_ReservationSpeakerId">
                <img
                  :src="imgBaseUrl + '/Public/Img/Speaker/' + single.speakerImg"
                  alt=""
                />
              </a>
            </div>
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
import { onMounted, reactive, ref } from "vue";
import axios from "axios";
import { useRoute } from "vue-router";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import StarRating from "vue-star-rating";
library.add(fas);

const route = useRoute();
const speakerId = route.params.id;
console.log(speakerId);
const speaker = ref({});
const imgBaseUrl = ref(import.meta.env.VITE_API_BASEADDRESS);
const rating = ref(5); // 這裡初始化評分為 5
const fk_speakerId = route.params.id;
// const fk_memberId =5;
const fk_memberId = JSON.parse(localStorage.getItem("loggedInUser")).memberId;
const userAccount = localStorage.getItem("userAcc");
const comments = ref([]);
const setRating = (newRating) => {
  rating.value = newRating;
};
const TopThreeSpeaker = ref([]);
const date = ref("");
const time = ref("");
const fullDateTime = ref("");
const userName = JSON.parse(localStorage.getItem("loggedInUser")).username;
const addReservationOrderInfo = ref(null);

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
        if (newDateResult.length > 0) {
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
      }

      table.appendChild(row);
    }

    schedule.appendChild(table);
  }

  let addReservationBody;
  //最終選擇的是selectedCell
  let selectedCell = null;
  function handleCellClick() {
    const clickedCell = this;
    if (selectedCell) {
      selectedCell.classList.remove("selected");
      selectedCell.addEventListener("click", handleCellClick);
    }

    selectedCell = clickedCell;
    date.value = clickedCell.dataset.date;
    time.value = clickedCell.dataset.time;

    clickedCell.classList.add("selected");
    clickedCell.removeEventListener("click", handleCellClick);
    const time2 = parseInt(time.value.substring(0, 2));
    const parts = date.value.split("/");
    const year = parseInt(parts[0]);
    const month = parseInt(parts[1]) - 1;
    const day = parseInt(parts[2]);
    // 取得台北標準時間的時區偏移量（分鐘）
    const dt = new Date(year, month, day, time2);
    const taipeiTimezoneOffset = dt.getTimezoneOffset();

    // 計算時差（以分鐘為單位）
    const timeDifferenceMinutes = -taipeiTimezoneOffset;

    // 在前台時間上添加時差
    const utcTimestamp = new Date(
      dt.getTime() + timeDifferenceMinutes * 60 * 1000
    );

    // 將前台時間轉換為ISO 8601格式的字符串
    const utcTimeString = utcTimestamp.toISOString();

    fullDateTime.value = new Date(utcTimeString);

    // alert(fullDateTime.value);
    addReservationBody = {
      fk_BookerId: fk_memberId,
      ReservationStartTime: fullDateTime.value,
      fk_ReservationSpeakerId: speakerId,
      fk_BranchId: speaker.value.branchId,
    };
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

  addReservationOrderInfo.value = () => {
    loadReservationHistory(speakerId);
    updateCalendar();
    axios
      .post(
        "https://localhost:7183/api/Reservation/AddReservation",
        addReservationBody
      )
      .then((res) => {
        loadReservationHistory(speakerId);
        updateCalendar();
        // 再叫一次
        console.log(res.data);
      })
      .catch((err) => {
        console.log(err);
      });
    // alert('呼叫我啦呼叫我啦~');

    const reqBody = {
      memberId: fk_memberId,
      speakerName: speaker.value.speakerName,
      branchAddress: speaker.value.branchName,
      startTime: fullDateTime.value,
    };
    console.log(speaker);

    //新增預約資訊到order和orderItem資料表
    axios
      .post(
        "https://localhost:7183/api/Payment/addReservationOrderInfo",
        reqBody,
        {
          headers: {
            "Content-Type": "application/json",
          },
        }
      )
      .then((res) => {
        console.log(res.data);
      })
      .catch((err) => {
        console.log(err);
      });
  };

  //得到前三名講師
  function topThreeSpeaker() {
    axios
      .get("https://localhost:7183/api/Reservation/GetTopThreeSpeaker")
      .then((res) => {
        console.log(res.data);
        TopThreeSpeaker.value = res.data;
      })
      .catch((err) => {
        console.log(err);
      });
  }
  topThreeSpeaker();

  //課程心得都要填寫才會出現確認按鈕
  if (newComment.content && rating.value) {
    console.log("心得都有填");
  }
});

//心得script
//從後端得到該講者的全部心得評論紀錄
const getAllComment = (fk_speakerId) => {
  axios
    .get(`https://localhost:7183/api/Reservation/GetAllComment${fk_speakerId}`)
    .then((res) => {
      console.log(res.data);
      comments.value = res.data;
    })
    .catch((err) => {
      console.log(err);
    });
};

getAllComment(fk_speakerId);

const newComment = ref({
  fk_memberId: fk_memberId,
  account: userAccount,
  content: "",
  creationTime: "",
  rating: "",
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
      rating: rating.value,
    };

    try {
      comments.value.push({
        //用內建push方法向末端加一個評論
        id: "",
        account: newComment.value.account,
        content: newComment.value.content,
        rating: rating.value,
        creationTime: Date.now(),
        expanded: false,
      });

      // 發送 POST 請求到後端 API，並將新評論傳遞過去
      const response = axios.post(
        "https://localhost:7183/api/Reservation/AddComment",
        newCommentData
      );

      //使用者新增完評論之後，要把值清空，讓他可以再次新增新的評論
      // newComment.value.account = '';
      newComment.value.content = "";
    } catch (error) {
      console.error("addComment方法的錯誤：", error);
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
};

//一鍵輸入心得
const fakeData = () => {
  newComment.value.content = "老師給的建議非常有用!";
};
</script>

<style>
.importantInfo {
  text-decoration: underline;
  color: #3498db;
  margin-left: 3px;
  margin-right: 3px;
}

.showTopThree {
  margin-top: 150px;
}

.infoBlock p,
.bookingBlock p,
.bookingBlock span {
  font-size: 20px;
}

/* 按鈕 */
.bookingButton {
  position: absolute;
  left: 1260px;
  top: 150px;
  height: 90px;
  display: inline-block;
  padding: 15px 30px;
  font-size: 18px;
  text-align: center;
  border: none;
  background-color: #3498db;
  /* 按鈕背景顏色 */
  color: #fff;
  /* 按鈕文字顏色 */
  text-decoration: none;
  cursor: pointer;
  border-radius: 8px;
  /* 圓角半徑，可調整按鈕的外觀 */
  transition: 0.2s;
  margin-right: 60px;
  display: flex;
  width: 250px;
}

.bookingButton:hover {
  border: 0.1px solid #3498db;
  /* 設定邊界樣式 */
  background-color: #fff;
  color: #3498db;
}

.bookingButton:hover .icon {
  animation: bounce 0.7s infinite;
  /* animation 動畫 */
  /* infinite無限執行 */
  /* bounce 彈跳，在animation:bounce的名字和 @keygrames bounce的名字要一模一樣 */
  /* @keyframes就是動畫的部分 */
}

/* 在1秒內，從0%到50%到100%， 0%的時候Y軸在0，50%的時候Y軸在-30px，100%的時候Y軸又回到0%*/
@keyframes bounce {
  0%,
  100% {
    transform: translateY(0);
  }

  50% {
    transform: translateY(-60px);
  }
}

.icon {
  display: inline-block;
  margin-right: 10px;
  /* 調整圖標和文字之間的間距 */
  font-size: 20px;
  /* 調整圖標大小 */
}

.button span {
  /* vertical-align: middle; */
  /* 垂直居中 */
}

.bookingBlock {
  margin-top: 10%;
}

.infoBlock {
  margin-top: 15%;
}

.speaker-img {
  height: 550px;
  width: 100%;
  position: relative;
  overflow: hidden;
  top: 3%;
}

.speakerImg {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.main {
  font-family: Arial, sans-serif;
  text-align: center;
}

.unable {
  background-color: rgb(243, 83, 83);
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
  color: #ffd700;
}

.reviewButton {
  background-color: rgb(7, 7, 114);
  color: white;
  border: none;
  padding: 5px 10px;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.reviewButton:hover {
  background-color: rgb(82, 82, 255);
}

.comment-card textarea {
  width: 100%;
  padding: 5px;
  border: 1px solid #ddd;
  border-radius: 5px;
}

.comment-form textarea {
  resize: none;
  width: 370px;
  height: 100px;
  border: #ddd solid 1px;
  border-radius: 5px;
}

/* 前三名講師列 */
/* 定義外框樣式 */
.image-container {
  width: 300px;
  height: 200px;
  display: inline-block;
  margin: 25px;
  perspective: 1000px;
}

.image-container img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transform: translateY(0);
  transition: transform 0.3s, box-shadow 0.3s;
  border-radius: 10px;
  /* 将 box-shadow 颜色设置为 rgba(0, 0, 0, 0.2)，透明度可以自行调整 */
  box-shadow: 7px 7px 0 rgba(6, 3, 3, 0.2);
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
  font-size: 15px;
  /* 調整圖標大小 */
  margin-bottom: 20px;
}

/* 日曆表樣式 */

#schedule {
  width: 73%;
  /* 設定日曆表的寬度 */
  max-width: 800px;
  /* 設定最大寬度以防止過度放大 */
  margin: 0 auto;
  /* 水平置中 */
}

.schedule-table {
  border-collapse: collapse;
  margin: 20px auto;
  width: 100%;
  max-width: none;
  /* 移除最大寬度限制 */
}

#schedule .schedule-table {
  border-collapse: collapse;
  margin: 20px auto;
  /* border-radius: 50px; 圓角效果 */
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  /* 陰影效果 */
  background-color: #fff;
  /* 背景顏色 */
}

#schedule .schedule-table th,
#schedule .schedule-table td {
  border: 4px solid #fa8d69;
  padding: 10px;
  cursor: pointer;
  width: 80px;
  /* 設定單元格寬度 */
  height: 30px;
  /* 設定單元格高度 */
}

#schedule .schedule-table td.selected {
  background-color: rgb(130, 184, 246);
  color: white;
}

/* 滑鼠懸停時的效果 */
#schedule .schedule-table td:hover {
  background-color: rgb(255, 238, 6);
  /* 滑鼠懸停時的背景顏色 */
  color: #111;
  /* 文字顏色 */
}

/* 整頁背景色 */
/* .page-container {
  background-color: #03031e;
  color: #fff; 
} */
</style>
