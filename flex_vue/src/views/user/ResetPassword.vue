<template>
  <div class="container area">
    <div class="title">
      <h4>重新設定密碼</h4>
    </div>
    <div class="from-group">
      <ul class="mb-4 errorsText">
        <span v-for="error in errors" class="text-danger">{{ error }}</span>
      </ul>
    </div>
    <label for="resetPwd">新設密碼</label>
    <div class="eyeAndInput">
      <input
        :type="eye1 ? 'text' : 'password'"
        class="form-control mb-3"
        name="resetPwd"
        id="resetPwd"
        placeholder="輸入6-10碼英數字"
        v-model="resetPwd"
        maxlength="10"
      />
      <div class="eye1" @click="openEye1">
        <i class="bi" :class="eye1 ? 'bi-eye' : 'bi-eye-slash'"></i>
      </div>
    </div>
    <div class="eyeAndInput">
      <label for="confirmPwd">確認密碼</label>
      <input
        :type="eye2 ? 'text' : 'password'"
        class="form-control mb-3"
        name="confirmPwd"
        id="confirmPwd"
        placeholder="輸入6-10碼英數字"
        v-model="confirmPwd"
        maxlength="10"
      />
      <div class="eye2" @click="openEye2">
        <i class="bi" :class="eye2 ? 'bi-eye' : 'bi-eye-slash'"></i>
      </div>
    </div>
    <div class="finish">
      <button type="submit" class="btn finishBtn" @click="finish">
        完成設定
      </button>
    </div>
  </div>
</template>

<script setup>
import router from '@/router/index.js';
import { ref } from 'vue';
import axios from 'axios';
import { useRoute } from 'vue-router';

const route = useRoute();
const errors = ref([]);
const resetPwd = ref('');
const confirmPwd = ref('');
const eye1 = ref(false);
const eye2 = ref(false);
const pwdRegex = /^(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]{6,10})$/;
const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const uri = `${baseAddress}api/Users/ResetPassword?memberId=${route.query.memberId}&confirmCode=${route.query.confirmCode}`;

function openEye1() {
  eye1.value = !eye1.value;
}

function openEye2() {
  eye2.value = !eye2.value;
}
function finish() {
  //欄位驗證
  if (resetPwd.value == '' || confirmPwd.value == '') {
    errors.value = [];
    errors.value.push('請確實填寫');
  } else if (
    !pwdRegex.test(resetPwd.value) ||
    !pwdRegex.test(confirmPwd.value)
  ) {
    errors.value = [];
    errors.value.push('新設密碼或確認密碼格式錯誤');
  } else if (resetPwd.value != confirmPwd.value) {
    errors.value = [];
    errors.value.push('新設密碼或確認密碼必須相同');
  } else {
    //欄位驗證通過
    errors.value = [];
    const resetPassword = {
      password: resetPwd.value,
      confirmPassword: confirmPwd.value,
    };
    axios
      .post(uri, resetPassword)
      .then((res) => {
        console.log('重新設定密碼成功', res);
        window.location.href = '/login';
      })
      .catch((err) => {
        console.log(err);
      });
  }
}
</script>

<style scoped>
.title {
  display: flex;
  justify-content: center;
}
.area {
  border: 1px solid;
  max-width: 20%;
  padding: 30px;
  margin-top: 200px;
}
.resetPwd {
  margin-bottom: 5px;
}
.finish {
  margin-bottom: 10px;
  display: flex;
  justify-content: center;
}
.text {
  margin-bottom: 10px;
}
.errorsText {
  display: flex;
  justify-content: center;
  padding: 0px;
  margin: 0px;
}
.finishBtn {
  background-color: #bb3e20;
  color: white;
}
.eye1 {
  position: absolute;
  right: 4%;
  top: 8%;
  font-size: 20px;
}

.eye2 {
  position: absolute;
  right: 4%;
  top: 45%;
  font-size: 20px;
}
.eyeAndInput {
  position: relative;
}
</style>
