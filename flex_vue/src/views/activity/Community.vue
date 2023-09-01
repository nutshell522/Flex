<template>
  <NavBar></NavBar>
  <div class="topPImg"></div>
  <div class="container mt-5">
    <div class="row">
      <div class="col-md-3">
        <!-- 側邊分類欄 -->

        <h2>話題分類</h2>
        <ul>
          <li><a href="#" @click.prevent="loadCategory('路跑')">路跑</a></li>
          <li>
            <a href="#" @click.prevent="loadCategory('自行車')">自行車</a>
          </li>
          <li><a href="#" @click.prevent="loadCategory('健行')">健行</a></li>
          <li><a href="#" @click.prevent="loadCategory('登山')">登山</a></li>
          <li><a href="#" @click.prevent="loadCategory('瑜珈')">瑜珈</a></li>
          <li><a href="#" @click.prevent="loadCategory('其他')">其他</a></li>
        </ul>
      </div>

      <!-- 右邊主要内容 -->
      <div class="col-md-9">
        <div class="row">
          <div class="col-md-10">
            <a href="#" @click.prevent="getAllPost"><h2>文章列表</h2></a>
          </div>
          <div class="col-md-2 mt-2">
            <button
              type="button"
              class="btn btn-primary"
              data-bs-toggle="modal"
              data-bs-target="#staticBackdrop"
            >
              新增文章
            </button>
          </div>
        </div>
        <div class="forum-posts">
          <!-- 使用 v-for 渲染貼文列表 -->
          <div v-for="post in forumPosts" :key="post.id" class="post">
            <h3 @click="toggleExpand(post)">{{ post.title }}</h3>
            <p>分類：{{ post.category }}</p>
            <!-- <div v-html="post.content"></div> -->
            <div v-if="post.isExpanded" v-html="post.content"></div>
            <p class="timeInfo">
              {{ post.author }}發佈於{{ formatDate(post.publishTime) }}
            </p>
          </div>
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
          <div class="modal-dialog modal-xl">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">新增文章</h5>
                <button
                  class="btn btn-primary"
                  @click="fakeData()"
                  style="
                    margin-left: 5%;
                    height: 30px;
                    text-align: center;
                    justify-content: center;
                    line-height: 15px;
                    background-color: #03522d;
                  "
                >
                  一鍵輸入
                </button>
                <button
                  @click="clearEditor"
                  class="btn-close"
                  data-bs-dismiss="modal"
                  aria-label="Close"
                ></button>
              </div>
              <div class="modal-body">
                <div>
                  <input
                    v-model="postTitle"
                    placeholder="請輸入標題"
                    class="inputTitle"
                  />

                  <div class="category-select mb-3">
                    <div class="d-flex align-items-baseline">
                      <!-- 使用 align-items-baseline  -->
                      <p class="mb-0">請選擇分類：</p>
                      <!-- 使用 mb-0 消除底部的間距 -->
                      <div>
                        <label
                          v-for="(category, index) in categories"
                          :key="index"
                          style="margin-right: 15px"
                        >
                          <input
                            type="radio"
                            v-model="selectedCategory"
                            :value="category"
                            required
                          />
                          {{ category }}
                        </label>
                      </div>
                    </div>
                  </div>

                  <QuillEditor
                    theme="snow"
                    :modules="modules"
                    :toolbar="toolbarOptions"
                    class="quill-editor"
                    contentType="html"
                    v-model:content="editorContent"
                    ref="quill"
                    @ready="quill"
                    style="height: 500px"
                  />
                </div>
              </div>
              <div class="modal-footer">
                <button
                  @click="clearEditor"
                  class="btn btn-secondary"
                  data-bs-dismiss="modal"
                >
                  取消
                </button>
                <button
                  class="btn btn-primary"
                  @click="showArticle"
                  data-bs-dismiss="modal"
                >
                  發佈
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <HomeFooter></HomeFooter>
</template>
  
