<template>
  <!-- 上傳圖片 -->
  <div class="col-md-6">
    <div class="userImg">
      <div>
        <img src="./../../../public/imgs/member.jpg" alt="" />
        <input ref="photo" type="file" class="photo" @change="fileChange" />
      </div>
      <div>
        <button @click="uploadImages" class="btn btn-info changePhoto">
          選擇圖片
        </button>
      </div>
    </div>
    <!-- <div class="btn btn-info changePhoto">
        <button type="button" @click="changePhoto">選擇圖片</button>c
      </div> -->
  </div>
</template>

<script setup>
import { ref } from 'vue';

const photo = ref(null);

const fileChange = (e) => {
  console.log(e.target.files);
};
const uploadImages = () => {
  photo.value.click();
};
</script>

<style scoped>
.photo {
  position: fixed;
  top: -500px;
  left: -500;
}
.userImg {
  display: flex;
}
</style>
