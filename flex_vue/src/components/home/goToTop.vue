<template>
  <div class="returnTop" v-show="goToTop">
    <a href="#"><i class="bi bi-chevron-up"></i></a>
  </div>
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

<style>
.returnTop {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  background-color: rgba(233, 233, 233, 0.5);
  position: fixed;
  bottom: 5%;
  right: 3%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 30px;
  border: 1px solid rgb(197, 197, 197);
}
</style>
