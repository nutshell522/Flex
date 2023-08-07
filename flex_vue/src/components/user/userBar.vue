<template>
  <div class="container">
    <div class="user-menu">
      <ul class="userBar">
        <li>
          <a href="/user" @click="verifyAgain">個人資料</a>
        </li>

        <li><a href="/orders">訂單查詢/申請退貨</a></li>

        <li><a href="javascript:;">收藏清單/購買清單</a></li>

        <li><a href="javascript:;">積分中心</a></li>

        <li><a href="javascript:;">優惠券</a></li>

        <li><a href="javascript:;">瀏覽紀錄</a></li>

        <li><a href="javascript:;">購物車</a></li>
      </ul>
    </div>
  </div>
  <!-- <verify></verify> -->
</template>

<script>
import verify from '@/components/user/verify.vue';

export default {
  methods: {
    verifyAgain() {
      alert('要替換成再次驗證的畫面還沒出來!');
      //this.verify = true;
    },
  },
};
</script>

<style>
.user-menu ul {
  background-color: #f5f5f5;
  border-bottom: solid 1px lightgray;
  padding: 15px;
  display: flex;
}
.userBar {
  padding: 20px;
  justify-content: center;
}

.userBar li {
  margin-right: 50px;
}
</style>
