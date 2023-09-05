<template>
  <navBar></navBar>
  <div class="container loginBox" v-if="loginBox">
    <div class="arrow" :class="{ show: arrow }" @click="prePage">
      <button>
        <i class="bi bi-arrow-left"></i>
      </button>
    </div>
    <div class="loginText">
      <h4 @click="testData">Flex Your Journey. Join us!</h4>
    </div>
    <div class="from-group" v-if="errors.length">
      <ul class="mb-3 errorsText">
        <span v-for="error in errors" class="text-danger">{{ error }}</span>
      </ul>
    </div>
    <div class="text-center" v-if="loading">
      <div class="spinner-border" role="status">
        <span class="visually-hidden">Loading...</span>
      </div>
    </div>
    <div class="from-group mb-3">
      <label for="account" class="mb-1" v-if="accInput">帳號</label>
      <input
        type="text"
        name="account"
        v-if="accInput"
        id="account"
        v-model="account"
        class="form-control"
        placeholder="帳號(6-10碼英數字) / Email"
        maxlength="10"
      />
    </div>
    <div class="from-group mb-3 pwdInput" v-if="validated">
      <label for="password" class="mb-1">密碼</label>
      <input
        :type="eye1 ? 'text' : 'password'"
        name="password"
        id="password"
        v-model="password"
        class="form-control"
        placeholder="輸入6-10碼英數字"
        maxlength="10"
      />
      <div class="eye" v-if="validated" @click="openEye1">
        <i class="bi" :class="eye1 ? 'bi-eye' : 'bi-eye-slash'"></i>
      </div>
    </div>
    <div class="from-group mb-3 pwdInput" v-if="unValidated">
      <label for="password" class="mb-1">確認密碼</label>
      <input
        :type="eye2 ? 'text' : 'password'"
        name="password"
        id="password"
        v-model="passwordCheck"
        class="form-control"
        placeholder="請再次輸入密碼"
        maxlength="10"
      />
      <div class="eye" v-if="validated" @click="openEye2">
        <i class="bi" :class="eye2 ? 'bi-eye' : 'bi-eye-slash'"></i>
      </div>
    </div>
    <div class="from-group mb-3" v-if="nameInput">
      <label for="name">姓名</label>
      <input
        type="text"
        id="name"
        v-model="name"
        class="form-control"
        placeholder="ex.吳哈哈"
      />
    </div>
    <div class="from-group mb-3" v-if="unValidated">
      <label for="email">信箱</label>
      <input
        type="email"
        name="email"
        id="email"
        v-model="email"
        class="form-control"
        placeholder="ex.fuen28flex@gmail.com"
      />
    </div>
    <div class="from-group mb-3" v-if="birInput">
      <label for="birthday">生日</label>
      <datepicker id="birthday" v-model="birthday"></datepicker>
    </div>
    <div class="from-group mb-3" v-if="mobInput">
      <label for="mobile">手機</label>
      <input
        type="text"
        id="mobile"
        v-model="mobile"
        class="form-control"
        placeholder="ex.0912345678"
      />
    </div>
    <div class="from-group mb-3" v-if="addressInput">
      <label for="address">收件地址</label>
      <input
        type="text"
        id="address"
        v-model="address"
        class="form-control"
        placeholder="ex.OO市OO區OO路O號O樓"
      />
    </div>
    <div class="from-group mb-3">
      <button
        type="submit"
        class="btn logAndRegBtn"
        v-if="registered"
        v-show="logAndRegBtn"
        @click="ValidatedIdentity"
      >
        登入 / 註冊
      </button>
      <button
        type="submit"
        class="btn logBtn"
        @click="Login"
        v-if="!registered"
      >
        登入
      </button>
      <GoogleReCaptchaV2
        class="from-group mb-3 reCaptchaV2"
        v-if="unRegistered"
      ></GoogleReCaptchaV2>
      <div class="forgetPwd" v-if="forgetPwd" @click="forgetPwdClick">
        <a href="#" class="underline">忘記密碼 ?</a>
      </div>
      <button
        type="submit"
        class="btn btn btn-outline-dark registerBtn"
        @click="registerBtn"
        v-if="unRegistered"
      >
        註冊
      </button>
    </div>
    <div @click="defaultAccountPassword">
      <p>或</p>
    </div>
    <div class="from-group mb-3 registerBtn">
      <googleLogin
        :googleUser="googleLoginUserData"
        @googleLoginUserData="handleGoogleLoginUserData"
      ></googleLogin>
    </div>
    <div class="secret">
      <div>擁有帳號即表示你同意</div>
      <a href="#" class="underline">會員權益聲明</a>
      <a href="#">與</a>
      <a href="#" class="underline">隱私權及網站使用條款</a>
    </div>
  </div>
  <register v-if="registercheck"></register>
  <forgetPwdAndSetPwd
    v-if="forgetPwdSetPwd"
    :email="email"
  ></forgetPwdAndSetPwd>
