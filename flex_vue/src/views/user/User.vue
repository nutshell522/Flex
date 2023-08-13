<template>
  <navBar></navBar>
  <div>
    <userBar></userBar>
  </div>
  <div class="container">
    <div class="col-md-6 d-flex">
      <div class="input-group mb-2">
        <label for="nameInput" class="text">姓名</label>
        <label for="">{{ name }}</label>
      </div>
      <div class="level mb-3">
        <!-- <label for="">{{ level }}</label> -->
        <label for="">{{ levelName }}</label>
      </div>
    </div>
    <!-- 77gender資料繫結沒有成功 -->
    <div class="gender">
      <div class="radioBtn">
        <label for="genderInput" class="text">性別</label>
        <input
          class="form-check-input"
          type="radio"
          id="genderRadio1"
          value="true"
          v-model="gender"
        />
        <label class="form-check-label ms-1" for="genderRadio1"> 生理男 </label>
      </div>
      <div>
        <input
          class="form-check-input"
          type="radio"
          id="genderRadio2"
          value="flase"
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
    <!-- 77手機信箱左邊的框框圓角 -->
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

    <div class="col-md-6">
      <div class="addressInput">
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
      <!-- 77地址文字底下的備用地址要縮排 -->
      <div class="addressInput">
        <input
          type="text"
          class="form-control addAddressInput1"
          placeholder="alternate address"
          v-model="alternateAddress"
          v-if="addAddressInput1"
        />
      </div>
      <div class="mb-3">
        <input
          type="text"
          class="form-control addAddressInput2"
          placeholder="alternate address"
          v-if="addAddressInput2"
        />
      </div>
    </div>
    <!-- 還有基本欄位還沒做 -->
    <!-- 之後增加 -->
    <!-- <div class="input-group mb-3">
      <input type="text" class="form-control" placeholder="載具先不寫" />
    </div>

    <div class="input-group mb-3">
      <input type="text" class="form-control" placeholder="取貨店鋪預約" />
    </div> -->

    <label class="text">訂閱電子報</label>
    <div class="form-check form-check-inline">
      <input
        class="form-check-input"
        type="checkbox"
        id="subscribeBtn"
        v-model="subscribeNews"
        v-if="subscribeNews"
      />
      <label class="form-check-label" for="subscribeBtn">訂閱</label>
    </div>
    <div class="btn btn-outline-info save">
      <button type="button" @click="save">儲存</button>
    </div>
  </div>
</template>

<script setup>
import navBar from '@/components/home/navBar.vue';
import userBar from '@/components/user/userBar.vue';

import axios from 'axios';
import { ref } from 'vue';

const userProfile = ref([]);
const account = ref('a123'); // 初始化為空字符串
let id = ref('');
// let level = ref('');
let levelName = ref('');
let name = ref('');
let email = ref('');
let mobile = ref('');
let gender = ref('');
let commonAddress = ref('');
let alternateAddress = ref('');
let subscribeNews = ref('');

const baseAddress = 'https://localhost:7183/api';
const uri = `${baseAddress}/Users/${account.value}`;

axios
  .get(uri)
  .then((res) => {
    userProfile.value = res.data;
    console.log(userProfile);

    id.value = res.data.memberId;
    //console.log(id);

    // level.value = res.data.fk_Level;
    levelName.value = res.data.levelName;
    name.value = res.data.name;
    email.value = res.data.email;
    mobile.value = res.data.mobile;
    gender.value = res.data.gender;
    commonAddress.value = res.data.commonAddress;
    alternateAddress.value = res.data.alternateAddress1;
    subscribeNews.value = res.data.isSubscribeNews;
  })
  .catch((err) => {
    err;
  });

const addAddressInput1 = ref(false);
const addAddressInput2 = ref(false);
const addressBtn = ref(false);

//當值為?哪個選項被選到

function addBtn() {
  //關閉的時候
  if (addAddressInput1.value === false) {
    addAddressInput1.value = true;
    console.log('addAddressInput1');
  } else {
    addAddressInput2.value = true;
    console.log('addAddressInput2');
    addressBtn.value = true;
  }
}
function minusBtn() {
  if (addAddressInput1.value === true) {
    addAddressInput2.value = false;
    console.log('addAddressInput1');
    addressBtn.value = false;
  } else {
    addAddressInput1.value = false;
    console.log('addAddressInput2');
  }
}
function save() {
  //todo檢查欄位有沒有確實填寫
  //todo檔案更新成功
  //todo傳給後端
}

//還沒正確隱藏值
if (subscribeNews.value === true) {
  subscribeNews.value = false;
}
</script>

<style>
.gender {
  display: flex;
  align-items: center;
  /* 77文字跟按鈕沒有水平 */
}
.text {
  padding-right: 10px;
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
  /* 77地址名稱水平排列 */
}
.save {
  display: flex;
  width: 6%;
  height: 6%;
  justify-content: center;
  margin: 20px 0px;
}
.radioBtn {
  margin-right: 10px;
}
</style>
