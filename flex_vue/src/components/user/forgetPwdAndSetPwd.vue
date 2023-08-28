<template>
  <div class="container area" v-if="forgetArea">
    <div class="checkText">
      <label for="">請至 {{ props.email }} 信箱收取驗證信</label>
    </div>
    <div class="from-group">
      <ul class="mb-3 errorsText">
        <span v-for="error in errors" class="text-danger">{{ error }}</span>
      </ul>
    </div>
    <!-- <div class="text">
      <label for="checkNum">驗證碼</label>
    </div>
    <input
      type="text"
      class="form-control mb-3"
      name="checkNum"
      placeholder="請輸入4位驗證碼"
      v-model="checkNum"
    /> -->
    <!-- <div class="nextBtn">
      <button type="submit" class="btn btn-info" @click="nextBtn">
        下一步
      </button>
    </div> -->
    <div class="checkText">
      <label for="">沒收到驗證信 ?</label>
    </div>
  </div>
</template>

<script setup>
import router from '@/router/index.js';
import { ref, onMounted, defineProps } from 'vue';

const props = defineProps(['email']);
const userAcc = ref(null);
onMounted(() => {
  //localStorage抓登入使用者
  userAcc.value = localStorage.getItem('userAcc');
  //把帳號傳到後端
  //把信箱傳入
  //把信箱顯示
});

const errors = ref([]);
const checkNum = ref('');
const reset = ref(false);
const forgetArea = ref(true);

function nextBtn() {
  reset.value = true;
  window.location.reload();
}
</script>

<style scoped>
.area {
  border: 1px solid;
  max-width: 23%;
  padding: 30px;
  margin-top: 200px;
}
.checkNum {
  margin-bottom: 5px;
}
.nextBtn {
  margin-bottom: 10px;
  display: flex;
  justify-content: center;
}
.text {
  margin-bottom: 10px;
}
.checkText {
  margin-bottom: 30px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.errorsText {
  display: flex;
  justify-content: center;
  padding: 0px;
  margin: 0px;
}
</style>
