<template>
  <OrdernavBar></OrdernavBar>
  <div id="cate" class="container">
    <button @click="setKeywordValue('1')">商品</button>

    <button @click="setKeywordValue('4')">客製化</button>

    <button @click="setKeywordValue('2')">活動</button>

    <button @click="setKeywordValue('3')">課程</button>
  </div>
  <div class="container">
    <table class="table table-striped table-hover" style="width: 80%">
      <thead>
        <tr>
          <th>訂單日期</th>
          <th>訂單編號</th>
          <th>總數量</th>
          <th>總金額</th>
          <th>付款方式</th>
          <th>發票編號</th>
          <th>訂單狀態</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in GetOrders" :key="item.id">
          <td>{{ formatOrderTime(item.ordertime) }}</td>
          <td>{{ item.id }}</td>
          <td>{{ item.total_quantity }}</td>
          <td>{{ item.total_price }}</td>
          <td>{{ item.pay_method }}</td>
          <td>{{ item.receipt }}</td>
          <td>{{ item.order_status }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<script setup>
import OrdernavBar from "@/components/Order/OrdernavBar.vue";
import { ref, onMounted } from "vue";
import axios from "axios";

const GetOrders = ref([]);
const keyword = ref("");

const loadGetOrders = async () => {
  await axios
    .get(`https://localhost:7183/api/Orders/GetOrders?typeId=${keyword.value}`)
    .then((response) => {
      //console.log(response.data);
      GetOrders.value = response.data;
    })
    .catch((error) => {
      alert(error);
    });
};
const formatOrderTime = (ordertime) => {
  const dateTimeObject = new Date(ordertime);
  const year = dateTimeObject.getFullYear();
  const month = (dateTimeObject.getMonth() + 1).toString().padStart(2, "0");
  const dates = dateTimeObject.getDate().toString().padStart(2, "0");
  const hours = dateTimeObject.getHours().toString().padStart(2, "0");
  const minutes = dateTimeObject.getMinutes().toString().padStart(2, "0");
  return year + "-" + month + "-" + dates + " " + hours + ":" + minutes + "";
};
const setKeywordValue = (paramValue) => {
  keyword.value = paramValue;
  loadGetOrders();
};
onMounted(() => {
  loadGetOrders();
});
</script>
<style scoped>
.table > thead > tr > th {
  background-color: maroon;
  color: white;
  text-align: center;
}

.table > tbody > tr > td {
  text-align: center;
}

#cate > button {
  text-align: center;
  padding-right: 20px;
  margin-right: 80px;
  font-size: 30px;
}

#cate {
  background-color: antiquewhite;
  text-align: center;
  width: 60%;
}
</style>
