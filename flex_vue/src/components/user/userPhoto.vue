<template>
  <div v-if="userPhoto" class="userBox">
    <img :src="imageSrc + 'Public/UserImgs/' + imgPath" class="userPhoto" />
    <div class="userName">{{ userName }}</div>
  </div>
</template>

<script setup>
import { ref, watch, onMounted } from 'vue';

const imageSrc = import.meta.env.VITE_API_BASEADDRESS;
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

onMounted(() => {
  imgPath.value = localStorage.getItem('updateUserPhoto') || imgPath.value;
});

watch(
  () => localStorage.getItem('updateUserPhoto'),
  (newPath) => {
    // 更新用户照片路徑
    imgPath.value = newPath; // 使用 imgPath.value 来修改 ref 的值
  }
);
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
  left: 50px;
  width: 150px;
}
</style>
