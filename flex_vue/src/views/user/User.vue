<template>
  <div>
    <navBar v-if="showComponent" :key="componentKey"></navBar>
  </div>
  <div>
    <userBar :btnActive="1"></userBar>
  </div>
  <div class="container userDatas">
    <div class="col-md-6 editPwdIcon" @click="editPwdBtn">
      <button class="">變更密碼<i class="bi bi-pencil-square"></i></button>
    </div>
    <div class="col-md-6 editPwdIcon">
      <verify class="verify" v-if="verifyArea"></verify>
    </div>
    <div class="col-md-6 editPwdAll" v-if="editPwdShow">
      <div class="from-group errorsText" v-if="errors.length">
        <ul class="mb-3">
          <span v-for="error in errors" class="text-danger">{{ error }}</span>
        </ul>
      </div>
      <div class="col-md-9 mt-4">
        <div class="input-group" v-if="editPwdShow">
          <label for="editPwdInput" class="text">修改密碼</label>
          <input
            :type="eye1 ? 'text' : 'password'"
            class="form-control"
            id="editPwdInput"
            placeholder="輸入6-10碼英數字"
            v-model="editPwd"
            maxlength="10"
          />
        </div>
        <div class="eye1" @click="openEye1">
          <i class="bi" :class="eye1 ? 'bi-eye' : 'bi-eye-slash'"></i>
        </div>
        <div class="input-group mb-4">
          <label for="checkPwdInput" class="text">確認密碼</label>
          <input
            :type="eye2 ? 'text' : 'password'"
            class="form-control"
            id="checkPwdInput"
            placeholder="請重新輸入修改密碼"
            v-model="checkPwd"
            maxlength="10"
          />
        </div>
        <div class="eye2" @click="openEye2">
          <i class="bi" :class="eye2 ? 'bi-eye' : 'bi-eye-slash'"></i>
        </div>
      </div>
      <div class="btn" v-if="editPwdShow" @click="updatePwd">
        <button class="UpdatePwd">更新密碼</button>
      </div>
    </div>

    <div class="col-md-6 d-flex">
      <div class="input-group mb-2">
        <label for="nameInput" class="text">姓名</label>
        <label for="">{{ userProfile.name }}</label>
      </div>

      <div class="level mb-3">
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
    <!-- todo手機信箱input右邊的圓角 -->
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
    <!-- todoUpdate -->
    <!-- <twzipcode></twzipcode> -->
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
      <!-- todoAdd -->
      <!-- <div class="input-group mb-3">
      <input type="text" class="form-control" placeholder="載具" />
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
      <div class="col-md-6 btn btn-outline-info saveBtn">
        <button type="button" @click="saveBtn">更新資料</button>
      </div>
    </div>
    <div class="userImg">
      <div>
        <img :src="imageSrc + 'Public/UserImgs/' + imgPath" id="profileImage" />
        <input
          id="photo-input"
          ref="photo"
          type="file"
          class="photo"
          @change="fileChange($event)"
        />
      </div>
      <div class="aa">
        <label for="photo-input" class="btn changePhoto"> 選擇圖片 </label>
      </div>
    </div>
  </div>
</template>

<script setup>
import verify from "@/components/user/verify.vue";
import navBar from "@/components/home/navBar.vue";
import userBar from "@/components/user/userBar.vue";
// import twzipcode from './twzipcode.vue';
import datepicker from "@/components/user/datepicker.vue";
import { ref, watch, provide } from "vue";
import axios from "axios";
import Swal from "sweetalert2/dist/sweetalert2.js";

const errors = ref([]);
const eye1 = ref(false);
const eye2 = ref(false);

const photo = ref(null);
const imageSrc = import.meta.env.VITE_API_BASEADDRESS; // 預設圖片路徑

//檢查是否有登入
const storedUser = localStorage.getItem("loggedInUser");
const userObject = JSON.parse(storedUser);

function openEye1() {
  eye1.value = !eye1.value;
}

function openEye2() {
  eye2.value = !eye2.value;
}
const showComponent = ref(true);
const componentKey = ref(1);
function reloadComponent() {
  showComponent.value = false; // 首先隐藏组件
  componentKey.value += 1; // 更改 key 值，触发重新加载
  // 在下一个 tick 中再顯示组件，以便觸發重新渲染
  setTimeout(() => {
    showComponent.value = true;
  }, 0);
}
function fileChange(event) {
  const selectedFile = event.target.files[0]; //獲取所選圖片
  var reader = new FileReader();
  reader.onload = (e) => {
    document.querySelector("#profileImage").src = e.target.result;
  };
  reader.readAsDataURL(selectedFile);

  axios
    .post(
      edituri,
      { image: selectedFile },
      {
        headers: {
          "Content-Type": "multipart/form-data",
        },
      }
    )
    .then((res) => {
      console.log(res.data);
      localStorage.setItem("updateUserPhoto", res.data); // imgPath 是新照片的路径
      reloadComponent();
    })
    .catch((err) => {
      console.log(err);
    });
}
const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const edituri = `${baseAddress}api/Users/EditUserPhoto?id=${userObject.memberId}`;

const userProfile = ref([]);
const editPwd = ref("");
const checkPwd = ref("");
const editPwdShow = ref(false);
const pwdRegex = /^(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]{6,10})$/;

const id = ref("");
const email = ref("");
const mobile = ref("");
const birthday = ref("");
const gender = ref(false);
const commonAddress = ref("");
const alternateAddress1 = ref(null);
const alternateAddress2 = ref(null);
const isSubscribeNews = ref(true);

