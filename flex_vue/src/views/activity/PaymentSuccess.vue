<template>
    <h1>付款成功! 以下為您的訂單資訊</h1>
    <div class="mb-3">
        <label class="form-label">訂單編號</label>
        <p>{{ tradeNo }}</p>
    </div>

    <div class="mb-3">
        <label class="form-label">商品名稱</label>
        <p>{{ tradeDesc }}</p>
    </div>

    <div class="mb-3 custom-box">
        <label class="form-label">付款金額</label>
        <p class="payment-amount">{{ tradeAmt }}</p>
    </div>

    <img
        src="https://cdn.hk01.com/di/media/images/dw/20210118/427914059518578688461039.jpeg/4EYbwJjzvRjT_jNs0sj5UhccbNTwg5brmVXzx5lV88c?v=w1920">
    <a href="https://localhost:8080/activityIndex" class="custom-button">返回活動頁面</a>
</template>
    
<script setup>
import { onMounted, reactive, ref } from 'vue';
import { useRoute } from 'vue-router';
const route = useRoute();
const tradeAmt = ref(route.params.TradeAmt);
const tradeNo = ref(route.params.TradeNo);
const tradeDesc = ref(route.params.ActivityName);








</script>

    
<style>
.custom-button {
    display: inline-block;
    padding: 10px 20px;
    background-color: rgb(7, 7, 114);
    color: white;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.custom-button:hover {
    background-color: rgb(82, 82, 255);
}
</style>