</template>

<script setup>
import axios from 'axios';
import navBar from '@/components/home/navBar.vue';
import { ref, onMounted } from 'vue';
import forgetPwdAndSetPwd from '@/components/user/forgetPwdAndSetPwd.vue';
import register from '@/components/user/register.vue';
import datepicker from '@/components/user/datepicker.vue';
import Swal from 'sweetalert2/dist/sweetalert2.js';

//google
import googleLogin from '@/components/user/googleLogin.vue';
import GoogleReCaptchaV2 from '@/components/user/GoogleReCaptchaV2.vue';

//pinia
import { useRouter } from 'vue-router';
import { storeToRefs } from 'pinia';
import { useGetApiDataStore } from '@/stores/useGetApiDataStore.js';

axios.defaults.withCredentials = true;

const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const getApiStore = useGetApiDataStore();
const { setMemberUsername } = getApiStore;
const { setLoginSuccess } = getApiStore;
const router = useRouter();

const userAcc = ref(null);
const loggedInUser = ref(null);
const defaultAccountPassword = () => {
  account.value = 'zxc123Z';
  password.value = 'vbn456V';
};
onMounted(() => {
  const storedUser = localStorage.getItem('loggedInUser');

  if (storedUser) {
    loggedInUser.value = JSON.parse(storedUser);

    // 同步到 pinia store
    getApiStore.setMemberUsername(loggedInUser.value.username);
    getApiStore.setMemberUsername(loggedInUser.value.memberId);
    getApiStore.setMemberUsername(loggedInUser.value.userPhoto);
    setLoginSuccess(true);
  }
});

const errors = ref([]);
const accInput = ref(true);
const validated = ref(false);
const loading = ref(false);
const unValidated = ref(false);
const nameInput = ref(false);
const birInput = ref(false);
const mobInput = ref(false);
const addressInput = ref(false);
const logAndRegBtn = ref(true);
const registered = ref(true);
const forgetPwd = ref(false);
const unRegistered = ref(false);

//登入表單
const account = ref('');
const password = ref('');
const passwordCheck = ref('');
const arrow = ref(false);
const accPwdRegex = /^(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]{6,10})$/;

//註冊表單
const name = ref('');
const email = ref('');
const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
const birthday = ref('');
const mobile = ref('');
const mobileRegex = /^\d{10}$|^\d{11}$/;

const address = ref('');
const googleUser = ref(null);

const uri = `${baseAddress}api/Users/Login`;
var loginData = {};

//登入 / 註冊
function ValidatedIdentity() {
  if (account.value === '') {
    errors.value = [];
    loading.value = false;
    errors.value.push('請確實填寫');
  } else if (!accPwdRegex.test(account.value)) {
    errors.value = [];
    errors.value.push('帳號格式錯誤');
    return;
  } else {
    //已填寫
    errors.value = [];
    loginData.Account = account.value;

    axios
      .post(uri, loginData)
      .then((res) => {
        //已註冊
        if (res.data == 'notEnabled') {
          errors.value = [];
          errors.value.push('帳號尚未啟用請至信箱收取驗證信');
        } else {
          validated.value = true;
          accInput.value = false;
          registered.value = false;
          forgetPwd.value = true;
          arrow.value = true;
        }
      })
      .catch((err) => {
        //未註冊
        arrow.value = true;
        validated.value = false;
        logAndRegBtn.value = false;

        errors.value = [];
        errors.value.push('此註冊帳號尚未註冊');
        validated.value = true;
        unValidated.value = true; //信箱
        nameInput.value = true;
        birInput.value = true;
        mobInput.value = true;
        addressInput.value = true;
        unRegistered.value = true;

        //todo驗證帳號是否唯一
      });
  }
}

function prePage() {
  window.location.reload();
}

