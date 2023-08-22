<template>
  <div>
    <navBar></navBar>
  </div>
  <div>
    <userBar></userBar>
  </div>
  <div class="container userDatas" v-if="showUserData">
    <!-- 變更密碼 -->
    <div class="col-md-6 editPwdIcon" @click="editPwdBtn">
      <button class="">變更密碼<i class="bi bi-pencil-square"></i></button>
    </div>
    <div class="col-md-6 editPwdAll" v-if="editPwdShow">
      <div class="col-md-6">
        <div class="input-group" v-if="editPwdShow">
          <label for="editPwdInput" class="text">修改密碼</label>
          <input
            type="password"
            class="form-control"
            id="editPwdInput"
            placeholder="輸入6-20碼英數字"
            v-model="editPwd"
          />
        </div>
      </div>
      <div class="col-md-6" v-if="editPwdShow">
        <div class="input-group">
          <label for="checkPwdInput" class="text">確認密碼</label>
          <input
            type="password"
            class="form-control"
            id="checkPwdInput"
            placeholder="請重新輸入修改密碼"
            v-model="checkPwd"
          />
        </div>
      </div>
      <div class="btn btn-info" v-if="editPwdShow" @click="updatePwd">
        <button class="">更新密碼</button>
      </div>
    </div>

    <div class="col-md-6 d-flex">
      <div class="input-group mb-2">
        <label for="nameInput" class="text">姓名</label>
        <label for="">{{ userProfile.name }}</label>
      </div>

      <div class="level mb-3">
        <!-- <label for="">{{ level }}</label> -->
        <label for="">{{ userProfile.levelName }}</label>
      </div>
    </div>
    <div class="input-group gender">
      <div class="radioBtn">
        <label for="genderRadio1" class="text">性別</label>
        <input
          class="form-check-input"
          type="radio"
          id="genderRadio1"
          :value="false"
          v-model="gender"
        />
        <label class="form-check-label ms-1" for="genderRadio1"> 生理男 </label>
      </div>

      <div class="radioBtn">
        <input
          class="form-check-input"
          type="radio"
          id="genderRadio2"
          :value="true"
          v-model="gender"
        />
        <label class="form-check-label ms-1" for="genderRadio2">生理女 </label>
      </div>
    </div>

    <div class="col-md-6">
      <div class="input-group">
        <label for="emailInput" class="text">信箱</label>
        <input
          type="text"
          class="form-control"
          id="emailInput"
          placeholder="email"
          v-model="email"
        />
      </div>
    </div>
    <!-- 77手機信箱input右邊的圓角 -->
    <div class="col-md-6">
      <div class="input-group">
        <label for="mobileInput" class="text">手機</label>
        <input
          type="text"
          class="form-control"
          id="mobileInput"
          placeholder="mobile"
          v-model="mobile"
        />
      </div>
    </div>
    <div class="col-md-6 birthday">
      <div class="input-group">
        <label for="birthday" class="text">生日</label>
        <datepicker
          id="birthday"
          class="form-control birthday"
          v-model="birthday"
        ></datepicker>
      </div>
    </div>
    <!-- 地址 -->
    <div class="col-md-6">
      <div class="input-group">
        <label for="addressInput" class="text">地址</label>
        <input
          type="text"
          class="form-control"
          id="addressInput"
          placeholder="common address"
          v-model="commonAddress"
        />

        <div class="col-md-1 addressBtn">
          <button type="button">
            <i
              class="bi bi-plus-square-fill icon-size"
              v-if="!addressBtn"
              @click="addBtn"
            ></i>
          </button>
          <button type="button">
            <i
              class="bi bi-dash-square-fill icon-size"
              v-if="addressBtn"
              @click="minusBtn"
            ></i>
          </button>
        </div>
      </div>
      <!-- 備用地址 -->
      <div class="addressInput">
        <input
          type="text"
          class="form-control addAddressInput"
          placeholder="alternate address"
          v-model="alternateAddress1"
          v-if="addAddressInput1"
        />
      </div>
      <div class="addressInput mb-3">
        <input
          type="text"
          class="form-control addAddressInput"
          placeholder="alternate address"
          v-model="alternateAddress2"
          v-if="addAddressInput2"
        />
      </div>

      <!-- 之後增加 -->
      <!-- <div class="input-group mb-3">
      <input type="text" class="form-control" placeholder="載具先不寫" />
    </div>

    <div class="input-group mb-3">
      <input type="text" class="form-control" placeholder="取貨店鋪預約" />
    </div> -->
      <div class="subscribe">
        <label class="text">訂閱電子報</label>
        <div class="form-check">
          <input
            class="form-check-input"
            type="checkbox"
            id="subscribeBtn"
            v-model="isSubscribeNews"
            v-if="isSubscribeNews"
          />
        </div>
        <div class="form-check-label" for="subscribeBtn">訂閱</div>
      </div>
      <!-- 更新資料按鈕 -->
      <div class="col-md-6 btn btn-outline-info save">
        <button type="button" @click="save">更新資料</button>
      </div>
    </div>
    <!-- 上傳圖片 -->
    <div class="col-md-6 userImg">
      <div>
        <img :src="imageSrc + imgPath" alt="" id="profileImage" />
        <input
          id="photo-input"
          ref="photo"
          type="file"
          class="photo"
          @change="fileChange($event)"
        />
      </div>
      <div>
        <label for="photo-input" class="btn btn-info changePhoto">
          選擇圖片
        </label>
      </div>
    </div>
    <!-- <twzipcode></twzipcode> -->
  </div>

  <!-- 驗證畫面 -->
  <verify class="verify" v-if="verifyArea"></verify>
