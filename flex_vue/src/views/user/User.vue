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
    <div class="input-group gender">
      <div class="radioBtn">
        <label for="genderRadio1" class="text">性別</label>
        <input
          class="form-check-input"
          type="radio"
          id="genderRadio1"
          value="false"
          v-model="gender"
        />
        <label class="form-check-label ms-1" for="genderRadio1"> 生理男 </label>
      </div>

      <div class="radioBtn">
        <input
          class="form-check-input"
          type="radio"
          id="genderRadio2"
          value="true"
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
    </div>
    <!-- 還有基本欄位還沒做 -->
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

    <div class="btn btn-outline-info save">
      <button type="button" @click="save">儲存</button>
    </div>
  </div>
</template>

<script setup>
import navBar from '@/components/home/navBar.vue';
import userBar from '@/components/user/userBar.vue';
import { ref } from 'vue';
import { storeToRefs } from 'pinia';
import { useGetApiDataStore } from '@/stores/useGetApiDataStore.js';
import axios from 'axios';

const getApiStore = useGetApiDataStore();
const { memberInfo } = storeToRefs(getApiStore);

const userProfile = ref([]);
const account = ref(''); // 初始化為空字符串
const id = ref('');
// let level = ref('');
const levelName = ref('');
const name = ref('');
const email = ref('');
const mobile = ref('');
const gender = ref(false);
const commonAddress = ref('');
const addAddressInput1 = ref('');
const addAddressInput2 = ref('');
const addressBtn = ref(false);
const alternateAddress1 = ref(null);
const alternateAddress2 = ref(null);
const isSubscribeNews = ref(true);

const memberId = getApiStore.getMemberId;
//console.log('memberId:', memberId);

const baseAddress = 'https://localhost:7183/api';
const uri = `${baseAddress}/Users/` + memberId;

//console.log('uri', uri);

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
    alternateAddress1.value = res.data.alternateAddress1;
    alternateAddress2.value = res.data.alternateAddress2;
    isSubscribeNews.value = res.data.isSubscribeNews;
    //console.log(alternateAddress1.value);
    console.log(alternateAddress2.value);
    console.log('gender', gender.value);
    //console.log(isSubscribeNews.value);

    //顯示控制項
    if (alternateAddress1.value) {
      addAddressInput1.value = true;
    }
    if (alternateAddress1.value && alternateAddress2.value) {
      addAddressInput1.value = true;
      addAddressInput2.value = true;
    }
    if (isSubscribeNews.value != true) {
      isSubscribeNews.value = true;
    }
  })
  .catch((err) => {
    err;
  });

function addBtn() {
  if (addAddressInput1.value === false) {
    addAddressInput1.value = true;
    console.log('addAddressInput1');
  } else {
    addAddressInput2.value = true; //多一個輸入框
    console.log('addAddressInput2');
    addressBtn.value = true;
  }
}
function minusBtn() {
  if (addAddressInput1.value === true) {
    addAddressInput2.value = false;
    console.log('addAddressInput11111');
    addressBtn.value = false;
  } else {
    addAddressInput1.value = false;
    console.log('addAddressInput222222');
  }
}
const userData = ref([]);

function save() {
  //alert('save');
  //todo檢查欄位有沒有確實填寫
  //todo檔案更新成功
  var uri = `${baseAddress}/Users/Id?id=${id.value}`;
  var editUserProfile = {};

  editUserProfile.gender = gender.value;
  editUserProfile.email = email.value;
  editUserProfile.mobile = mobile.value;
  editUserProfile.commonAddress = commonAddress.value;
  editUserProfile.alternateAddress1 = alternateAddress1.value;
  editUserProfile.alternateAddress2 = alternateAddress2.value;
  editUserProfile.isSubscribeNews = isSubscribeNews.value;
  console.log(
    'editUserProfile.alternateAddress2',
    editUserProfile.alternateAddress2
  );
  console.log(
    'editUserProfile.isSubscribeNews',
    editUserProfile.isSubscribeNews
  );

  // 77資料沒辦法修改成功差一點點啊!
  axios
    .put(uri, editUserProfile)
    .then((res) => {
      userData.value = res.data;
      console.log('uri', uri);
      console.log(userData.value);
    })
    .catch((err) => {
      console.log(err);
    });
  //todo傳給後端
}

//還沒正確隱藏值
if (isSubscribeNews.value === true) {
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
.save {
  display: flex;
  justify-content: center;
  width: 8%;
  height: 6%;
  margin: 20px 0px;
}
.radioBtn {
  margin-right: 10px;
}
.subscribe {
  margin: 0px;
  display: flex;
  align-items: center;
}
</style>
