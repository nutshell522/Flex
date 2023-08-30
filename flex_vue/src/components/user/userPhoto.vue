<template>
  <div v-if="userPhoto" class="userBox" :style="computedStyles">
    <img :src="imageSrc + 'Public/UserImgs/' + imgPath" class="userPhoto" />
  </div>
</template>

<script setup>
import { ref, computed, watch, onMounted } from 'vue';

const imageSrc = import.meta.env.VITE_API_BASEADDRESS;
const userPhoto = ref(false);
const loggedInUser = localStorage.getItem('loggedInUser');
const userObject = JSON.parse(loggedInUser);
const imgPath = ref(
  userObject && userObject.memberPhoto ? userObject.memberPhoto : ''
);
const updateUserPhotoStorage = ref();

if (userObject) {
  userPhoto.value = true;
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



// 照片預設50寬高，有傳入則用傳入的值
const props = defineProps({
  width: {
    type: Number,
    default: 50
  },
  height: {
    type: Number,
    default: 50
  }
});
const computedStyles = computed(() => ({
  width: `${props.width}px`,
  height: `${props.height}px`
}));
</script>

<style scoped>
.userPhoto {
  border-radius: 50%;
  overflow: hidden;
  object-fit: cover;
}

img {
  width: 100%;
  height: 100%;
}
</style>
