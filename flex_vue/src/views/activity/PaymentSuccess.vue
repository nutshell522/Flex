<template>
  <NavBar></NavBar>
  <div class="payBlock">
    <div class="row">
      <h1>付款成功! 以下為您的訂單資訊</h1>

      <div class="mb-3">
        <div class="infoContainer">
          <label class="form-label">訂單編號</label>
          <p>{{ tradeNo }}</p>
        </div>
      </div>

      <div class="mb-3">
        <label class="form-label">商品名稱</label>
        <p>{{ tradeDesc }}</p>
      </div>

      <div class="mb-3 custom-box">
        <label class="form-label">付款金額</label>
        <p class="payment-amount">{{ tradeAmt }}</p>
      </div>
      <div class="button-container">
        <a href="https://localhost:8080/activityIndex" class="custom-button"
          >返回活動首頁</a
        >
      </div>
    </div>
  </div>
  <HomeFooter></HomeFooter>
</template>
    
<script setup>
import NavBar from "@/components/activity/ActivityNav.vue";
import HomeFooter from "@/components/home/footer.vue";
import { onMounted, reactive, ref } from "vue";
import { useRoute } from "vue-router";
const route = useRoute();
const tradeAmt = ref(route.params.TradeAmt);
const tradeNo = ref(route.params.TradeNo);
const tradeDesc = ref(route.params.ActivityName);
</script>

    
<style>
.custom-button {
  width: 150px;
  display: inline-block;
  padding: 10px 20px;
  background-color: rgb(7, 7, 114);
  color: white;
  text-decoration: none;
  border-radius: 5px;
  transition: background-color 0.3s ease;
  position: relative;
}

.custom-button:hover {
  background-color: rgb(82, 82, 255);
}

.button-container {
  display: flex;
  justify-content: center;
  margin-bottom: 10px;
}

.payBlock {
  border: 1px black solid;
  margin-top: 3%;
  margin-left: 25%;
  margin-right: 25%;
  display: flex;
  text-align: center;
  justify-content: center;
  align-items: center;
}
</style>