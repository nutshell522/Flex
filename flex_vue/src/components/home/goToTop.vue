<template>
  <a class="returnTop" v-show="goToTop" href="#">
    <i class="bi bi-chevron-up"></i>
  </a>
</template>

<script setup>
import { onMounted, onUnmounted, ref } from "vue";
const goToTop = ref(false);

const handlerGoToTop = () => {
  goToTop.value = window.scrollY > 100;
};
onMounted(() => {
  window.addEventListener("scroll", handlerGoToTop);
});
onUnmounted(() => {
  window.removeEventListener("scroll", handlerGoToTop);
});
</script>

<style scoped>
.returnTop {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  background-color: rgba(233, 233, 233, 0.7);
  position: fixed;
  bottom: 5%;
  right: 3%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 30px;
  z-index: 200;
}
</style>
