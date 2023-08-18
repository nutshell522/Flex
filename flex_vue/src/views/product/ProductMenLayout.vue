<template>
  <navBar></navBar>
  <div class="container mt-4">
    <div class="row">
      <div class="nav-category">
        <categoryNavBar style="position: relative"></categoryNavBar>
        <searchPrice
          style="position: absolute; top: 460px; width: 140px"
        ></searchPrice>
      </div>
      <router-view></router-view>
    </div>
  </div>
  <a v-show="goToTop" class="returnTop" href="#"
    ><i class="bi bi-chevron-up"></i
  ></a>
</template>

<script setup>
import { onMounted, onUnmounted, ref } from "vue";
import navBar from "@/components/home/navBar.vue";
import categoryNavBar from "@/components/product/CategoryNavBar.vue";
import searchPrice from "@/components/product/SearchPrice.vue";
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
}
</style>
