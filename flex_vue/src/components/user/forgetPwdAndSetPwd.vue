<template>
  <div class="container area">
    <div class="checkText">
      <label for="">請至..{{ email }}..信箱收取驗證信</label>
    </div>
    <div class="text">
      <label for="checkNum">驗證碼</label>
    </div>
    <input
      type="text"
      class="form-control mb-3"
      name="checkNum"
      placeholder="請輸入4位驗證碼"
      v-model="checkNum"
    />
    <div class="nextBtn">
      <button type="submit" class="btn btn-info" @click="nextBtn">
        下一步
      </button>
    </div>
    <div class="checkText">
      <label for="">沒收到驗證信 ?</label>
    </div>
  </div>
</template>

<script setup>
import router from '@/router/index.js';

//const email = ref('sheluckys4@gmail.com');
function nextBtn() {
  const checkNum = ref('');
  //alert('next');
  //驗證碼正確
  //進入重新設定密碼

  //新密碼設定密碼完成，導入登入畫面
  router.push({ path: '/login' });
  //驗證碼錯誤重新寄發
  //回到驗整碼畫面
}
</script>

<style scoped>
.area {
  border: 1px solid;
  max-width: 20%;
  padding: 30px;
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
</style>
