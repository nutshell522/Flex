<template>
  <div id="bg"></div>
  <ShoesnavBar></ShoesnavBar>
  <div id="banner">
    <div class="cover">
      <div class="title">BRING</div>
      <div class="title">INSPIRATION</div>
      <div class="title"></div>
    </div>
  </div>
  <homeFooter></homeFooter>
</template>
  
<script setup>
import ShoesnavBar from "@/components/customeShoes/ShoesnavBar.vue";
import homeFooter from "@/components/home/footer.vue";
</script>
  
<style scoped lang="scss">
#bg {
  background: rgba($color: #000000, $alpha: 1);
  position: fixed;
  top: 0;
  left: 0;
  height: 100vh;
  width: 100vw;
  z-index: -50;
}
#banner {
  width: 100vw;
  height: 200vh;
  background-color: rgba($color: #000000, $alpha: 0.4);
  .title {
    font-size: 130px;
    color: #fff;
  }
}
</style>