<template>
  <div class="container area">
    <div class="title">
      <h4>重新設定密碼</h4>
    </div>
    <div class="from-group">
      <ul class="mb-3 errorsText">
        <span v-for="error in errors" class="text-danger">{{ error }}</span>
      </ul>
    </div>
    <label for="resetPwd">新設密碼</label>
    <input
      type="text"
      class="form-control mb-3"
      name="resetPwd"
      id="resetPwd"
      placeholder="輸入6-10碼英數字"
      v-model="resetPwd"
      maxlength="10"
    />
    <label for="confirmPwd">確認密碼</label>
    <input
      type="text"
      class="form-control mb-3"
      name="confirmPwd"
      id="confirmPwd"
      placeholder="輸入6-10碼英數字"
      v-model="confirmPwd"
      maxlength="10"
    />
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
const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const uri = `${baseAddress}api/Users/ResetPassword?memberId=${route.query.memberId}&confirmCode=${route.query.confirmCode}`;

function finish() {
  //欄位驗證
  if (resetPwd.value == '' || confirmPwd.value == '') {
    errors.value = [];
    errors.value.push('請確實填寫');
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
</style>
