<template>
  <div class="list">
    <ul class="userList-items">
      <li class="mb-1"><a href="/user">個人資料</a></li>

      <li class="mb-1"><a href="/orders">訂單查詢/申請退貨</a></li>

      <li class="mb-1"><a href="javascript:;">收藏清單/購買清單</a></li>

      <li class="mb-1"><a href="javascript:;">積分中心</a></li>

      <li class="mb-1"><a href="javascript:;">優惠券</a></li>

      <li class="mb-1"><a href="javascript:;">瀏覽紀錄</a></li>

      <li class="mb-3"><a href="javascript:;">購物車</a></li>
    </ul>
    <button class="logout" type="submit">登出</button>
  </div>
</template>

<script setup></script>

<style>
.list {
  background-color: #fff;
  z-index: 9999;
  /* 設置較大的 z-index 值 */
  border: solid 2px;
  position: absolute;
  right: 0;
  top: 100%;
  padding: 20px 40px;
}

.userList-items {
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 0;
  margin: 0;
}

.userList-items li:not(:last-child) {
  border-bottom: 1px solid gray;
}

.userList-items li a {
  white-space: nowrap;
}

.logout {
  width: 200px;
  border: solid 1px;
}

.logout:hover {
  background-color: black;
  color: white;
}
</style>