//登入
function Login() {
  loginData.EncryptedPassword = password.value;
  //未填寫密碼
  if (password.value === '') {
    errors.value = [];
    errors.value.push('請確實填寫');
    return;
  } else if (!accPwdRegex.test(password.value)) {
    errors.value = [];
    errors.value.push('密碼格式錯誤');
    return;
  }

  axios
    .post(uri, loginData)
    .then((res) => {
      localStorage.setItem('userAcc', account.value);
      const jsonData = res.data;
      const userPassword = jsonData.find(
        (claim) => claim.Type === 'UserPassword'
      );

      if (password.value) {
        //密碼正確
        errors.value = [];

        //取得登入者資料
        const userName = jsonData.find((claim) => claim.Type === 'FullName');
        const userId = jsonData.find((claim) => claim.Type === 'MemberId');
        const userPhoto = jsonData.find((claim) => claim.Type === 'MemberImg');

        //一般登入者資料包成物件
        const memberInfo = {
          username: userName.Value,
          memberId: userId.Value,
          memberPhoto: userPhoto.Value,
        };

        if (memberInfo) {
          setMemberUsername(memberInfo);
        }
        handleSuccessfulLogin(memberInfo);
        window.location.reload();
      } else {
        errors.value = [];
        errors.value.push(res.data);
      }
    })
    .catch((err) => {
      errors.value = [];
      errors.value.push('密碼錯誤');
      console.error(err);
    });
}

async function Login2(googleLoginUserData) {
  const userDatas = {
    account: googleLoginUserData.email,
    EncryptedPassword: googleLoginUserData.email,
  };

  try {
    const res = await axios.post(uri, userDatas);

    const jsonData = res.data;
    const userPassword = jsonData.find(
      (claim) => claim.Type === 'UserPassword'
    );

    const userName = jsonData.find((claim) => claim.Type === 'FullName');
    const userId = jsonData.find((claim) => claim.Type === 'MemberId');
    const userPhoto = jsonData.find((claim) => claim.Type === 'MemberImg');

    // 一般登入者資料包成物件
    const memberInfo = {
      username: userName.Value,
      memberId: userId.Value,
      memberPhoto: userPhoto.Value,
    };

    if (memberInfo) {
      setMemberUsername(memberInfo);
    }
    handleSuccessfulLogin(memberInfo);

    return 'loginSuccess'; // 登入成功返回
  } catch (err) {
    console.log('取得google登入這資訊失敗', err);
    return 'userNotFound'; // 登入失敗返回
  }
}

// 將用戶信息轉成字串儲存到本地存儲中
function handleSuccessfulLogin(memberInfo) {
  localStorage.setItem('loggedInUser', JSON.stringify(memberInfo));

  // 同步用戶信息到 pinia store
  loggedInUser.value = memberInfo;
}

//一般註冊
const registercheck = ref(false);

const regUri = `${baseAddress}api/Users/Register`;
function registerBtn() {
  //帳號
  if (
    account.value === '' ||
    password.value === '' ||
    name.value === '' ||
    email.value === '' ||
    birthday.value === '' ||
    mobile.value === '' ||
    address.value === ''
  ) {
    errors.value = [];
    errors.value.push('欄位尚未填寫完畢');
  } else if (!accPwdRegex.test(account.value)) {
    errors.value = [];
    errors.value.push('帳號格式錯誤');
    return;
  } else if (!accPwdRegex.test(password.value)) {
    errors.value = [];
    errors.value.push('密碼格式錯誤');
  } else if (password.value != passwordCheck.value) {
    errors.value = [];
    errors.value.push('密碼或確認密碼錯誤');
  } else if (!emailRegex.test(email.value)) {
    errors.value = [];
    errors.value.push('信箱格式錯誤');
  } else if (!mobileRegex.test(mobile.value)) {
    errors.value = [];
    errors.value.push('手機格式錯誤');
  } else {
    errors.value = [];
    const registerData = {
      Account: account.value,
      EncryptedPassword: password.value,
      Name: name.value,
      Email: email.value,
      Birthday: birthday.value,
      Mobile: mobile.value,
      CommonAddress: address.value,
    };
    axios
      .post(regUri, registerData)
      .then((res) => {
        registerData.value = res.data;

        Swal.fire({
          icon: 'success',
          title: '註冊成功',
          text: `請至 ${registerData.Email} 啟用此帳號`,
          //todo 按下ok才跳頁
        });
        account.value = '';
        password.value = '';
        passwordCheck.value = '';
        name.value = '';
        email.value = '';
        birthday.value = '';
        mobile.value = '';
        address.value = '';
      })
      .catch((err) => {
        console.log('註冊失敗', err);
      });
  }
}

//google 註冊及登入
// 子组件傳來的資料
function handleGoogleLoginUserData(googleLoginUserData) {
  const email = googleLoginUserData.email;

  // 嘗試登入
  Login2(googleLoginUserData)
    .then((loginResult) => {
      if (loginResult === 'loginSuccess') {
        // 登入成功
        window.location.href = '/';
      } else if (loginResult === 'userNotFound') {
        // 使用者不存在，進行註冊
        axios
          .post(regUri, googleLoginUserData)
          .then(() => {
            console.log('使用者註冊成功');

            Login2(googleLoginUserData);
            //alert('為什麼要延遲啦');

            localStorage.setItem(
              'loggedInUser',
              JSON.stringify(googleLoginUserData)
            );

            Swal.fire({
              icon: 'success',
              title: 'Flex歡迎您~~',
            });
            //todo畫面不會跳轉
            window.location.href = '/';
          })
          .catch((err) => {
            console.log('使用者註冊失敗', err);
          });
      }
    })
    .catch((err) => {
      console.log('google登入失敗', err);
    });
}