<script setup>
import { ref, nextTick, onMounted } from "vue";
import axios from "axios";
import NavBar from "@/components/activity/ActivityNav.vue";
import HomeFooter from "@/components/home/footer.vue";
import { useRoute, useRouter } from "vue-router";
const route = useRoute();
const categoryFromUrl = route.params.category;
console.log(categoryFromUrl);
const postTitle = ref("");
const quill = ref(null);
const categories = ["路跑", "健行", "登山", "自行車", "瑜珈", "其他"];
const selectedCategory = ref("");

const forumPosts = ref([]);

const memberData = localStorage.getItem("loggedInUser");
const member = JSON.parse(memberData);
const memberAccount = member ? member.username : "訪客";
console.log(memberAccount);

const clearEditor = () => {
  editorContent.value = "";
  postTitle.value = "";
  quill.value.setHTML("");
};

const toggleExpand = (post) => {
  post.isExpanded = !post.isExpanded;
};

//新增一偏新貼文
const showArticle = () => {
  const localTime = new Date();

  // 獲得台灣時間的偏移量（用分鐘為單位，負數表示東區時區，正數表示西區時區）
  const taipeiTimezoneOffset = localTime.getTimezoneOffset();

  // 以分鐘為單位算時差，透過負負得正取得正確偏移量
  const timeDifferenceMinutes = -taipeiTimezoneOffset;

  // 在前台時間加上時差，將時間從台北時區轉為 UTC 時間，讓後台接正確時間
  const utcTimestamp = new Date(
    localTime.getTime() + timeDifferenceMinutes * 60 * 1000
  );

  // 将 UTC 時間轉為 ISO 8601 格式的字串
  const newPost = {
    // id: "",
    title: postTitle.value,
    content: editorContent.value,
    category: selectedCategory.value,
    publishTime: utcTimestamp.toISOString(),
    author: memberAccount,
  };
  // console.log(newPost);
  axios
    .post("https://localhost:7183/api/Community/AddPost", newPost, {
      headers: {
        "Content-Type": "application/json",
      },
    })
    .then((res) => {
      console.log(res.data);
      newPost.id = res.data;
    })
    .catch((err) => {
      console.log(err);
    });
  forumPosts.value.unshift(newPost);
  console.log(newPost);
  nextTick(() => {
    clearEditor();
  });
};
const getAllPost = () => {
  //得到全部的文章
  axios
    .get("https://localhost:7183/api/Community/GetAllPost")
    .then((res) => {
      forumPosts.value = res.data.map((post) => ({
        ...post,
        isExpanded: false,
      }));
    })
    .catch((err) => {
      console.log(err);
    });
};

//按下分類按鈕
const loadCategory = (searchCategory) => {
  const categoryItem = {
    Category: searchCategory,
  };
  console.log(categoryItem);
  axios
    .post("https://localhost:7183/api/Community/CategorySearch", categoryItem)
    .then((res) => {
      // console.log(res.data);
      forumPosts.value = res.data.map((post) => ({
        ...post,
        isExpanded: false,
      }));
    })
    .catch((err) => {
      console.log(err);
    });
};

onMounted(() => {
  // getAllPost();
  loadCategory(categoryFromUrl);
});

