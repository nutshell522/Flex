<template>
  <div v-if="userPhoto" class="userBox" :style="computedStyles">
    <img :src="imageSrc + 'Public/UserImgs/' + imgPath" class="userPhoto" />
  </div>
</template>

<script setup>
import { ref, computed } from 'vue';

const imageSrc = import.meta.env.VITE_API_BASEADDRESS;
const userPhoto = ref(false);
const loggedInUser = localStorage.getItem('loggedInUser');
const userObject = JSON.parse(loggedInUser);
const imgPath = ref(
  userObject && userObject.memberPhoto ? userObject.memberPhoto : ''
);
if (userObject) {
  userPhoto.value = true;
}

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
}
</style>