const loginBox = ref(true);
const forgetPwdSetPwd = ref(false);

function forgetPwdClick() {
  loginBox.value = false;
  if (account.value) {
    const forgetUri = `${baseAddress}api/Users/ForgetPassword`;
    const ForgetPasswordVM = { Account: account.value };
    axios
      .post(forgetUri, ForgetPasswordVM)
      .then((res) => {
        email.value = res.data;
      })
      .catch((err) => {
        console.error('Error:', err);
      });
  }
  forgetPwdSetPwd.value = true;
}
// 眼睛
const eye1 = ref(false);
const eye2 = ref(false);
function openEye1() {
  eye1.value = !eye1.value;
}
function openEye2() {
  eye2.value = !eye2.value;
}

function testData() {
  var testDataUri = `${baseAddress}api/Users/GetTestUserRegData`;
  axios
    .get(testDataUri)
    .then((res) => {
      const testUserRegData = {
        account: res.data.account,
        password: res.data.encryptedPassword,
        name: res.data.name,
        email: res.data.email,
        birthday: res.data.birthday,
        mobile: res.data.mobile,
        address: res.data.commonAddress,
      };
      if (account.value == '') {
        account.value = testUserRegData.account;
      }
      if (password.value == '') {
        password.value = testUserRegData.password;
      }
      if (name.value == '') {
        name.value = testUserRegData.name;
      }
      if (email.value == '') {
        email.value = testUserRegData.email;
      }
      if (birthday.value == '') {
        birthday.value = testUserRegData.birthday;
      }
      if (mobile.value == '') {
        mobile.value = testUserRegData.mobile;
      }
      if (address.value == '') {
        address.value = testUserRegData.address;
      }
    })
    .catch((err) => {
      console.log('測試資料取得失敗', err);
    });
}
</script>
<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Lilita+One&display=swap');
.pwdInput {
  position: relative;
}
.eye {
  position: absolute;
  right: 10px;
  top: 48%;
  font-size: 20px;
}
.loginBox {
  width: 23%;
  justify-content: center;
  align-items: center;
  padding: 20px 45px 45px 45px;
  margin-top: 150px;
  border: solid 1px;
}
/* todo眼睛放在input裡面 */
.password-input {
  display: flex;
  align-items: center;
}

.loginText {
  display: flex;
  justify-content: center;
}
.loginText > h4 {
  font-family: 'Bebas Neue', sans-serif;
  font-weight: bold;
  font-size: 40px;
}
.errorsText {
  display: flex;
  justify-content: center;
  padding: 0px;
  margin: 0px;
}
.logAndRegBtn {
  width: 100%;
  margin: auto;
  background-color: black;
  color: white;
}
.logBtn {
  width: 100%;
  margin: auto;
  background-color: black;
  color: white;
}
.googleBtn {
  width: 100%;
}

.registerBtn {
  width: 100%;
  display: flex;
  justify-content: center;
}

p {
  position: relative;
  text-align: center; /* 將文字置於中間 */
}

p::before,
p::after {
  content: '';
  position: absolute;
  top: 50%;
  width: 150px; /* 調整線段的長度 */
  height: 1px; /* 調整線段的粗細 */
  background-color: black; /* 設定線段的顏色 */
}

p::before {
  left: 0;
}

p::after {
  right: 0;
}
.forgetPwd {
  display: flex;
  justify-content: center;
  margin-top: 10px;
}
.underline {
  text-decoration-line: underline;
  color: rgba(var(--bs-link-color-rgb), var(--bs-link-opacity, 1));
  display: flex;
  justify-content: center;
}
.secret {
  margin: auto;
}
.secret div {
  display: flex;
  justify-content: center;
}
.secret a {
  display: flex;
  justify-content: center;
}
.arrow {
  font-size: 28px;
  padding-bottom: 10px;
  visibility: hidden; /* 初始隱藏，但保留位置 */
}

.arrow.show {
  visibility: visible; /* 當有 show 類名時顯示 */
}

.arrow:hover {
  color: #bb3e20;
}
.reCaptchaV2 {
  display: flex;
  justify-content: center;
}
</style>