//一鍵輸入
const fakeData = () => {
  postTitle.value = "挑戰自我，感受自由-Flex路跑參後感";
  selectedCategory.value = "路跑";
  editorContent.value = `在繁忙的城市生活中，偶爾需要逃離塵囂，讓心靈回歸自然。這次參加了Flex舉辦的路跑活動，經歷了一場極具挑戰性和滿足感的體驗。<span>活動一開始，我加入了一群充滿活力的跑者，大家在清晨的陽光下一同出發。我們的目標是突破自己，感受自由。Flex路跑的路線選擇非常獨特，穿越了郊區的青山綠水，讓參賽者能夠盡情沐浴大自然的美麗。</span><img src="../../../public/imgs/fakeRunning.jpg" alt="路跑照片" />
<p>一開始，我感到身體的疲憊，但當我看到前方壯麗的風景時，內心的堅持使我繼續前進。隨著每一步的踏出，我開始感受到自己的力量和耐力，這是城市中無法體驗到的。彷彿一步一步走向自由，我忘卻了一切壓力和煩憂。</p>
<p>而活動的終點，是一個美不勝收的湖泊。我們跑者們一起坐在湖邊，欣賞著日落的美景，享受著勝利的喜悅。這一刻，我們成為了朋友，分享了彼此的挑戰和成就。</p>
<p>Flex路跑不僅讓我們挑戰了身體，更讓我們挑戰了內心。它教會了我們堅持不懈的精神，以及欣賞大自然的美麗。這次的路跑心得，讓我深刻體會到，只要有決心，無論多困難，我們都能夠克服。感謝Flex，讓我們重新找回了自由的感覺。</p>
<p>如果你也渴望挑戰自己，感受自由，我強烈推薦參加Flex舉辦的路跑活動。它不僅是一場運動，更是一場心靈的洗禮，讓你重新與自然連結，挑戰極限，感受自由的奇妙。</p>`;
};

//格式化日期
const formatDate = (dateString) => {
  const date = new Date(dateString);
  return date.toLocaleDateString(); // 格式化為本地化的日期字串
};

//quill-vue
import { QuillEditor } from "@vueup/vue-quill";
import "@vueup/vue-quill/dist/vue-quill.snow.css";
import ImageUploader from "quill-image-uploader";

const toolbarOptions = [
  [{ header: [1, 2, 3, 4, 5, false] }], // custom button values
  ["bold", "italic", "underline", "strike"], // toggled buttons
  ["blockquote", "code-block"],
  [{ list: "ordered" }, { list: "bullet" }],
  [{ color: [] }, { background: [] }], // dropdown with defaults from theme
  ["image"],
  ["link"],
  ["clean"], // remove formatting button
];

const props = defineProps({
  clearEditor: {
    type: Function,
  },
});

const editorContent = ref("");
const modules = {
  name: "imageUploader",
  module: ImageUploader,
  toolbar: toolbarOptions,
  // upload属性的值是一個函數
  options: {
    upload: (file) => {
      //resolve 和 reject 是Promise對象的兩個回調函数，他們用於處理Promise的狀態。
      return new Promise((resolve, reject) => {
        const formData = new FormData();
        formData.append("file", file);
        axios
          .post("https://localhost:7183/api/Community", formData, {
            headers: {
              "Content-Type": "multipart/form-data",
            },
            withCredentials: true,
          })
          .then((res) => {
            //console.log(res);
            let imgurLink = res.data;
            console.log(imgurLink);
            resolve(imgurLink); //将圖片链接通过 resolve 返回，表示上傳成功
            //resolve(value): 此函数用于将Promise狀態设置為已解决，其中 value 是解决的结果，通常是一个成功的结果值
          })
          .catch((err) => {
            reject("Upload failed");
            console.error("Error:", err);
          });
      });
    },
  },
};
</script>
  
<style scoped>
ul a {
  font-size: 20px;
}
.topPImg {
  background: url("../../../../public/imgs/Top.jpg") no-repeat center center;
  background-size: cover;
  background-color: #6c757d;
  padding: 8rem 0;
  position: relative;
  height: 500px;
}

.timeInfo {
  text-align: right;
}

.forum-posts {
  padding: 20px;
  background-color: #f9f9f9;
  border: 1px solid #ddd;
}

.post {
  margin-bottom: 20px;
  padding: 20px;
  /* 添加内边距以增加间距 */
  background-color: #fff;
  border: 1px solid #ddd;
}

.post h3 {
  font-size: 20px;
  margin-bottom: 10px;
  /* 帖子标题之间的底部间距 */
}

.post p {
  font-size: 16px;
  color: #333;
}

ul li {
  margin-bottom: 10px;
}

a {
  text-decoration: none;
  color: #007bff;
  font-weight: bold;
}

a:hover {
  text-decoration: underline;
}

.inputTitle {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border: 1px solid #ccc;
  border-radius: 10px;
}
</style>