const addressBtn = ref(false);
const addAddressInput1 = ref(false);
const addAddressInput2 = ref(false);

const imgPath = ref("");
const verifyArea = ref(false);

provide("verifyArea", verifyArea);
const showUserData = ref(false);

//取得會員資料
const uri = `${baseAddress}api/Users/` + userObject.memberId;
axios
  .get(uri)
  .then((res) => {
    userProfile.value = res.data;
    id.value = res.data.memberId;
    email.value = res.data.email;
    mobile.value = res.data.mobile;
    birthday.value = res.data.birthday;
    gender.value = res.data.gender;
    commonAddress.value = res.data.commonAddress;
    alternateAddress1.value = res.data.alternateAddress1;
    alternateAddress2.value = res.data.alternateAddress2;
    isSubscribeNews.value = res.data.isSubscribeNews;

    //地址控制項
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

    //照片
    if (res.data.imgPath != null) {
      imgPath.value = res.data.imgPath;
    } else {
      imgPath.value = "member.jpg";
    }
  })
  .catch((err) => {
    console.log(err);
  });

if (isSubscribeNews.value == true) {
  isSubscribeNews.value = false;
}

// todoFix地址增減怪怪的
function addBtn() {
  if (commonAddress.value && addAddressInput1.value == false) {
    addAddressInput1.value = true;
    console.log("增加備用地址1");
  }
  if (commonAddress.value && alternateAddress1.value) {
    addAddressInput2.value = true;
    console.log("有三個地址，-按鈕");
    addressBtn.value = true;
  }
  if (commonAddress.value && !alternateAddress1.value) {
    addressBtn.value = true;
  }
}

function minusBtn() {
  if (!alternateAddress2.value) {
    addAddressInput2.value = false;
    console.log("常用跟備用1，+按鈕");
    addressBtn.value = false;
  }
  if (!alternateAddress1.value) {
    addressBtn.value = false;
    console.log("常用地址，-按鈕");
  }
  if (!alternateAddress1.value && !alternateAddress2.value) {
    addAddressInput1.value = false;
    console.log("常用地址，+按鈕");
    addressBtn.value = false;
  }
}

function editPwdBtn() {
  verifyArea.value = true;
  if (!verifyArea.value) {
    editPwdShow.value = true;
  } else {
    editPwdShow.value = false;
  }
}

// 監聽 verifyArea 變動
watch(verifyArea, (newValue) => {
  if (!newValue) {
    editPwdShow.value = true;
  } else {
    editPwdShow.value = false;
  }
});

function updatePwd() {
  var uri = `${baseAddress}api/Users/UpdatePwd?id=${id.value}`;
  var editUserProfile = {};

  if (editPwd.value == "" || checkPwd.value == "") {
    errors.value = [];
    errors.value.push("請確實填寫");
  } else if (!pwdRegex.test(editPwd.value) || !pwdRegex.test(checkPwd.value)) {
    errors.value = [];
    errors.value.push("修改密碼或確認密碼格式錯誤");
  } else if (editPwd.value == checkPwd.value) {
    errors.value = [];
    editUserProfile.EncryptedPassword = checkPwd.value;
    axios
      .put(uri, editUserProfile)
      .then((res) => {
        console.log(res);
      })
      .catch((err) => {
        console.log(err);
      });
    Swal.fire({
      icon: "success",
      title: "密碼更新成功",
    });
  } else {
    errors.value = [];
    errors.value.push("修改密碼或確認密碼填寫錯誤");
  }
}

function saveBtn() {
  //todo必填欄位
  var uri = `${baseAddress}api/Users/Id?id=${id.value}`;
  var editUserProfile = {
    gender: gender.value,
    email: userProfile.value.email,
    mobile: mobile.value,
    birthday: birthday.value, //todo為什麼值會選到前一天
    commonAddress: commonAddress.value,
    alternateAddress1: alternateAddress1.value,
    alternateAddress2: alternateAddress2.value,
    isSubscribeNews: isSubscribeNews.value,
  };

  axios
    .put(uri, editUserProfile)
    .then((res) => {
      console.log(res);
    })
    .catch((err) => {
      console.log(err);
    });

  Swal.fire({
    icon: "success",
    title: "個人資料更新成功",
  });
  window.location.reload();
}
</script>

<style lang="scss" scoped>
.aa {
  display: flex;
  justify-content: center;
}

.gender {
  display: flex;
  align-items: center;
  /* todo文字跟按鈕沒有水平 */
}

.text {
  padding-right: 13px;
  font-size: 18px;
}

.addressBtn {
  display: flex;
  padding-left: 10px;
  justify-content: center;
  /*todo這個按鈕怎麼水平置中*/
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
  position: relative;
}

.eye1 {
  position: absolute;
  right: 63%;
  top: 12.5%;
  font-size: 20px;
}

.eye2 {
  position: absolute;
  right: 63%;
  top: 20%;
  font-size: 20px;
}

.UpdatePwd {
  position: absolute;
  background-color: #bb3e20;
  width: 8%;
  right: 51%;
  top: 18.3%;
  height: 40px;
  color: #fce0d9;
  border-radius: 10px;
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
.saveBtn {
  width: 100px;
  margin-top: 30px;
}

.changePhoto {
  background-color: black;
  color: white;
  margin-top: 10px;
}

.userImg {
  position: absolute;
  top: 50px;
  right: 15px;
  width: 465px;
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
  margin-bottom: 20px;
  padding-left: 25px;
}

.photo {
  position: fixed;
  top: -500px;
}
.errorsText {
  height: 10px;
}
</style>
