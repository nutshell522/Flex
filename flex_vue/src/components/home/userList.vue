<template>
  <div class="list">
    <div class="user-photo-container">
      <h3>你好</h3>
    </div>
    <ul class="userList-items">
      <li class="mb-2"><router-link to="/user">個人資料</router-link></li>

      <li class="mb-2"><a href="/orders">訂單查詢/申請退貨</a></li>

      <li class="mb-2"><router-link to="/favorites">收藏清單</router-link></li>

      <!-- <li class="mb-2"><a href="javascript:;">積分中心</a></li>

      <li class="mb-2"><router-link to="/coupon">優惠券</router-link></li>

      <li class="mb-2"><a href="javascript:;">瀏覽紀錄</a></li> -->

      <!-- <li class="mb-2"><a href="javascript:;">購物車</a></li> -->
    </ul>
    <button class="logout" type="submit" @click="logout">登出</button>
  </div>
</template>

<script setup>
import { storeToRefs } from 'pinia';
import { useGetApiDataStore } from '@/stores/useGetApiDataStore.js';
const getApiStore = useGetApiDataStore();
const { handleLogout } = getApiStore; //function透過store取資料

//登出
function logout() {
  localStorage.removeItem('loggedInUser');
  localStorage.removeItem('updateUserPhoto');
  handleLogout();
}
</script>

<style scoped>
.list {
  background-color: #fff;
  z-index: 5000;
  border: solid 2px;
  position: absolute;
  right: 0;
  top: 100%;
  padding-left: 30px;
  padding-right: 30px;
}

.userList-items {
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 0;
  margin: 0;
}

.user-photo-container {
  height: 45px;
}

.user-photo-container h3 {
  margin-left: 10px;
  font-size: 25px;
  color: #444;
}

.userList-items li:not(:last-child) {
  border-bottom: 1px solid gray;
  /* height: 23px; */
}

.userList-items li a {
  white-space: nowrap;
  display: block;
  padding: 5px 0;
}

.userList-items li a:hover {
  color: #777;
}

.logout {
  width: 180px;
  border: solid 1px;
  padding: 5px 0;
}

.logout:hover {
  background-color: black;
  color: white;
}
</style>
