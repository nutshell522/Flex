<template>
  <div class="container verify">
    <div class="col-md-6 pwdInput">
      <div class="mb-1">
        <label for="verify">會員驗證</label>
      </div>
      <div class="from-group">
        <ul class="mb-3 errorsText">
          <span v-for="error in errors" class="text-danger">{{ error }}</span>
        </ul>
      </div>
      <input
        type="text"
        class="form-control input"
        id="verify"
        placeholder="請輸入登入密碼"
        v-model="password"
      />
      <button type="button" class="btn btn-info" @click="send">送出</button>
    </div>
    <div class="col-md-6">
      <div>
        <label for="">個人安全資料認證</label>
      </div>
      <div class="mt-5">
        <label for="">為了保障您的資料安全， 必須再次填入密碼驗證。</label>
      </div>
    </div>
    <button type="button">
      <i class="bi bi-plus-square-fill icon-size" @click="close"></i>
    </button>
  </div>
</template>

<script setup>
import { ref, defineProps } from 'vue';
import axios from 'axios';

const errors = ref([]);
//const props = defineProps(['password']);
const password = ref(null);

const baseAddress = 'https://localhost:7183/api';
const verifyUri = `${baseAddress}/Users/Verify`;

function send() {
  //alert('send');
  if (!password.value) {
    errors.value = [];
    errors.value.push('填啦填啦');
  } else {
    //取得本機儲存使用者id跟輸入的密碼送到後端驗證身分
    const userAcc = localStorage.getItem('userAcc');
    const userInfo = {
      Account: userAcc,
      EncryptedPassword: password.value,
    };
    //console.log('userInfo', userInfo);

    axios
      .post(verifyUri, userInfo)
      .then((res) => {
        console.log(res.data);
      })
      .catch((err) => {
        console.log(err);
      });
  }
}
function close() {
  //alert('close');
}
</script>

<style scoped>
.pwdInput {
  margin: auto;
  margin-right: 60px;
}
.input {
  margin-bottom: 30px;
}
.verify {
  width: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  border: solid 1px;
  padding: 50px;
  background-color: #fff;
}
.errorsText {
  display: flex;
  justify-content: center;
  padding: 0px;
  margin: 0px;
}
</style>
