<template>
  <div class="container verify" v-if="verifyArea">
    <div class="pwdInput">
      <div class="mb-1">
        <label for="verify">會員驗證</label>
      </div>
      <div class="from-group">
        <ul class="mb-3 errorsText">
          <span v-for="error in errors" class="text-danger">{{ error }}</span>
        </ul>
      </div>
      <div class="eyeAndInput">
        <input
          :type="eye ? 'text' : 'password'"
          class="form-control input"
          id="verify"
          placeholder="請輸入登入密碼"
          v-model="password"
        />
        <div class="eye" @click="openEye">
          <i class="bi" :class="eye ? 'bi-eye' : 'bi-eye-slash'"></i>
        </div>
      </div>
      <button type="button" class="btn sendBtn" @click="sendBtn">送出</button>
    </div>
    <div class="verifyText">
      <div>
        <label for="">個人安全資料認證</label>
      </div>
      <div class="mt-3">
        <label for="">為了保障您的資料安全， 必須再次填入密碼驗證。</label>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, inject } from 'vue';
import axios from 'axios';

const errors = ref([]);
const password = ref(null);
const eye = ref(false);
const verifyArea = inject('verifyArea');
const close = () => {
  verifyArea.value = false;
};

const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const verifyUri = `${baseAddress}api/Users/Verify`;

function sendBtn() {
  if (!password.value) {
    errors.value = [];
    errors.value.push('請確實填寫');
  } else {
    //取得本機儲存使用者id跟輸入的密碼送到後端驗證身分
    const userAcc = localStorage.getItem('userAcc');
    const userInfo = {
      Account: userAcc,
      EncryptedPassword: password.value,
    };

    axios
      .post(verifyUri, userInfo)
      .then((res) => {
        if (res.data) {
          verifyArea.value = false;
        }
      })
      .catch((err) => {
        errors.value = [];
        errors.value.push('密碼驗證錯誤');
        console.log(err);
      });
  }
}
function openEye() {
  eye.value = !eye.value;
}
</script>

<style scoped>
.eyeAndInput {
  position: relative;
}
.eye {
  position: absolute;
  right: 10px;
  top: 12%;
  font-size: 20px;
}
.pwdInput {
  padding-right: 50px;
}
.input {
  margin-bottom: 30px;
}
.verify {
  display: flex;

  border: solid 1px;
  padding: 30px;
}
.errorsText {
  display: flex;
  justify-content: center;
  padding: 0px;
  margin: 0px;
}
.sendBtn {
  background-color: black;
  color: white;
  width: 100%;
  border: 0;
}
.verifyText {
  height: 30px;
}
</style>