</template>

<script setup>
import verify from '@/components/user/verify.vue';
import navBar from '@/components/home/navBar.vue';
import userBar from '@/components/user/userBar.vue';
// import twzipcode from './twzipcode.vue';
import datepicker from '@/components/user/datepicker.vue';
import { ref, watch, provide } from 'vue';
import { storeToRefs } from 'pinia';
import { useGetApiDataStore } from '@/stores/useGetApiDataStore.js';
import axios from 'axios';
import Swal from 'sweetalert2/dist/sweetalert2.js';

let photo = ref(null); //保存 <input> 元素的參考
let imageSrc = ref('./../../../public/imgs/'); // 預設圖片路徑

//使用 Vue Composition API 設定區塊
function fileChange(event) {
  const selectedFile = event.target.files[0]; //獲取所選圖片
  var reader = new FileReader();
  reader.onload = (e) => {
    document.querySelector('#profileImage').src = e.target.result;
  };
  reader.readAsDataURL(selectedFile);

  const response = axios
    .post(
      edituri,
      { image: selectedFile },
      {
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      }
    )
    .then((res) => {
      console.log('hello', res);
    })
    .catch((err) => {
      console.log(err);
    });

  console.log(response.data);
  // 更新成功後，也可以更新本地的圖片路徑
  imageSrc.value = URL.createObjectURL(photo.value.files[0]);
}

//檢查本地儲存是否有登錄信息
const storedUser = localStorage.getItem('loggedInUser');
const userObject = JSON.parse(storedUser);

const edituri = `${baseAddress}/Users/EditUserPhoto?id=${userObject.memberId}`;
//選擇圖片時被觸發
const uploadImages = async () => {
  console.log('click搞事');
  //photo.value.click();
  const inputElement = photo.value;
  // inputElement.click(); // 直接觸發 input 元素的點擊事件
};

//--

const getApiStore = useGetApiDataStore();
const { memberInfo } = storeToRefs(getApiStore);

const userProfile = ref([]);
const id = ref('');

// const photo = ref(null);
// const account = ref(""); // 初始化為空字符串
// const id = ref("");
// const fileChange = (e) => {
//   console.log(e.target.files);
// };
// const uploadImages = () => {
//   photo.value.click();
// };
// let level = ref('');
const levelName = ref('');
const name = ref('');
const email = ref('');
const mobile = ref('');
const birthday = ref('');
const gender = ref(false);
const commonAddress = ref('');
const addressBtn = ref(false);
const addAddressInput1 = ref(false);
const addAddressInput2 = ref(false);
const alternateAddress1 = ref(null);
const alternateAddress2 = ref(null);
const editPwd = ref('');
const checkPwd = ref('');
const editPwdShow = ref(false);
const isSubscribeNews = ref(true);
const imgPath = ref('');

const memberId = getApiStore.getMemberId;
const verifyArea = ref(true);
provide('verifyArea', verifyArea);

const showUserData = ref(false);

const baseAddress = 'https://localhost:7183/api';
const uri = `${baseAddress}/Users/` + memberId;

//console.log('uri', uri);

axios
  .get(uri)
  .then((res) => {
    userProfile.value = res.data;
    //console.log('userProfile', userProfile.value);

    id.value = res.data.memberId;
    //console.log(id);

    // level.value = res.data.fk_Level;
    // levelName.value = res.data.levelName;
    // name.value = res.data.name;
    email.value = res.data.email;
    mobile.value = res.data.mobile;
    birthday.value = res.data.birthday;
    gender.value = res.data.gender;
    commonAddress.value = res.data.commonAddress;
    alternateAddress1.value = res.data.alternateAddress1;
    alternateAddress2.value = res.data.alternateAddress2;
    isSubscribeNews.value = res.data.isSubscribeNews;

    console.log(alternateAddress1.value);
    //console.log(alternateAddress2.value);
    //console.log('gender', gender.value);
    console.log(isSubscribeNews.value);
    console.log(imgPath.value);
    //顯示控制項
    if (alternateAddress1.value) {
      addAddressInput1.value = true;
    } else if (alternateAddress2.value) {
      addAddressInput2.value = true;
    }
    if (alternateAddress1.value && alternateAddress2.value) {
      addAddressInput1.value = true;
      addAddressInput2.value = true;
      addressBtn.value = true;
    }
    if (isSubscribeNews.value != true) {
      isSubscribeNews.value = true;
    }
    //console.log(res.data);
    if (res.data.imgPath != null) {
      imgPath.value = res.data.imgPath;
    } else {
      imgPath.value = 'member.jpg';
    }
  })
  .catch((err) => {
    err;
  });

