<template>
  <div class="user" v-if="userPhoto">
    <img :src="imageSrc + imgPath" class="userPhoto" />
    <div class="">Hi~Hi~ {{ userName }}</div>
  </div>
</template>

<script setup>
import { ref } from 'vue';

const imageSrc = ref('./../../../public/imgs/'); // 預設圖片路徑
const userPhoto = ref(false);

const loggedInUser = localStorage.getItem('loggedInUser');
const userObject = JSON.parse(loggedInUser);
const imgPath = ref(
  userObject && userObject.memberPhoto ? userObject.memberPhoto : ''
);

let userName = null;
if (userObject) {
  userPhoto.value = true;
  userName = ref(userObject.username ? userObject.username : null);
  console.log(userName.value);
}
</script>

<style scoped>
.user {
  border-radius: 50%;
  position: fixed;
  top: 25%;
  right: 1%;
  font-size: 20px;
}
.userPhoto {
  width: 80px;
  height: 80px;
  border-radius: 50%;
}
</style>
