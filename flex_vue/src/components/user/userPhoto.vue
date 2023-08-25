<template>
  <div v-if="userPhoto" class="userBox">
    <img :src="imageSrc + imgPath" class="userPhoto" />
    <div class="userName">Hi~Hi~ {{ userName }}</div>
  </div>
</template>

<script setup>
import { ref } from 'vue';

const imageSrc = ref('./../../../public/imgs/');
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
}
</script>

<style scoped>
.userPhoto {
  width: 50px;
  height: 50px;
  border-radius: 50%;
}
.userBox {
  position: relative;
  display: flex;
  align-items: center;
}
.userName {
  position: absolute;
  left: 60px;
  width: 150px;
}
</style>