// 這裡執行 watch 邏輯
watch(verifyArea, (newValue) => {
  if (!newValue) {
    showUserData.value = true;
  }
});

// 77地址增減怪怪的
function addBtn() {
  if (commonAddress.value && addAddressInput1.value == false) {
    addAddressInput1.value = true;
    console.log('增加備用地址1');
  }
  if (commonAddress.value && alternateAddress1.value) {
    addAddressInput2.value = true;
    console.log('有三個地址，-按鈕');
    addressBtn.value = true;
  }
  if (commonAddress.value && !alternateAddress1.value) {
    addressBtn.value = true;
  }
}
function minusBtn() {
  if (!alternateAddress2.value) {
    addAddressInput2.value = false;
    console.log('常用跟備用1，+按鈕');
    addressBtn.value = false;
  }
  if (!alternateAddress1.value) {
    addressBtn.value = false;
    console.log('常用地址，-按鈕');
  }
  if (!alternateAddress1.value && !alternateAddress2.value) {
    addAddressInput1.value = false;
    console.log('常用地址，+按鈕');
    addressBtn.value = false;
  }
}

function changePhoto() {
  alert('changePhoto');
}

function editPwdBtn() {
  //alert('editPwd');
  editPwdShow.value = !editPwdShow.value;
  //editPwdShow.value = true;
}

const userData = ref([]);

//更新密碼
function updatePwd() {
  //alert('updatePwd');
  var uri = `${baseAddress}/Users/UpdatePwd?id=${id.value}`;
  var editUserProfile = {};
  if (editPwd.value == checkPwd.value) {
    editUserProfile.EncryptedPassword = checkPwd.value;
  }
  axios
    .put(uri, editUserProfile)
    .then((res) => {
      userData.value = res.data;
      console.log(userData.value);
    })
    .catch((err) => {
      console.log(err);
    });
  window.location.reload();
}
//更新資料
function save() {
  //alert('save');
  //todo檢查欄位有沒有確實填寫

  var uri = `${baseAddress}/Users/Id?id=${id.value}`;
  var editUserProfile = {};

  editUserProfile.gender = gender.value;
  editUserProfile.email = userProfile.value.email;
  editUserProfile.mobile = mobile.value;
  editUserProfile.birthday = birthday.value;
  editUserProfile.commonAddress = commonAddress.value;
  editUserProfile.alternateAddress1 = alternateAddress1.value;
  editUserProfile.alternateAddress2 = alternateAddress2.value;
  editUserProfile.isSubscribeNews = isSubscribeNews.value;

  //todo檔案更新成功畫面

  axios
    .put(uri, editUserProfile)
    .then((res) => {
      userData.value = res.data;
      //console.log('uri', uri);
      console.log(userData.value);
    })
    .catch((err) => {
      console.log(err);
    });
  //todo傳給後端

  Swal.fire({
    icon: 'success',
    title: '個人資料更新成功',
  });
}

if (isSubscribeNews.value == true) {
  isSubscribeNews.value = false;
}
</script>

<style lang="scss" scoped>
.gender {
  display: flex;
  align-items: center;
  /* 77文字跟按鈕沒有水平 */
}

.text {
  padding-right: 13px;
  font-size: 18px;
}

.addressBtn {
  display: flex;
  padding-left: 10px;
  justify-content: center;
  /*77這個按鈕怎麼水平置中*/
}

.level {
  width: 20%;
  background-color: #fce0d9;
  border-radius: 10px;
  border: solid 1px #bb3e20;
  display: flex;
  justify-content: center;
}

.icon-size {
  font-size: 35px;
  color: #bb3e20;
}

.input-group {
  margin-bottom: 5px;
  padding-top: 10px;
  align-items: center;
}

.addressInput {
  margin: 5px 0px;
  align-items: center;
  display: flex;
  width: 100%;

  .addAddressInput {
    border-radius: 0px;
    margin-left: 47px;
  }
}
.birthday {
  padding: 0px;
  border: 0px;
}
.userDatas {
  position: relative;
}

// 77按鈕的儲存字歪歪的
.save {
  width: 100px;
  margin-top: 20px;
}

.changePhoto {
  // position: absolute;
  top: 300px;
  left: 950px;
}

.updatePhoto {
  // position: fixed;
  top: -500px;
  left: -500;
}

.userImg {
  position: absolute;
  top: 80px;
  left: 900px;
  width: 50%;
}

.radioBtn {
  margin-right: 10px;
}

.subscribe {
  margin: 0px;
  display: flex;
  align-items: center;
}

.verify {
  z-index: 1;
}

.editPwdIcon {
  display: flex;
  justify-content: flex-end;
  padding-right: 10px;
  margin: 10px;
}

.editPwdAll {
  border: 1px solid;
  padding: 20px;
  margin-bottom: 20px;
}

.photo {
  position: fixed;
  top: -500px;
  left: -500;
}

.userImg {
  display: flex;
  width: 300px;
}
</style>
